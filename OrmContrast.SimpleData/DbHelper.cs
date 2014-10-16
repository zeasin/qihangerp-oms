using Simple.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrmContrast.SimpleData
{
    public class DbHelper
    {
        private static readonly string ConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public static dynamic DAL
        {
            get { return Database.Opener.OpenConnection(ConnString); }
        }
    }
}
