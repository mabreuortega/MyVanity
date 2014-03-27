using System.Web;
using System.Web.Optimization;

namespace MyVanity.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //Uncomment this for enabling bundling and minifying
            BundleTable.EnableOptimizations = true;

            /* Style bundles */
            bundles.Add(new StyleBundle("~/bundles/css/core").Include(
                      "~/Content/css/bootstrap.css",
                      "~/Content/css/main.css",
                      "~/Content/css/templates.css"));
            
            bundles.Add(new StyleBundle("~/bundles/css/ie7support").Include(
                      "~/Content/css/bootstrap-ie7.css"));

            /* Script bundles */
            bundles.Add(new ScriptBundle("~/bundles/js/core").Include(
                      "~/Content/js/jquery-{version}.js",
                      "~/Content/js/main.js",
                      "~/Content/js/bootstrap.js"));
            
            bundles.Add(new ScriptBundle("~/bundles/js/ie8support").Include(
                      "~/Content/js/respond.js",
                      "~/Content/js/html5shiv.js"));
        }
    }
}
