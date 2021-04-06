using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CollectFirewood.Ashx.Project
{
    /// <summary>
    /// LaunchInfoAction 的摘要说明
    /// </summary>
    public class LaunchInfoAction : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.LaunchInfoManager bll = new BLL.LaunchInfoManager();
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
                List<Model.LaunchInfo> list = bll.GetPageList(pageIndex, pageSize);
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
            // 获得一个
            else if (action == "getById")
            {
                int id;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                var model = bll.GetModel(id);
                if (model == null)
                {
                    context.Response.Write("no:该项目不存在");
                    return;
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write("ok:" + js.Serialize(model));
            }
            // 添加
            else if (action == "add")
            {
                Model.LaunchInfo launchInfo = new Model.LaunchInfo();
                try
                {
                    launchInfo.UserId = Convert.ToInt32(context.Request["userId"]);
                    launchInfo.TrueName = context.Request["TrueName"];
                    launchInfo.PhoneNumber = context.Request["PhoneNumber"];
                    launchInfo.BankName = context.Request["BankName"];
                    launchInfo.Branch = context.Request["Branch"];
                    launchInfo.BankCard = context.Request["BankCard"];
                    launchInfo.Address = context.Request["Address"];
                    launchInfo.ProjectId = Convert.ToInt32(context.Request["projectId"]);
                }
                catch
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                if (string.IsNullOrWhiteSpace(launchInfo.TrueName))
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                if (bll.Add(launchInfo))
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
                Model.LaunchInfo launchInfo = bll.GetModel(id);
                if (launchInfo == null)
                {
                    context.Response.Write("no:支持的项目不存在");
                    return;
                }
                try
                {
                    launchInfo.UserId = Convert.ToInt32(context.Request["userId"]);
                    launchInfo.TrueName = context.Request["TrueName"];
                    launchInfo.PhoneNumber = context.Request["PhoneNumber"];
                    launchInfo.BankName = context.Request["BankName"];
                    launchInfo.Branch = context.Request["Branch"];
                    launchInfo.BankCard = context.Request["BankCard"];
                    launchInfo.Address = context.Request["Address"];
                    launchInfo.ProjectId = Convert.ToInt32(context.Request["projectId"]);
                }
                catch
                {
                    context.Response.Write("error:参数错误");
                    return;
                }
                if (string.IsNullOrWhiteSpace(launchInfo.TrueName))
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                if (bll.Update(launchInfo))
                {
                    context.Response.Write("ok:修改成功");
                }
                else
                {
                    context.Response.Write("no:修改失败");
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