using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyVanity.Services.Blobs
{
    public interface IBlobStore
    {
        Task<byte[]> FindAsync(string container, string path);

        Task SaveAsync(string container, string path, byte[] content);
        Task DeleteAsync(string container, string path);
    }
}
