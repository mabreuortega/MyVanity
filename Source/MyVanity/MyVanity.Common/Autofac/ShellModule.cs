using System.Linq;
using System.Reflection;
using Autofac;
using Autofac.Core;
using Module = Autofac.Module;

namespace MyVanity.Common.Autofac
{
    class ShellModule : Module
    {
        protected override void AttachToComponentRegistration(IComponentRegistry componentRegistry,
            IComponentRegistration registration)
        {
            registration.Activated += (sender, e) =>
            {
                var type = e.Instance.GetType();

                var properties = type
                    .GetProperties(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance)
                    .Where(p => p.GetCustomAttributes(typeof (InjectAttribute), true).Any());

                foreach (var property in properties)
                {
                    var obj = e.Context.Resolve(property.PropertyType);

                    property.SetValue(e.Instance, obj);
                }
            };
        }
    }
}