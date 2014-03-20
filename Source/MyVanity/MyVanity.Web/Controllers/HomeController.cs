using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using MyVanity.Domain;
using MyVanity.Services.IO;

namespace MyVanity.Web.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            //var manager = new DocumentManager();
            //var document = new PatientDocument {Id = 1, Name = "XXX.txt", Type = DocumentType.Patient};

            //await manager.SaveAsync(document, Encoding.UTF8.GetBytes("Hello Blob Storage!!!"));

            //var content = await manager.GetAsync(document);
            //System.IO.File.WriteAllBytes(@"D:\Temp.jpg", content);

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}