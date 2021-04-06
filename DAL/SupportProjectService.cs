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
    public class SupportProjectService : IServiceBase<Model.SupportProject>
    {
        #region 接口方法
        public int Add(SupportProject model)
        {
            string sql = "insert into SupportProjects([UserId],[ProjectId],[Money]) values(@UserId,@ProjectId,@Money)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
                new SqlParameter("@Money",model.Money),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from SupportProjects where id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public int Delete(Dictionary<string,object> dicWhere)
        {
            StringBuilder sql = new StringBuilder("delete from SupportProjects where 1=1");
            List<SqlParameter> pList = new List<SqlParameter>();
            foreach (var item in dicWhere)
            {
                sql.Append(" and " + item.Key + "=@" + item.Key.ToString());
                pList.Add(new SqlParameter("@" + item.Key, item.Value));
            }
            return DbHelper.ExecuteNotQuery(sql.ToString(), pList.ToArray());
        }

        public int DeleteAllByUserId(int userId)
        {
            string sql = "delete from SupportProjects where userId=@userId";
            SqlParameter p = new SqlParameter("@userId", userId);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public SupportProject GetModel(int id)
        {
            string sql = "select * from SupportProjects where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            Model.SupportProject model = new Model.SupportProject();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.UserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
            model.ProjectId = Convert.ToInt32(dt.Rows[0]["ProjectId"]);
            model.Money = Convert.ToDecimal(dt.Rows[0]["Money"]);
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from SupportProjects";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<SupportProject> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from SupportProjects) as t where t.num between @start and @end";
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
            List<Model.SupportProject> models = new List<Model.SupportProject>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.SupportProject model = new Model.SupportProject();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.UserId = Convert.ToInt32(dt.Rows[i]["UserId"]);
                model.ProjectId = Convert.ToInt32(dt.Rows[i]["ProjectId"]);
                model.Money = Convert.ToDecimal(dt.Rows[i]["Money"]);
                models.Add(model);
            }
            return models;
        }

        public int Update(SupportProject model)
        {
            string sql = "update SupportProjects set UserId=@UserId,ProjectId=@ProjectId,Money=@Money where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@ProjectId",model.ProjectId),
                new SqlParameter("@Money",model.Money),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        #endregion
        /// <summary>
        /// 获取行数
        /// </summary>
        /// <param name="where">where条件</param>
        /// <returns></returns>
        public int GetCountWhereTo(Dictionary<string,object> where)
        {
            //select UserId,count(*) as count from SupportProjects where ProjectId = 10003 group by UserId
            StringBuilder sb = new StringBuilder("select count(*) from SupportProjects");
            List<SqlParameter> list = new List<SqlParameter>();
            foreach (var item in where)
            {
                if (item.Equals(where.FirstOrDefault()))
                {
                    sb.Append(" where");
                }
                sb.Append($" {item.Key}={item.Value}");
            }
            return DbHelper.ExecuteNotQuery(sb.ToString(), list.ToArray());
        }

        public int InsertData(int UserId,int ProjectId,Decimal Money)
        {
            string sql = $"insert into SupportProjects([UserId],[ProjectId],[Money]) values('{UserId}','{ProjectId}','{ Money}')";
            return DbHelper.Update(sql);
        }
    }
}
