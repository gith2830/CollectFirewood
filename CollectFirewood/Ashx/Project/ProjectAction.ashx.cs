using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CollectFirewood.Ashx.Project
{
    /// <summary>
    /// ProjectAction 的摘要说明
    /// </summary>
    public class ProjectAction : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.ProjectManager bll = new BLL.ProjectManager();
            string action = context.Request["action"];
            // 获得分页
            if (action == "get")
            {
                int pageIndex, pageSize;
                try
                {
                    pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
                    pageSize = Convert.ToInt32(context.Request["pageSize"]);
                }
                catch
                {
                    return;
                }
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageSize = pageSize <= 0 || pageSize > 10 ? 10 : pageSize;
                int pageCount = (int)Math.Ceiling((double)bll.GetModelCount() / (double)pageSize);
                List<Model.Project> list = bll.GetPageList(pageIndex, pageSize);
                object obj = new
                {
                    pageIndex,
                    pageSize,
                    pageCount,
                    data = list,
                };
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write(js.Serialize(obj));
            }
            // 获得待审批的项目
            else if(action == "getExamine")
            {
                int pageIndex, pageSize;
                try
                {
                    pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
                    pageSize = Convert.ToInt32(context.Request["pageSize"]);
                }
                catch
                {
                    return;
                }
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageSize = pageSize <= 0 || pageSize > 10 ? 10 : pageSize;
                //int pageCount = (int)Math.Ceiling((double)bll.GetModelCount() / (double)pageSize);
                int pageCount = bll.GetPageCount(0, Model.PublishState.Examine, pageSize);
                List<Model.Project> list = bll.GetPageListForExamine(pageIndex, pageSize,null);
                object obj = new
                {
                    pageIndex,
                    list?.Count,
                    pageCount,
                    data = list,
                };
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write(js.Serialize(obj));
            }
            // 获得一个
            else if (action == "getById")
            {
                int id;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                var user = bll.GetModel(id);
                if (user == null)
                {
                    context.Response.Write("no:该项目不存在");
                    return;
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write("ok:" + js.Serialize(user));
            }
            // 添加
            else if (action == "add")
            {
                Model.Project project = new Model.Project();
                try
                {
                    project.ClassifyId = Convert.ToInt32(context.Request["classifyId"]);
                    project.ProjectName = context.Request["projectName"];
                    project.State = (Model.ProjectState)Enum.Parse(typeof(Model.ProjectState), context.Request["state"]);
                    project.Goal = Convert.ToInt32(context.Request["goal"]);
                    project.Deadline = DateTime.Parse(context.Request["deadline"]);
                    project.LikeCount = Convert.ToInt32(context.Request["likeCount"]);
                    project.Content = context.Request["content"];
                }
                catch
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                if (new BLL.ClassifyManager().GetModel(project.ClassifyId) == null)
                {
                    context.Response.Write("no:该分类不存在");
                    return;
                }
                if(string.IsNullOrWhiteSpace(project.Content))
                {
                    context.Response.Write("no:参数不能为空");
                    return;
                }
                project.CoverImg = "";
                if (bll.Add(project))
                {
                    context.Response.Write("ok:添加成功");
                }
                else
                {
                    context.Response.Write("no:添加失败");
                }
            }
            // 修改
            else if (action == "edit")
            {
                int id;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                Model.Project project = bll.GetModel(id);
                if (project == null)
                {
                    context.Response.Write("no:该项目不存在");
                    return;
                }
                try
                {
                    project.Id = Convert.ToInt32(context.Request["id"]);
                    project.ClassifyId = Convert.ToInt32(context.Request["classifyId"]);
                    project.ProjectName = context.Request["projectName"];
                    project.State = (Model.ProjectState)Enum.Parse(typeof(Model.ProjectState), context.Request["state"]);
                    project.Goal = Convert.ToInt32(context.Request["goal"]);
                    project.Deadline = DateTime.Parse(context.Request["deadline"]);
                    project.LikeCount = Convert.ToInt32(context.Request["likeCount"]);
                    project.Content = context.Request["content"];
                }
                catch
                {
                    context.Response.Write("error:参数错误");
                    return;
                }
                if (new BLL.ClassifyManager().GetModel(project.ClassifyId) == null)
                {
                    context.Response.Write("no:该分类不存在");
                    return;
                }
                if (string.IsNullOrWhiteSpace(project.Content)
                    || string.IsNullOrWhiteSpace(project.ProjectName)
                    || project.Goal<1
                    || project.Deadline==null
                    || project.LikeCount<0
                    || project.Content==null)
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                if (bll.Update(project))
                {
                    context.Response.Write("ok:修改成功");
                }
                else
                {
                    context.Response.Write("no:修改失败");
                }
            }
            // 审批
            else if(action == "examine")
            {
                int id = 0;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                if (bll.ChangeProjectState(id,Model.PublishState.Approved))
                {
                    context.Response.Write("ok:审批成功");
                }
                else
                {
                    context.Response.Write("no:审批失败");
                }
            }
            // 不审批
            else if(action == "unexamine")
            {
                int id = 0;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                if (bll.ChangeProjectState(id,Model.PublishState.NoApproved))
                {
                    context.Response.Write("ok:驳回成功");
                }
                else
                {
                    context.Response.Write("no:驳回失败");
                }
            }
            // 删除
            else if (action == "delete")
            {
                int id = 0;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                if (bll.Delete(id))
                {
                    context.Response.Write("ok:删除成功");
                }
                else
                {
                    context.Response.Write("no:删除失败");
                }
            }
            else
            {
                context.Response.Write("error:非法的action");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}