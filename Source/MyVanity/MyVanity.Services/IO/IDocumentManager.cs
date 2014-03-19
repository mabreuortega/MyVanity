using System.Threading.Tasks;
using MyVanity.Domain;

namespace MyVanity.Services.IO
{
    public interface IDocumentManager
    {
        Task<byte[]> GetAsync(Document document);

        Task SaveAsync(Document document, byte[] content);
        Task DeleteAsync(Document document);
    }
}