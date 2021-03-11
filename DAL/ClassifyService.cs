using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ClassifyService : IServiceBase<Classify>
    {
        public int Add(Classify model)
        {
            string sql = "insert into classifys([ClassifyName]) VALUES(@ClassifyName)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@ClassifyName",model.ClassifyName),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from classifys where id = @id";
            SqlParameter p = new SqlParameter("@id",id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public Classify GetModel(int id)
        {
            string sql = "select * from Classifys where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Classify model = new Model.Classify();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.ClassifyName = dt.Rows[0]["ClassifyName"].ToString();
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from classifys";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<Classify> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Classifys) as t where t.num between @start and @end";
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
            List<Model.Classify> models = new List<Model.Classify>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Classify model = new Model.Classify();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.ClassifyName = dt.Rows[i]["ClassifyName"].ToString();
                models.Add(model);
            }
            return models;
        }

        public List<Classify> GetAllList()
        {
            string sql = "select * from Classifys";
            DataTable dt = DbHelper.GetDataTable(sql);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            List<Model.Classify> models = new List<Model.Classify>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Classify model = new Model.Classify();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.ClassifyName = dt.Rows[i]["ClassifyName"].ToString();
                models.Add(model);
            }
            return models;
        }

        public int Update(Classify model)
        {
            string sql = "update classifys set ClassifyName = @ClassifyName  where id = @id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@id",model.Id),
                new SqlParameter("@ClassifyName",model.ClassifyName),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
    }
}
