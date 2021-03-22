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
    public class CommentService : IServiceBase<Model.Comment>
    {
        #region 接口方法
        public int Add(Comment model)
        {
            string sql = "insert into Comments([UserId],[ProjectId],[Content]) values(@UserId,@ProjectId,@Content)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
                new SqlParameter("@Content",model.Content)
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from Comments where id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public int DeleteAllByUserId(int userId)
        {
            string sql = "delete from Comments where userId = @userId";
            SqlParameter p = new SqlParameter("@userId", userId);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public Comment GetModel(int id)
        {
            string sql = "select * from Comments where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Comment model = new Model.Comment();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.UserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
            model.ProjectId = Convert.ToInt32(dt.Rows[0]["ProjectId"]);
            model.Content = dt.Rows[0]["Content"].ToString();
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from Comments";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<Comment> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Comments) as t where t.num between @start and @end";
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
            List<Model.Comment> models = new List<Model.Comment>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Comment model = new Model.Comment();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.UserId = Convert.ToInt32(dt.Rows[i]["UserId"]);
                model.ProjectId = Convert.ToInt32(dt.Rows[i]["ProjectId"]);
                model.Content = dt.Rows[i]["Content"].ToString();
                models.Add(model);
            }
            return models;
        }

        public int Update(Comment model)
        {
            string sql = "update Comments set UserId=@UserId,ProjectId=@ProjectId,Content=@Content where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
                new SqlParameter("@Content",model.Content)
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        #endregion
    }
}
