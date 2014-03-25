
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyVanity.Web.Filters
{
    public class OnePerRequestFilterProvider<T> : IFilterProvider
    {
        public IEnumerable<Filter> GetFilters(ControllerContext controllerContext, ActionDescriptor actionDescriptor)
        {
            yield return new Filter(DependencyResolver.Current.GetService<T>(), FilterScope.Global, null);
        }
    }
}