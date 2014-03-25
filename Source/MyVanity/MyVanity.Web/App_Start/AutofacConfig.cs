using System.Reflection;
using MyVanity.Common.Autofac;
using MyVanity.Domain;
using MyVanity.Services.App;
using MyVanity.Views.Repositories;
using MyVanity.Web.Autofac;

namespace MyVanity.Web
{
    public class AutofacConfig
    {
        public static void Register()
        {
            var assemblies = new[]
                             {
                                 Assembly.GetExecutingAssembly(),                       // ui
                                 Assembly.GetAssembly(typeof(CommonModule)),            // common
                                 Assembly.GetAssembly(typeof(AppContext)),              // services
                                 Assembly.GetAssembly(typeof(ModelContainer)),          // domain
                                 Assembly.GetAssembly(typeof(UserViewsRepository)),         // adapters
                             };

            var shell = new MvcShell(assemblies);
            shell.Register();
        }
    }
}