using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyVanity.Domain;
using MyVanity.Domain.Repositories;

namespace MyVanity.Services.Membership
{
    public class MembershipService : IMembershipService
    {
        private readonly ModelContainer _context;
        private readonly IUsersRepository _usersRepo;
        private readonly UserManager<ApplicationUser> _usersManager;
        private readonly RoleManager<IdentityRole> _rolesManager; 

        public MembershipService(ModelContainer context, IUsersRepository usersRepo)
        {
            _context = context;
            _usersRepo = usersRepo;

            var membershipContext = new MembershipDbContext();
            _usersManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(membershipContext));
            _rolesManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(membershipContext));

            foreach (ApplicationRole role in Enum.GetValues(typeof(ApplicationRole)))
                if (!_rolesManager.RoleExists(role.ToString()))
                    _rolesManager.Create(new IdentityRole(role.ToString()));
        }

        public Task<IdentityResult> CreateAsync(ApplicationUser user, ApplicationRole role)
        {
            return CreateAsync(_usersManager.CreateAsync(user), user, role);
        }

        public Task<IdentityResult> CreateAsync(ApplicationUser user, ApplicationRole role, string password)
        {
            return CreateAsync(_usersManager.CreateAsync(user, password), user, role);
        }

        public Task<ApplicationUser> FindAsync(string userName, string password)
        {
            return _usersManager.FindAsync(userName, password);
        }

        public Task<ApplicationUser> FindAsync(UserLoginInfo loginInfo)
        {
            return _usersManager.FindAsync(loginInfo);
        }

        public Task<IdentityResult> RemoveLoginAsync(string userId, UserLoginInfo loginInfo)
        {
            return _usersManager.RemoveLoginAsync(userId, loginInfo);
        }

        public Task<IdentityResult> ChangePasswordAsync(string userId, string oldPassword, string newPassword)
        {
            return _usersManager.ChangePasswordAsync(userId, oldPassword, newPassword);
        }

        public Task<IdentityResult> AddPasswordAsync(string userId, string newPassword)
        {
            return _usersManager.AddPasswordAsync(userId, newPassword);
        }

        public Task<IdentityResult> AddLoginAsync(string userId, UserLoginInfo loginInfo)
        {
            return _usersManager.AddLoginAsync(userId, loginInfo);
        }

        public IList<UserLoginInfo> GetLogins(string userId)
        {
            return _usersManager.GetLogins(userId);
        }

        public Task<ClaimsIdentity> CreateIdentityAsync(ApplicationUser user, ApplicationRole role, string authenticationType)
        {
            var dbUser = CreateDbUser(user.UserName, role);
            _usersRepo.Add(dbUser);

            return
                _context
                    .SaveChangesAsync()
                    .ContinueWith(
                        t =>
                        {
                            user.SetOwnerId(dbUser.Id);
                            return _usersManager.CreateIdentityAsync(user, authenticationType);
                        })
                    .ContinueWith(
                        t =>
                        {
                            _usersManager.AddToRoleAsync(user.Id, role.ToString());
                            return t.Result.Result;
                        });
        }

        public ApplicationUser FindById(string userId)
        {
            return _usersManager.FindById(userId);
        }

        public void Dispose()
        {
            _usersManager.Dispose();
            _rolesManager.Dispose();
        }

        private Task<IdentityResult> CreateAsync(Task<IdentityResult> creationOperation, ApplicationUser user, ApplicationRole role)
        {
            var dbUser = CreateDbUser(user.UserName, role);
            _usersRepo.Add(dbUser);

            try
            {
                return
                    _context
                        .SaveChangesAsync()
                        .ContinueWith(
                            t =>
                            {
                                user.SetOwnerId(dbUser.Id);
                                return creationOperation;
                            })
                        .ContinueWith(
                            t =>
                                t.Result.Result.Succeeded
                                    ? _usersManager.AddToRoleAsync(user.Id, role.ToString())
                                    : t.Result)
                        .ContinueWith(
                            t =>
                            {
                                if (!t.Result.Result.Succeeded)
                                    _usersRepo.Delete(dbUser);
                                return t.Result.Result;
                            });
            }
            catch (DbEntityValidationException ex)
            {
                throw ex;
            }
        }

        private static User CreateDbUser(string userName, ApplicationRole role)
        {
            User dbUser;
            switch (role)
            {
                case ApplicationRole.Admin:
                    dbUser = new Admin();
                    break;
                case ApplicationRole.Agent:
                    dbUser = new Agent();
                    break;
                case ApplicationRole.Patient:
                    dbUser = new Patient();
                    break;
                default:
                    throw new ArgumentOutOfRangeException("role");
            }
            
            dbUser.UserName = userName;
            return dbUser;
        }

    }
}