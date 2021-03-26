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
    public class ProjectService : IServiceBase<Model.Project>
    {
        #region 接口方法
        public int Add(Project model)
        {
            string sql = "insert into Projects([ClassifyId],[ProjectName],[State],[CurrentMoney],[Goal],[Deadline],[LikeCount],[Content],CoverImg,PublishState,OwnerId) values(@ClassifyId,@ProjectName,@State,@CurrentMoney,@Goal,@Deadline,@LikeCount,@Content,@CoverImg,@PublishState,@OwnerId)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@ClassifyId",model.ClassifyId),
                new SqlParameter("@ProjectName",model.ProjectName),
                new SqlParameter("@State",model.State),
                new SqlParameter("@CurrentMoney",model.CurrentMoney),
                new SqlParameter("@Goal",model.Goal),
                new SqlParameter("@Deadline",model.Deadline),
                new SqlParameter("@LikeCount",model.LikeCount),
                new SqlParameter("@Content",model.Content),
                new SqlParameter("@CoverImg",model.CoverImg),
                new SqlParameter("@PublishState",model.PublishState),
                new SqlParameter("@OwnerId",model.OwnerId),
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
            model.State = (ProjectState)Enum.Parse(typeof(ProjectState), dt.Rows[0]["State"].ToString());
            model.CurrentMoney = Convert.ToDecimal(dt.Rows[0]["CurrentMoney"].ToString());
            model.Goal = Convert.ToDecimal(dt.Rows[0]["Goal"].ToString());
            model.Deadline = DateTime.Parse(dt.Rows[0]["Deadline"].ToString());
            model.LikeCount = Convert.ToInt32(dt.Rows[0]["LikeCount"].ToString());
            model.Content = dt.Rows[0]["Content"].ToString();
            model.CoverImg = dt.Rows[0]["CoverImg"].ToString();
            model.PublishState = (PublishState)Enum.Parse(typeof(ProjectState), dt.Rows[0]["PublishState"].ToString());
            model.OwnerId = Convert.ToInt32(dt.Rows[0]["OwnerId"]);
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
                model.CurrentMoney = Convert.ToDecimal(string.IsNullOrWhiteSpace(dt.Rows[i]["CurrentMoney"].ToString()) ? "0" : dt.Rows[i]["CurrentMoney"].ToString());
                model.Goal = Convert.ToDecimal(dt.Rows[i]["Goal"].ToString());
                model.Deadline = DateTime.Parse(dt.Rows[i]["Deadline"].ToString());
                model.LikeCount = Convert.ToInt32(dt.Rows[i]["LikeCount"].ToString());
                model.Content = dt.Rows[i]["Content"].ToString();
                model.CoverImg = dt.Rows[i]["CoverImg"].ToString();
                model.PublishState = (PublishState)Enum.Parse(typeof(ProjectState), string.IsNullOrWhiteSpace(dt.Rows[i]["PublishState"].ToString()) ? "0" : dt.Rows[0]["PublishState"].ToString());
                model.OwnerId = Convert.ToInt32(string.IsNullOrWhiteSpace(dt.Rows[i]["OwnerId"].ToString()) ? "0" : dt.Rows[i]["OwnerId"].ToString());
                models.Add(model);
            }
            return models;
        }

        /// <summary>
        /// 根据条件分页获取
        /// </summary>
        /// <param name="start">开始行</param>
        /// <param name="end">结束行</param>
        /// <param name="wheres">筛选条件</param>
        /// <param name="orderBys">排序值</param>
        /// <returns></returns>
        public List<Project> GetPageListWhereToAndOrderBy(int start, int end, Dictionary<string, object> wheres, List<string> orderBys)
        {
            StringBuilder sql = new StringBuilder("select * from(select *,row_number()over(order by id) as num from Projects");
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter("@start",start),
                new SqlParameter("@end",end),
            };
            if (wheres != null && wheres.Count() > 0)
            {
                foreach (var item in wheres)
                {
                    if (string.IsNullOrWhiteSpace(item.Key))
                    {
                        throw new Exception("查询条件不能为空");
                    }
                    if (item.Equals(wheres.First()))
                    {
                        sql.Append($" where {item.Key}=@{item.Key}");
                    }
                    else
                    {
                        sql.Append($" and {item.Key}=@{item.Key}");
                    }
                    paramList.Add(new SqlParameter("@" + item.Key, item.Value));
                }
            }
            if (orderBys != null && orderBys.Count() > 0)
            {
                sql.Append(" order by ");
                foreach (var item in orderBys)
                {
                    if (string.IsNullOrWhiteSpace(item))
                    {
                        throw new Exception("查询条件不能为空");
                    }
                    if (orderBys.First() == item)
                    {
                        sql.Append($"{item}");
                    }
                    else
                    {
                        sql.Append($",{item}");
                    }
                }
            }
            sql.Append(") as t where t.num between @start and @end");
            DataTable dt = DbHelper.GetDataTable(sql.ToString(), paramList.ToArray());
            if (dt == null || dt.Rows.Count < 1)
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
                model.CurrentMoney = Convert.ToDecimal(dt.Rows[i]["CurrentMoney"].ToString());
                model.Goal = Convert.ToDecimal(dt.Rows[i]["Goal"].ToString());
                model.Deadline = DateTime.Parse(dt.Rows[i]["Deadline"].ToString());
                model.LikeCount = Convert.ToInt32(dt.Rows[i]["LikeCount"].ToString());
                model.Content = dt.Rows[i]["Content"].ToString();
                model.CoverImg = dt.Rows[i]["CoverImg"].ToString();
                model.PublishState = (PublishState)Enum.Parse(typeof(ProjectState), string.IsNullOrWhiteSpace(dt.Rows[0]["PublishState"].ToString()) ? "0" : dt.Rows[0]["PublishState"].ToString());
                model.OwnerId = Convert.ToInt32(dt.Rows[0]["OwnerId"] == DBNull.Value ? 0 : dt.Rows[0]["OwnerId"]);
                models.Add(model);
            }
            return models;
        }

        public int Update(Project model)
        {
            string sql = "update Projects set ClassifyId=@ClassifyId,ProjectName=@ProjectName,State=@State,CurrentMoney=@CurrentMoney,Goal=@Goal,Deadline=@Deadline,LikeCount=@LikeCount,Content=@Content,CoverImg=@CoverImg,PublishState=@PublishState,Owner=@Owner where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",model.Id),
                new SqlParameter("@ClassifyId",model.ClassifyId),
                new SqlParameter("@ProjectName",model.ProjectName),
                new SqlParameter("@State",model.State),
                new SqlParameter("@CurrentMoney",model.CurrentMoney),
                new SqlParameter("@Goal",model.Goal),
                new SqlParameter("@Deadline",model.Deadline),
                new SqlParameter("@LikeCount",model.LikeCount),
                new SqlParameter("@Content",model.Content),
                new SqlParameter("@CoverImg",model.CoverImg),
                new SqlParameter("@PublishState",model.PublishState),
                new SqlParameter("@OwnerId",model.OwnerId),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        /// <summary>
        /// 给项目捐钱
        /// </summary>
        /// <param name="userId">用户id</param>
        /// <param name="projectId">项目id</param>
        /// <param name="money">捐钱数额</param>
        /// <returns></returns>
        public int AddProjectMoney(int userId, int projectId, decimal money)
        {
            string sql = "update Projects set CurrentMoney=@Money where Id=@ProjectId;" +
                "insert into SupportProjects([UserId],[ProjectId],[Money]) values(@UserId,@ProjectId,@Money);";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",userId),
                new SqlParameter("@ProjectId",projectId),
                new SqlParameter("@Money",money),
            };
            return DbHelper.ExecuteTransaction(sql, ps);
        }
        #endregion

        /// <summary>
        /// 获取状态下所有条数
        /// </summary>
        /// <param name="classifyId">分类id</param>
        /// <param name="state">状态</param>
        /// <returns></returns>
        public int GetModelCount(int classifyId, ProjectState? state)
        {
            StringBuilder sql = new StringBuilder("select count(*) from Projects");
            List<SqlParameter> psList = new List<SqlParameter>();
            if (state != null)
            {
                if (sql.ToString().IndexOf("where") < 0)
                {
                    sql.Append(" where");
                }
                sql.Append(" State=@state");
                psList.Add(new SqlParameter("@state", state));
            }
            if (classifyId > 1)
            {
                if (sql.ToString().IndexOf("where") < 0)
                {
                    sql.Append(" where");
                }
                sql.Append(" and classifyId=@classifyId");
                psList.Add(new SqlParameter("@classifyId", classifyId));
            }
            return (int)DbHelper.ExecuteScalar(sql.ToString(), psList.ToArray());
        }
        /// <summary>
        /// 通过分类id查找
        /// </summary>
        /// <param name="classifyid"></param>
        /// <returns></returns>
        public List<Project> GetModelByClassifyId(int classifyid)
        {
            string sql = $"select * from Projects where ClassifyId={classifyid}";
            SqlDataReader dr = DbHelper.GetReader(sql);
            List<Project> list = new List<Project>();
            Project project = null;
            while (dr.Read())
            {
                project = new Project()
                {
                    Id = int.Parse(dr["Id"].ToString()),
                    ClassifyId = int.Parse(dr["ClassifyId"].ToString()),
                    ProjectName = dr["ProjectName"].ToString(),
                    State = (ProjectState)int.Parse(dr["State"].ToString()),
                    CurrentMoney = Convert.ToDecimal(dr["CurrentMoney"].ToString()),
                    Goal = Convert.ToDecimal(dr["Goal"].ToString()),
                    Deadline = Convert.ToDateTime(dr["Deadline"].ToString()),
                    LikeCount = int.Parse(dr["LikeCount"].ToString()),
                    Content = dr["Content"].ToString(),
                    CoverImg = dr["CoverImg"].ToString(),
                    PublishState = (PublishState)int.Parse(dr["PublishState"].ToString()),
                    OwnerId = int.Parse(dr["OwnerId"].ToString())
                };
                list.Add(project);
            }
            dr.Close();
            return list;
        }
        /// <summary>
        /// 通过状态查找
        /// </summary>
        /// <param name="state"></param>
        /// <returns></returns>
        public List<Project> GetModelByState(int state)
        {
            string sql = $"select * from Projects where ClassifyId={state}";
            SqlDataReader dr = DbHelper.GetReader(sql);
            List<Project> list = new List<Project>();
            Project project = null;
            while (dr.Read())
            {
                project = new Project()
                {
                    Id = int.Parse(dr["Id"].ToString()),
                    ClassifyId = int.Parse(dr["ClassifyId"].ToString()),
                    ProjectName = dr["ProjectName"].ToString(),
                    State = (ProjectState)int.Parse(dr["State"].ToString()),
                    CurrentMoney = Convert.ToDecimal(dr["CurrentMoney"].ToString()),
                    Goal = Convert.ToDecimal(dr["Goal"].ToString()),
                    Deadline = Convert.ToDateTime(dr["Deadline"].ToString()),
                    LikeCount = int.Parse(dr["LikeCount"].ToString()),
                    Content = dr["Content"].ToString(),
                    CoverImg = dr["CoverImg"].ToString(),
                    PublishState = (PublishState)int.Parse(dr["PublishState"].ToString()),
                    OwnerId = int.Parse(dr["OwnerId"].ToString())
                };
                list.Add(project);
            }
            dr.Close();
            return list;
        }
        /// <summary>
        /// 查询有限行数
        /// </summary>
        /// <returns></returns>
        public List<Project> GetModelByAll()
        {
            string sql = "select top 6  * from Projects p left join [Users] u on p.OwnerId=u.Id";
            SqlDataReader dr = DbHelper.GetReader(sql);
            Project project = null;
            List<Project> list = new List<Project>();
            while (dr.Read())
            {
                project = new Project()
                {
                    Id = int.Parse(dr["Id"].ToString()),
                    ClassifyId = int.Parse(dr["ClassifyId"].ToString()),
                    ProjectName = dr["ProjectName"].ToString(),
                    State = (ProjectState)int.Parse(dr["State"].ToString()),
                    CurrentMoney = Convert.ToDecimal(dr["CurrentMoney"].ToString()),
                    Goal = Convert.ToDecimal(dr["Goal"].ToString()),
                    Deadline = Convert.ToDateTime(dr["Deadline"].ToString()),
                    LikeCount = int.Parse(dr["LikeCount"].ToString()),
                    Content = dr["Content"].ToString(),
                    CoverImg = dr["CoverImg"].ToString(),
                    PublishState = (PublishState)int.Parse(dr["PublishState"].ToString()),
                    OwnerId = int.Parse(dr["OwnerId"].ToString()),
                    Nickname = dr["Nickname"].ToString()
                };
                list.Add(project);
            }
            dr.Close();
            return list;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Project> GetModelById(int id)
        {
            string sql = $"select * from Projects where OwnerId='{id}'";
            SqlDataReader dr = DbHelper.GetReader(sql);
            Project project = null;
            List<Project> list = new List<Project>();
            while (dr.Read())
            {
                project = new Project()
                {
                    Id = int.Parse(dr["Id"].ToString()),
                    ClassifyId = int.Parse(dr["ClassifyId"].ToString()),
                    ProjectName = dr["ProjectName"].ToString(),
                    State = (ProjectState)int.Parse(dr["State"].ToString()),
                    CurrentMoney = Convert.ToDecimal(dr["CurrentMoney"].ToString()),
                    Goal = Convert.ToDecimal(dr["Goal"].ToString()),
                    Deadline = Convert.ToDateTime(dr["Deadline"].ToString()),
                    LikeCount = int.Parse(dr["LikeCount"].ToString()),
                    Content = dr["Content"].ToString(),
                    CoverImg = dr["CoverImg"].ToString(),
                    PublishState = (PublishState)int.Parse(dr["PublishState"].ToString()),
                    OwnerId = int.Parse(dr["OwnerId"].ToString()),
                };
                list.Add(project);
            }
            dr.Close();
            return list;
        }
        /// <summary>
        /// 通过id和状态一起查询
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<Project> GetModelByIdAndState(int id, int State)
        {
            string sql = $"select * from Projects where OwnerId='{id}' and State='{State}'";
            SqlDataReader dr = DbHelper.GetReader(sql);
            Project project = null;
            List<Project> list = new List<Project>();
            while (dr.Read())
            {
                project = new Project()
                {
                    Id = int.Parse(dr["Id"].ToString()),
                    ClassifyId = int.Parse(dr["ClassifyId"].ToString()),
                    ProjectName = dr["ProjectName"].ToString(),
                    State = (ProjectState)int.Parse(dr["State"].ToString()),
                    CurrentMoney = Convert.ToDecimal(dr["CurrentMoney"].ToString()),
                    Goal = Convert.ToDecimal(dr["Goal"].ToString()),
                    Deadline = Convert.ToDateTime(dr["Deadline"].ToString()),
                    LikeCount = int.Parse(dr["LikeCount"].ToString()),
                    Content = dr["Content"].ToString(),
                    CoverImg = dr["CoverImg"].ToString(),
                    PublishState = (PublishState)int.Parse(dr["PublishState"].ToString()),
                    OwnerId = int.Parse(dr["OwnerId"].ToString()),
                };
                list.Add(project);
            }
            dr.Close();
            return list;

        }
    }
}
