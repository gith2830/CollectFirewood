using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AdminService:IServiceBase<Model.Admin>
    {
        #region 接口方法
        public int GetModelCount()
        {
            string sql = "select count(*) from Admins";
            return (int)DbHelper.ExecuteScalar(sql);
        }
        public Model.Admin GetModel(int id)
        {
            string sql = "select * from Admins where Id=@id";
            SqlParameter p = new SqlParameter("@id",id);
            DataTable dt = DbHelper.GetDataTable(sql,p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Admin model = new Model.Admin();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.AdminName = dt.Rows[0]["AdminName"].ToString();
            model.Pwd = dt.Rows[0]["Pwd"].ToString();
            return model;
        }
        public Model.Admin GetModel(string adminName)
        {
            string sql = "select * from Admins where AdminName=@adminName";
            SqlParameter p = new SqlParameter("@adminName", adminName);
            DataTable dt = DbHelper.GetDataTable(sql,p);
            if (dt == null || dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Admin model = new Model.Admin();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.AdminName = dt.Rows[0]["AdminName"].ToString();
            model.Pwd = dt.Rows[0]["Pwd"].ToString();
            return model;
        }
        public List<Model.Admin> GetPageList(int start,int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Admins) as t where t.num between @start and @end";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@start",start),
                new SqlParameter("@end",end),
            };
            DataTable dt = DbHelper.GetDataTable(sql, ps);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            List<Model.Admin> models = new List<Model.Admin>();
            for(int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Admin model = new Model.Admin();
                model.Id = Convert.ToInt32(dt.Rows[i]["id"]);
                model.AdminName = dt.Rows[i]["AdminName"].ToString();
                model.Pwd = dt.Rows[i]["Pwd"].ToString();
                models.Add(model);
            }
            return models;
        }
        public int Add(Model.Admin admin)
        {
            string sql = "insert into admins([AdminName],[Pwd]) values(@AdminName,@Pwd)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@AdminName",admin.AdminName),
                new SqlParameter("@Pwd",admin.Pwd),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        public int Delete(int id)
        {
            string sql = "delete from admins where id=@id";
            SqlParameter p = new SqlParameter("@id",id);
            return DbHelper.ExecuteNotQuery(sql,p);
        }
        public int Update(Model.Admin admin)
        {
            string sql = "update admins set AdminName=@AdminName,Pwd=@Pwd where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",admin.Id),
                new SqlParameter("@AdminName",admin.AdminName),
                new SqlParameter("@Pwd",admin.Pwd),
            };
            return DbHelper.ExecuteNotQuery(sql,ps);
        }
        #endregion
    }
}
