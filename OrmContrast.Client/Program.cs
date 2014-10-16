using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrmContrast.Client
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("ORM MYSQL性能测试（200W数据量，Like(%%)查询）");
            System.Console.WriteLine("------------EF1------------");
            EF();
            //System.Console.WriteLine("------------END------------");
            System.Console.WriteLine("------------EF2------------");
            EF();
            //System.Console.WriteLine("------------END------------");

            System.Console.WriteLine("------------Sim1------------");
            Simple();
            //System.Console.WriteLine("------------END------------");
            System.Console.WriteLine("------------Sim2------------");
            Simple();
            //System.Console.WriteLine("------------END------------");

            System.Console.WriteLine("------------Dapper1------------");
            Daa();
            //System.Console.WriteLine("------------END------------");
            System.Console.WriteLine("------------Dapper2------------");
            Daa();
            //System.Console.WriteLine("------------END------------");

        }

        private static void Daa()
        {
            System.Console.WriteLine("DapperStart:" + DateTime.Now.ToString());
            var daStart = DateTime.Now;
            DapperOrm.DbHelper db = new DapperOrm.DbHelper();
            var dalist = db.Get();
            if (dalist == null) dalist = new List<hotelacc>();
            System.Console.WriteLine("Result:" + dalist.Count);

            System.Console.WriteLine("EF耗时：" + (DateTime.Now - daStart).ToString());
        }

        private static void EF()
        {
            System.Console.WriteLine("EFStart:" + DateTime.Now.ToString());
            var efStart = DateTime.Now;

            OrmContrast.EF.HotelDAL efdal = new OrmContrast.EF.HotelDAL();
            //HotelAccommodationEntity entity = dal.ExecuteEntity(2000003);
            var eflist = efdal.ExecuteList("F", "深圳");
            if (eflist == null) eflist = new List<hotelacc>();
            System.Console.WriteLine("Result:" + eflist.Count);

            System.Console.WriteLine("EF耗时：" + (DateTime.Now - efStart).ToString());
        }

        private static void Simple()
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
