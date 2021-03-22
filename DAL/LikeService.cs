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
    public class LikeService : IServiceBase<Like>
    {
        #region 接口方法
        public int Add(Like model)
        {
            string sql = "insert into likes(UserId,ProjectId) VALUES(@UserId,@ProjectId)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from Likes where id = @id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public Like GetModel(int id)
        {
            string sql = "select * from Likes where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Like model = new Model.Like();
            model.UserId = Convert.ToInt32(dt.Rows[0]["Id"]);
            model.ProjectId = Convert.ToInt32(dt.Rows[0]["ClassifyName"]);
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from Likes";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<Like> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Likes) as t where t.num between @start and @end";
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
            List<Model.Like> models = new List<Model.Like>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Like model = new Model.Like();
                model.UserId = Convert.ToInt32(dt.Rows[0]["Id"]);
                model.ProjectId = Convert.ToInt32(dt.Rows[0]["ClassifyName"]);
                models.Add(model);
            }
            return models;
        }

        public int Update(Like model)
        {
            string sql = "update classifys set ProjectId = @ProjectId  where UserId = @UserId";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        #endregion
        public List<Like> GetPageListWhereTo(int start, int end,Dictionary<string,object> where)
        {
            StringBuilder sql = new StringBuilder("select * from(select *,row_number()over(order by id) as num from Likes) as t where t.num between @start and @end");
            List<SqlParameter> pList = new List<SqlParameter>()
            {
                new SqlParameter("@start",start),
                new SqlParameter("@end",end),
            };
            if (where != null && where.Count() > 0)
            {
                foreach (var item in where)
                {
                    sql.Append($" and {item.Key}=@{item.Value}");
                    pList.Add(new SqlParameter("@"+item.Key,item.Value));
                }
            }
            DataTable dt = DbHelper.GetDataTable(sql.ToString(), pList.ToArray());
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            List<Model.Like> models = new List<Model.Like>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Like model = new Model.Like();
                model.UserId = Convert.ToInt32(dt.Rows[0]["Id"]);
                model.ProjectId = Convert.ToInt32(dt.Rows[0]["ClassifyName"]);
                models.Add(model);
            }
            return models;
        }
    }
}
