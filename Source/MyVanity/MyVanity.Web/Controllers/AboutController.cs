using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using MyVanity.Services.Blobs;

namespace MyVanity.Web.Controllers
{
    public class AboutController : Controller
    {
        private readonly IBlobStore _blobStore;

        public AboutController(IBlobStore blobStore)
        {
            _blobStore = blobStore;
        }

        //
        // GET: /About/
        public async Task<ActionResult> UploadFile()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> UploadFile(HttpPostedFileBase file)
        {
            if (file != null)
            {
                using (var reader = new BinaryReader(file.InputStream))
                {
                    await _blobStore.SaveAsync("files", Guid.NewGuid().ToString(), reader.ReadBytes(file.ContentLength));
                }
            }

            return View();
        }
	}
}