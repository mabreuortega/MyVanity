using System.Globalization;
using System.Resources;

namespace MyVanity.Common.Localization
{
    public static class NullLocalizer
    {
        private static readonly Localizer NullInstance;

        static NullLocalizer()
        {
            NullInstance = (text, args) => new LocalizedString(text, args);
        }

        public static Localizer Instance
        {
            get
            {
                return NullInstance;
            }
        }
    }
}