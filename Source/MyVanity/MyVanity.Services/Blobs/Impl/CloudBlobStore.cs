using System;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.TransientFaultHandling;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.Storage.RetryPolicies;

namespace MyVanity.Services.Blobs
{
    public class CloudBlobStore : IBlobStore
    {
        private readonly CloudBlobClient _client;
        private readonly RetryPolicy<StorageTransientErrorDetectionStrategy> _readPolicy;
        private readonly RetryPolicy<StorageTransientErrorDetectionStrategy> _writePolicy;

        public CloudBlobStore(CloudStorageAccount account)
        {
            _client = account.CreateCloudBlobClient();
            _client.RetryPolicy = new NoRetry();

            _readPolicy = new RetryPolicy<StorageTransientErrorDetectionStrategy>(new Incremental(1, TimeSpan.FromMilliseconds(100), TimeSpan.FromSeconds(1)));
            _readPolicy.Retrying += (s, e) => Trace.TraceWarning("An error occurred in attempt number {1} to read from blob storage: {0}", e.LastException.Message, e.CurrentRetryCount);

            _writePolicy = new RetryPolicy<StorageTransientErrorDetectionStrategy>(new FixedInterval(1, TimeSpan.FromSeconds(10)) { FastFirstRetry = false });
            _writePolicy.Retrying += (s, e) => Trace.TraceWarning("An error occurred in attempt number {1} to write to blob storage: {0}", e.LastException.Message, e.CurrentRetryCount);
        }

        public Task<byte[]> FindAsync(string container, string path)
        {
            var containerReference = _client.GetContainerReference(container);
            var blobReference = containerReference.GetBlockBlobReference(path);

            return _readPolicy.ExecuteAsync(
                () =>
                {
                    if (!blobReference.Exists())
                        return null;


                    var memory = new MemoryStream();
                    return 
                        blobReference.DownloadToStreamAsync(memory)
                            .ContinueWith(
                                t =>
                                {
                                    var result = memory.ToArray();
                                    memory.Dispose();
                                    return result;
                                });
                });
        }

        public Task SaveAsync(string container, string path, byte[] blob)
        {
            var containerReference = _client.GetContainerReference(container);
            var blobReference = containerReference.GetBlockBlobReference(path);

            return _writePolicy.ExecuteAction(
                () =>
                {
                    return blobReference.UploadFromByteArrayAsync(blob, 0, blob.Length);
                });
        }

        public Task DeleteAsync(string container, string name)
        {
            var containerReference = _client.GetContainerReference(container);
            var blobReference = containerReference.GetBlockBlobReference(name);

            return _writePolicy.ExecuteAction(
                () => blobReference.DeleteIfExistsAsync());
        }
    }
}