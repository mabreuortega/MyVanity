using System.Collections.Generic;
using System.Globalization;

namespace MyVanity.Common.Localization
{
    public interface ILocalizationManager
    {
        string GetLocalizedString(string scope, string text);
        IEnumerable<CultureInfo> InstalledCultures { get; }
    }
}