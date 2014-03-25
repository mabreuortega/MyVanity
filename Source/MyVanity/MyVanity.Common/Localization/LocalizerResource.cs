using System.Dynamic;
using MyVanity.Common.Autofac;

namespace MyVanity.Common.Localization
{
    public class LocalizerResource : DynamicObject
    {
        //[Inject]
        //public ILocalizationManager Manager { get; set; }

        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            //result = Manager.GetLocalizedString(null, binder.Name);
            result = binder.Name;
            return true;
        }
    }
}