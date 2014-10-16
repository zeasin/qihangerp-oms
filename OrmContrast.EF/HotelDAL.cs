using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrmContrast.EF
{
    public class HotelDAL
    {
        public List<hotelacc> ExecuteList(string gender, string address)
        {
            //Database.SetInitializer(new DropCreateDatabaseAlways<MyContext>());//是否同步数据库
            var context = new MyContext();

            var query = context.hotelaccs.Where(m => m.gender == gender && m.address.Contains(address));

            //Debug.WriteLine(query.ToString());

            return query.ToList(); 
            
        }
    }
}
