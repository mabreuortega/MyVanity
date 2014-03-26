using System.Configuration;
using System.Reflection;
using System.Web.Mvc;
using Autofac;
using Autofac.Builder;
using Autofac.Integration.Mvc;
using Microsoft.WindowsAzure.Storage;
using MyVanity.Common.Autofac;

namespace MyVanity.Web.Autofac
{
    public class MvcShell : Shell
    {
        public MvcShell(Assembly[] assemblies)
            : base(assemblies)
        {
        }

        protected override void SetPerRequestScope(IRegistrationBuilder<object, object, object> obj)
        {
            obj.InstancePerHttpRequest();
        }
        protected override void SetSingleInstanceScope(IRegistrationBuilder<object, object, object> obj)
        {
            obj.SingleInstance();
        }
        protected override void SetTransientScope(IRegistrationBuilder<object, object, object> obj)
        {
        }

        protected override void RegisterDependencies(ContainerBuilder builder)
        {
            base.RegisterDependencies(builder);

            builder.RegisterModule<AutofacWebTypesModule>();
            builder.RegisterControllers(Assembly.GetExecutingAssembly());

            builder
                .Register(c => CloudStorageAccount.Parse(ConfigurationManager.ConnectionStrings["StorageAccount"].ConnectionString))
                .InstancePerHttpRequest();
        }

        public void Register()
        {
            var container = BuildContainer();

            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}
