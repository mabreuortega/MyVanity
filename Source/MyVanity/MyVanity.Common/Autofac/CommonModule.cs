using System.Collections.Concurrent;
using Autofac;
using Autofac.Core;
using MyVanity.Common.Localization;

namespace MyVanity.Common.Autofac
{
    public class CommonModule : Module
    {
        private readonly ConcurrentDictionary<string, Localizer> _localizerCache;

        public CommonModule()
        {
            _localizerCache = new ConcurrentDictionary<string, Localizer>();
        }

        protected override void AttachToComponentRegistration(IComponentRegistry componentRegistry, IComponentRegistration registration)
        {
            var localizerProperty = registration.Activator.LimitType.GetProperty("T", typeof(Localizer));
            if (localizerProperty == null)
                return;

            registration.Activated += 
                (sender, e) =>
                {
                    var localizer =
                        _localizerCache.GetOrAdd(registration.Activator.LimitType.FullName, key => NullLocalizer.Instance);
                    localizerProperty.SetValue(e.Instance, localizer, null);
                };
        }
    }
}