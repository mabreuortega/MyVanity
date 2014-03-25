using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyVanity.Common.Autofac;
using MyVanity.Domain;
using MyVanity.Domain.Repositories;
using MyVanity.Views.Models;

namespace MyVanity.Views.Repositories
{
    public class UserViewsRepository : IUserViewsRepository
    {
        private readonly IUsersRepository _usersRepo;

        public UserViewsRepository(IUsersRepository usersRepo)
        {
            _usersRepo = usersRepo;
        }

        public Task<LoggedUserViewModel> GetLoggedViewAsync(int userId)
        {
            return
                _usersRepo
                    .FindAsync<User>(userId)
                    .ContinueWith(
                        t => new LoggedUserViewModel
                                 {
                                     Id = t.Result.Id,
                                     UserName = t.Result.UserName
                                 });
        }
    }
}
