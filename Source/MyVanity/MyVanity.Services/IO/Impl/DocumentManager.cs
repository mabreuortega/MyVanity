using System;
using System.Configuration;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.Storage;
using MyVanity.Domain;
using MyVanity.Services.Blobs;

namespace MyVanity.Services.IO
{
    public class DocumentManager : IDocumentManager
    {
        private readonly IBlobStore _store;

        public DocumentManager()
        {
            var account =
                CloudStorageAccount.Parse(ConfigurationManager.ConnectionStrings["StorageAccount"].ConnectionString);

            _store = new CloudBlobStore(account);
        }

        public Task<byte[]> GetAsync(Document document)
        {
            return _store.FindAsync(GetContainerByDocument(document), GetPathByDocument(document));
        }

        public Task SaveAsync(Document document, byte[] content)
        {
            return _store.SaveAsync(GetContainerByDocument(document), GetPathByDocument(document), content);
        }

        public Task DeleteAsync(Document document)
        {
            //TODO
            throw new System.NotImplementedException();
        }

        private static string GetContainerByDocument(Document document)
        {
            switch (document.Type)
            {
                case DocumentType.Attachment:
                    return "attachments";
                case DocumentType.Patient:
                    return "resources";
                case DocumentType.Shared:
                    return "shared";
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
        private static string GetPathByDocument(Document document)
        {
            var escaped = Uri.EscapeUriString(document.Name);

            switch (document.Type)
            {
                case DocumentType.Attachment:
                    return string.Format("{0}/{1}", ((MessageAttachment)document).MessageId, escaped);
                case DocumentType.Patient:
                    return string.Format("{0}/{1}", ((PatientDocument)document).PatientId, escaped);
                case DocumentType.Shared:
                    return escaped;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
    }
}