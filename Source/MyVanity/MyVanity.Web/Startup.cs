using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyVanity.Web.Startup))]
namespace MyVanity.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
