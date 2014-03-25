using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyVanity.Domain.Repositories
{
    public class UsersRepository : RepositoryBase, IUsersRepository
    {
        public IEnumerable<Admin> GetAdmins(int pageSize = int.MaxValue, int pageIndex = 0)
        {
            return Context.Users.OfType<Admin>().OrderBy(t => t.UserName).Skip(pageSize*pageIndex).Take(pageSize);
        }

        public IEnumerable<Agent> GetAgents(int pageSize = int.MaxValue, int pageIndex = 0)
        {
            return Context.Users.OfType<Agent>().OrderBy(t => t.UserName).Skip(pageSize * pageIndex).Take(pageSize);
        }

        public IEnumerable<Patient> GetPatients(int pageSize = int.MaxValue, int pageIndex = 0)
        {
            return Context.Users.OfType<Patient>().OrderBy(t => t.UserName).Skip(pageSize * pageIndex).Take(pageSize);
        }

        public Task<T> FindAsync<T>(int id) where T : User
        {
            return Context.Users.FindAsync(id).ContinueWith(t => t.Result as T);
        }

        public void Add(User user)
        {
            Context.Users.Add(user);
        }
        public void Delete(User user)
        {
            Context.Users.Remove(user);
        }
    }
}