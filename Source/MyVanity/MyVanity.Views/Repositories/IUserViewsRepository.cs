using System.Threading.Tasks;
using MyVanity.Common.Autofac;
using MyVanity.Views.Models;

namespace MyVanity.Views.Repositories
{
    public interface IUserViewsRepository : IPerRequestDependency
    {
        Task<LoggedUserViewModel> GetLoggedViewAsync(int userId);
    }
}