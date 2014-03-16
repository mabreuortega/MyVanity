using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyVanity.Web.Models;

namespace MyVanity.Web
{
    public static class AppInitializer
    {
        public static async void CreateAdminRole()
        {
            using (
                var roleManager =
                    new RoleManager<ApplicationRole>(new RoleStore<ApplicationRole>(new ApplicationDbContext())))
            {
                var adminRole = await roleManager.FindByNameAsync("Admin");
                if (adminRole != null)
                    return;

                adminRole = new ApplicationRole {Name = "Admin"};

                var createRoleResult = await roleManager.CreateAsync(adminRole);
                if (!createRoleResult.Succeeded)
                    throw new InvalidOperationException();
            }
        }
        public static async void CreateAdminUser()
        {
            using (
                var userManager =
                    new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
            {
                var adminUser = await userManager.FindByNameAsync("admin");
                if (adminUser == null)
                {
                    adminUser = new ApplicationUser {UserName = "admin"};

                    var createUserResult = await userManager.CreateAsync(adminUser, "@myv4n1ty.");
                    if (!createUserResult.Succeeded)
                        throw new InvalidOperationException();
                }

                var isInAdminRole = await userManager.IsInRoleAsync(adminUser.Id, "Admin");
                if (isInAdminRole)
                    return;

                var assignRoleResult = await userManager.AddToRoleAsync(adminUser.Id, "Admin");
                if (!assignRoleResult.Succeeded)
                    throw new InvalidOperationException();
            }
        }
    }
}