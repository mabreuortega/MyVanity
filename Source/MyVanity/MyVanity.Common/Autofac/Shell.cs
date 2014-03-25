using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Autofac;
using Autofac.Builder;
using Module = Autofac.Module;

namespace MyVanity.Common.Autofac
{
    public abstract class Shell
    {
        private readonly IEnumerable<Module> _modules;
        private readonly IEnumerable<Type> _types;

        protected Shell(Assembly[] assemblies)
        {
            _modules = assemblies.SelectMany(LoadModules);
            _types = assemblies.SelectMany(a => a.GetTypes());
        }

        protected Shell(IEnumerable<Type> moduleTypes, IEnumerable<Type> types)
        {
            _modules = LoadModules(moduleTypes);
            _types = types;
        }

        private void RegisterDependency(ContainerBuilder builder, Binding binding)
        {
            IRegistrationBuilder<object, object, object> obj;

            if (binding.IsGeneric)
            {
                obj = builder.RegisterGeneric(binding.Implementation).As(binding.Interface);
            }
            else
            {
                var @interface = binding.MakeGenericInterface();

                obj = builder.RegisterType(binding.Implementation).As(@interface);
            }

            switch (binding.Lifetime)
            {
                case LifetimeAbbr.Transient:
                    SetTransientScope(obj);
                    break;
                case LifetimeAbbr.SingleInstace:
                    SetSingleInstanceScope(obj);
                    break;
                case LifetimeAbbr.PerWebRequest:
                    SetPerRequestScope(obj);
                    break;
            }
        }

        protected abstract void SetPerRequestScope(IRegistrationBuilder<object, object, object> obj);
        protected abstract void SetSingleInstanceScope(IRegistrationBuilder<object, object, object> obj);
        protected abstract void SetTransientScope(IRegistrationBuilder<object, object, object> obj);

        protected virtual void RegisterDependencies(ContainerBuilder builder)
        {
            foreach (var module in _modules)
            {
                builder.RegisterModule(module);
            }

            var bindings = 
                LoadBindings<IPerRequestDependency>(LifetimeAbbr.PerWebRequest).Concat(
                LoadBindings<ISingleInstanceDependency>(LifetimeAbbr.SingleInstace).Concat(
                LoadBindings<ITransientDependency>(LifetimeAbbr.Transient)));

            foreach (var binding in bindings)
            {
                RegisterDependency(builder, binding);
            }
        }

        public virtual IContainer BuildContainer()
        {
            var containerBuilder = new ContainerBuilder();
            RegisterDependencies(containerBuilder);

            containerBuilder.RegisterModule<ShellModule>();
            var container = containerBuilder.Build();
            return container;
        }

        private IEnumerable<Module> LoadModules(Assembly assembly)
        {
            var modules = assembly.GetTypes().Where(t => typeof(Module).IsAssignableFrom(t));
            return LoadModules(modules);
        }
        private IEnumerable<Module> LoadModules(IEnumerable<Type> types)
        {
            return types.Select(Activator.CreateInstance).Cast<Module>();
        }

        private IEnumerable<Binding> LoadBindings<TInterface>(LifetimeAbbr lifetime)
        {
            var interfaces = 
                _types
                    .Where(t => typeof(TInterface).IsAssignableFrom(t))
                    .Where(t => typeof(TInterface) != t);

            foreach (var @interface in interfaces)
            {
                var implementations = 
                    _types
                        .Where(t => !t.IsAbstract)
                        .Where(t => @interface.IsAssignableFrom(t) ||
                                    t.GetInterfaces().Any(i => i.IsGenericType && i.GetGenericTypeDefinition() == @interface));

                foreach (var implementation in implementations)
                    yield return 
                        new Binding
                            {
                                Interface = @interface,
                                Implementation = implementation,
                                Lifetime = lifetime
                            };

            }
        }
    }
}