using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyVanity.Common.Autofac;

namespace MyVanity.Domain.Repositories
{
    public interface IUsersRepository : IPerRequestDependency
    {
        IEnumerable<Admin> GetAdmins(int pageSize = int.MaxValue, int pageIndex = 0);
        IEnumerable<Agent> GetAgents(int pageSize = int.MaxValue, int pageIndex = 0);
        IEnumerable<Patient> GetPatients(int pageSize = int.MaxValue, int pageIndex = 0);

        Task<T> FindAsync<T>(int id) where T : User;

        void Add(User user);
        void Delete(User user);
    }
}
