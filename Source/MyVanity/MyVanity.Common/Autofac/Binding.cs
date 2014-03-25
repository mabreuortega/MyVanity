using System;
using System.Linq;

namespace MyVanity.Common.Autofac
{
    class Binding
    {
        public Type Interface { get; set; }
        public Type Implementation { get; set; }
        public LifetimeAbbr Lifetime { get; set; }

        public bool IsGeneric
        {
            get
            {
                return Interface.IsGenericType && Implementation.IsGenericType;
            }
        }

        public Type MakeGenericInterface()
        {
            var genericType = Implementation.GetInterfaces().SingleOrDefault(i => i.IsGenericType && i.GetGenericTypeDefinition() == Interface);

            return (genericType != null)
                ? Interface.MakeGenericType(genericType.GenericTypeArguments)
                : Interface;
        }
    }
}