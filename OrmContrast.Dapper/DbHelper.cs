using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace OrmContrast.DapperOrm
{
    public class DbHelper
    {
        private static readonly string ConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public List<hotelacc> Get()
        {
            using(MySql.Data.MySqlClient.MySqlConnection conn =new MySql.Data.MySqlClient.MySqlConnection(ConnString))
            {
                string sql="SELECT `name`,gender,birthday,mobile,address,email FROM hotelaccs WHERE gender='F' AND address LIKE('%深圳%');";
                var s = conn.Query<hotelacc>(sql);
                return s.ToList() ;
            }
            //var guid = Guid.NewGuid();
            //var dog =  connection.Query<HotelAccommodationEntity>("select Age = @Age, Id = @Id", new { Age = (int?)null, Id = guid });
            //SqlContion.Query();
        }
    }
}
