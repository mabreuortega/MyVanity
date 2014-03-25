using Microsoft.AspNet.Identity.EntityFramework;

namespace MyVanity.Services.Membership
{
    public class MembershipDbContext : IdentityDbContext<ApplicationUser>
    {
        public MembershipDbContext()
            : base("DefaultConnection")
        {
        }
    }
}