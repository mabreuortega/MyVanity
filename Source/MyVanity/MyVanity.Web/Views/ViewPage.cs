using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyVanity.Common.Localization;
using MyVanity.Services.App;

namespace MyVanity.Web.Views
{
    public abstract class WebViewPage<TModel> : System.Web.Mvc.WebViewPage<TModel>
    {
        private AppContext _app;
        private Localizer _localizer;

        public Localizer T
        {
            get
            {
                return _localizer ?? (_localizer = NullLocalizer.Instance);
            }
        }

        public new AppContext App
        {
            get { return _app ?? (_app = DependencyResolver.Current.GetService<AppContext>()); }
        }

        public bool WorkInProgress
        {
            get { return ViewBag.WorkInProgress ?? false; }
            set { ViewBag.WorkInProgress = value; }
        }

        public void H(LocalizedString titleAndHeader, LocalizedString subheader = null)
        {
            H(titleAndHeader, titleAndHeader, subheader);
        }

        public void H(LocalizedString title, LocalizedString header, LocalizedString subheader)
        {
            ViewBag.Title = title;
            ViewBag.Header = header;
            ViewBag.Subheader = subheader;
        }
    }

    public abstract class WebViewPage : WebViewPage<dynamic>
    {
    }
}