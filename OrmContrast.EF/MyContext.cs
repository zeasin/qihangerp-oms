using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrmContrast.EF
{
    public class MyContext : DbContext
    {
        public MyContext()
            : base("name=MyContext")
        {
        }

        public DbSet<hotelacc> hotelaccs { get; set; }
    }
}
