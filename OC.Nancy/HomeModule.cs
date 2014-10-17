using Nancy;
using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OC.NancyWeb
{
    public class HomeModule: NancyModule
    {
        public HomeModule()
        {
            Get["/"] = parameters => {

                Simple();
                return "Hello"; 
            
            };
        }

        private void Simple()
        {
            System.Console.WriteLine("SimpleStart:" + DateTime.Now.ToString());
            var startTime = DateTime.Now;

            OrmContrast.SimpleData.HotelDAL simdal = new OrmContrast.SimpleData.HotelDAL();
            //HotelAccommodationEntity entity = dal.ExecuteEntity(2000003);
            var simlist = simdal.ExecuteList("F", "深圳");

            if (simlist == null) simlist = new List<hotelacc>();
            System.Console.WriteLine("Result:" + simlist.Count);

            System.Console.WriteLine("Simple耗时：" + (DateTime.Now - startTime).ToString());
        }
    }
}
