﻿using Model;
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
    }
}
