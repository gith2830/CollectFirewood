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
    public class ProjectService : IServiceBase<Model.Project>
    {
        #region 接口方法
        public int Add(Project model)
        {
            string sql = "insert into Projects([ClassifyId],[ProjectName],[State],[Goal],[Deadline],[LikeCount],[Content],CoverImg) values(@ClassifyId,@ProjectName,@State,@Goal,@Deadline,@LikeCount,@Content,@CoverImg)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@ClassifyId",model.ClassifyId),
                new SqlParameter("@ProjectName",model.ProjectName),
                new SqlParameter("@State",model.State),
                new SqlParameter("@Goal",model.Goal),
                new SqlParameter("@Deadline",model.Deadline),
                new SqlParameter("@LikeCount",model.LikeCount),
                new SqlParameter("@Content",model.Content),
                new SqlParameter("@CoverImg",model.CoverImg),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        public int Delete(int id)
        {
            string sql = "delete from Projects where id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }
        public Project GetModel(int id)
        {
            string sql = "select * from Projects where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.Project model = new Model.Project();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.ClassifyId = Convert.ToInt32(dt.Rows[0]["ClassifyId"].ToString());
            model.ProjectName = dt.Rows[0]["ProjectName"].ToString();
            model.State = (ProjectState)Enum.Parse(typeof(ProjectState),dt.Rows[0]["State"].ToString());
            model.Goal = Convert.ToDecimal(dt.Rows[0]["Goal"].ToString());
            model.Deadline = DateTime.Parse(dt.Rows[0]["Deadline"].ToString());
            model.LikeCount = Convert.ToInt32(dt.Rows[0]["LikeCount"].ToString());
            model.Content = dt.Rows[0]["Content"].ToString();
            model.CoverImg = dt.Rows[0]["CoverImg"].ToString();
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from Projects";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<Project> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Projects) as t where t.num between @start and @end";
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
            List<Model.Project> models = new List<Model.Project>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.Project model = new Model.Project();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.ClassifyId = Convert.ToInt32(dt.Rows[i]["ClassifyId"].ToString());
                model.ProjectName = dt.Rows[i]["ProjectName"].ToString();
                model.State = (ProjectState)Enum.Parse(typeof(ProjectState), dt.Rows[i]["State"].ToString());
                var a = dt.Rows[i]["Goal"].ToString();
                model.Goal = Convert.ToDecimal(dt.Rows[i]["Goal"].ToString());
                model.Deadline = DateTime.Parse(dt.Rows[i]["Deadline"].ToString());
                model.LikeCount = Convert.ToInt32(dt.Rows[i]["LikeCount"].ToString());
                model.Content = dt.Rows[i]["Content"].ToString();
                model.CoverImg = dt.Rows[i]["CoverImg"].ToString();
                models.Add(model);
            }
            return models;
        }

        public int Update(Project model)
        {
            string sql = "update Projects set ClassifyId=@ClassifyId,ProjectName=@ProjectName,State=@State,Goal=@Goal,Deadline=@Deadline,LikeCount=@LikeCount,Content=@Content,CoverImg=@CoverImg where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@ClassifyId",model.ClassifyId),
                new SqlParameter("@ProjectName",model.ProjectName),
                new SqlParameter("@State",model.State),
                new SqlParameter("@Goal",model.Goal),
                new SqlParameter("@Deadline",model.Deadline),
                new SqlParameter("@LikeCount",model.LikeCount),
                new SqlParameter("@Content",model.Content),
                new SqlParameter("@CoverImg",model.CoverImg),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        #endregion
    }
}
