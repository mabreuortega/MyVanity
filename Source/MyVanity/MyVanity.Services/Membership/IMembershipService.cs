using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using MyVanity.Common.Autofac;

namespace MyVanity.Services.Membership
{
    public interface IMembershipService : IPerRequestDependency, IDisposable
    {
        Task<IdentityResult> CreateAsync(ApplicationUser user, ApplicationRole role);
        Task<IdentityResult> CreateAsync(ApplicationUser user, ApplicationRole role, string password);
        Task<ApplicationUser> FindAsync(UserLoginInfo loginInfo);
        Task<ApplicationUser> FindAsync(string userName, string password);
        Task<IdentityResult> RemoveLoginAsync(string userId, UserLoginInfo loginInfo);
        Task<IdentityResult> ChangePasswordAsync(string userId, string oldPassword, string newPassword);
        Task<IdentityResult> AddPasswordAsync(string userId, string newPassword);
        Task<IdentityResult> AddLoginAsync(string userId, UserLoginInfo loginInfo);
        IList<UserLoginInfo> GetLogins(string userId);
        Task<ClaimsIdentity> CreateIdentityAsync(ApplicationUser user, ApplicationRole role, string authenticationType);
        ApplicationUser FindById(string userId);
    }
}
