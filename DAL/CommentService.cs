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
            string sql = "insert into Comments([UserId],[ProjectId],[Content],[SendTime]) values(@UserId,@ProjectId,@Content,@SendTime)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
                new SqlParameter("@Content",model.Content),
                new SqlParameter("@SendTime",model.SendTime)
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
            model.SendTime = dt.Rows[0]["SendTime"].ToString();
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
        public List<Comment> GetModelLinkUsers(int UserId, int ProjectId)
        {
            string sql = $"select * from Comments c left join Users u on c.UserId=u.Id where UserId='{UserId}'and ProjectId='{ProjectId}'";
            SqlDataReader dr = DbHelper.GetReader(sql);
            List<Comment> list = new List<Comment>();
            Comment comment = null;
            while (dr.Read())
            {
                comment = new Comment()
                {
                    Id=int.Parse(dr["Id"].ToString()),
                    UserId=int.Parse(dr["UserId"].ToString()),
                    ProjectId = int.Parse(dr["ProjectId"].ToString()),
                    UserPic=dr["UserPic"].ToString(),
                    SendTime=dr["SendTime"].ToString(),
                    Nickname = dr["Nickname"].ToString(),
                    Content=dr["Content"].ToString()
                };
                list.Add(comment);                
            }
            dr.Close();
            return list;
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
