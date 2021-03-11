using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CollectFirewood.Ashx.Admin
{
    /// <summary>
    /// AdminAction 的摘要说明
    /// </summary>
    public class AdminAction : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.AdminManager bll = new BLL.AdminManager();
            string action = context.Request["action"];
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
                int pageCount = (int)Math.Ceiling((double)bll.GetModelCount()/ (double)pageSize);
                List<Model.Admin> list = bll.GetPageList(pageIndex, pageSize);
                object obj = new
                {
                    pageIndex,
                    pageSize,
                    pageCount,
                    data = list,
                };
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write(js.Serialize(obj));
            }else if(action== "getById")
            {
                int id = 0;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                var admin = bll.GetModel(id);
                if (admin == null)
                {
                    context.Response.Write("no:该用户不存在");
                    return;
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write("ok:"+js.Serialize(admin));
            }
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
            else if (action == "edit")
            {
                int id = 0;
                string adminName = context.Request["adminName"];
                string pwd = context.Request["pwd"];
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                Model.Admin admin = bll.GetModel(id);
                if (admin == null)
                {
                    context.Response.Write("no:该用户不存在");
                    return;
                }
                admin.AdminName = adminName;
                if (!string.IsNullOrWhiteSpace(pwd))
                {
                    admin.Pwd = pwd;
                }
                if (bll.Update(admin))
                {
                    context.Response.Write("ok:修改成功");
                }
                else
                {
                    context.Response.Write("no:修改失败");
                }
            }
            else if (action == "add")
            {
                Model.Admin admin = new Model.Admin
                {
                    AdminName = context.Request["adminName"],
                    Pwd = context.Request["pwd"]
                };
                if (bll.Add(admin))
                {
                    context.Response.Write("ok:添加成功");
                }
                else context.Response.Write("no:添加失败");
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