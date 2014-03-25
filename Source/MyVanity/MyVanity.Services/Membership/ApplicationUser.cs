using Microsoft.AspNet.Identity.EntityFramework;
using MyVanity.Domain;

namespace MyVanity.Services.Membership
{
    public class ApplicationUser : IdentityUser
    {
        public int OwnerId { get; protected set; }

        public ApplicationUser(string userName)
            : base(userName)
        {
        }

        protected ApplicationUser()
        {
        }

        internal void SetOwnerId(int ownerId)
        {
            OwnerId = ownerId;
        }
    }
}