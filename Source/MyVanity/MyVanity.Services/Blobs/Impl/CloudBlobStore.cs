using System;
using System.Diagnostics;
using System.IO;
/*using System.Threading.Tasks;
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
            return
                GetContainerReferenceAsync(container)
                    .ContinueWith(
                        t =>
                        {
                            var blobReference = t.Result.GetBlockBlobReference(path);
                            if (!blobReference.Exists())
                                return null;

                            using (var memory = new MemoryStream())
                            {
                                _readPolicy.ExecuteAction(() => blobReference.DownloadToStream(memory));
                                return memory.ToArray();
                            }
                        });
        }

        public Task SaveAsync(string container, string path, byte[] blob)
        {
            return
                GetContainerReferenceAsync(container)
                    .ContinueWith(
                        t =>
                        {
                            var blobReference = t.Result.GetBlockBlobReference(path);
                            _writePolicy.ExecuteAction(() => blobReference.UploadFromByteArray(blob, 0, blob.Length));
                        });
        }

        private async Task<CloudBlobContainer> GetContainerReferenceAsync(string container)
        {
            var containerReference = _client.GetContainerReference(container);
            await containerReference.CreateIfNotExistsAsync();
            return containerReference;
        }

        public Task DeleteAsync(string container, string path)
        {
            return
                GetContainerReferenceAsync(container)
                    .ContinueWith(
                        t =>
                        {
                            var blobReference = t.Result.GetBlockBlobReference(path);
                            _writePolicy.ExecuteAction(() => blobReference.DeleteIfExists());
                        });
        }
    }
}*/