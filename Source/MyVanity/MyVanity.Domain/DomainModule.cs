using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using MyVanity.Domain.Repositories;
using Module = Autofac.Module;

namespace MyVanity.Domain
{
    public class DomainModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);

            builder
                .RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
                .AssignableTo<RepositoryBase>()
                .AsImplementedInterfaces();
        }
    }
}
