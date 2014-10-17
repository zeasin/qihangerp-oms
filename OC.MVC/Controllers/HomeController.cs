using OC.MVC.Utility;
using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OC.MVC.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        [PerformanceAction]
        public ActionResult Index()
        {
            //List<OrmContrast.Entity.hotelacc> list = EF();
            List<OrmContrast.Entity.hotelacc> list = new List<hotelacc>();
            return View(list);
        }

        private List<hotelacc> EF()
        {
            
            var efStart = DateTime.Now;

            OrmContrast.EF.HotelDAL efdal = new OrmContrast.EF.HotelDAL();
            
            return efdal.ExecuteList("F", "深圳");
            
           
        }
	}
}