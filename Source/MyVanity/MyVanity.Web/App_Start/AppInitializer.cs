using System;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MyVanity.Services.Membership;
using MyVanity.Web.Models;

namespace MyVanity.Web
{
    public static class AppInitializer
    {
        public static async void CreateAdminUser()
        {
            var membershipService = DependencyResolver.Current.GetService<IMembershipService>();

            await membershipService.CreateAsync(new ApplicationUser("admin"), ApplicationRole.Admin, "admin123");
        }
    }
}