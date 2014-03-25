using System.Web;
using System.Web.Mvc;
using MyVanity.Web.Filters;

namespace MyVanity.Web
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());

            FilterProviders.Providers.Add(new OnePerRequestFilterProvider<TransactionFilter>());
        }
    }
}
