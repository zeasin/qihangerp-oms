using OrmContrast.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrmContrast.SimpleData
{
    public class HotelDAL
    {
        
        /// <summary>
        /// 查询所有
        /// </summary>
        public List<hotelacc> ExecuteList()
        {
            var data = DbHelper.DAL.hotelacc.All();
            return data.ToList<hotelacc>();
        }
        /// <summary>
        /// 主键ID查询
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public hotelacc ExecuteEntity(long id)
        {
            var data = DbHelper.DAL.hotelacc.FindByhid(id);
            return data;
        }

        public List<hotelacc> ExecuteList(string gender, string address)
        {
            var db = DbHelper.DAL;
            //var data = 
            //var data = db.SQL("SELECT name,gender,ctfid,mobile,address,email FROM hotelacc WHERE gender='F'");
            //return data;//.ToList<HotelAccommodationEntity>();
            return db.hotelacc.FindAll(db.hotelacc.address.Like("%" + address + "%") && db.hotelacc.gender == gender);//db.hotelacc.address.Like("%" + address + "%") && 
            //if (data == null) return null;
            //return data.ToList<HotelAccommodationEntity>();

        }

        public List<hotelacc> ExecuteListBy(string gender)
        {
            var db = DbHelper.DAL.Open();

            //var db= DBHelper.DAL;
            var sql = @"SELECT name,gender,ctfid,mobile,address,email FROM hotelacc WHERE gender=@gender";
            var row = db.ToRows(sql, new { gender = "F" });
            return row;
        }

        public void ExecuteInsert(hotelacc entity)
        {
            DbHelper.DAL.hotelacc.Insert(entity);
        }
    }
}
