using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CollectFirewood.Ashx.Classify
{
    /// <summary>
    /// ClassifyAction 的摘要说明
    /// </summary>
    public class ClassifyAction : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            BLL.ClassifyManager bll = new BLL.ClassifyManager();
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
                List<Model.Classify> list = bll.GetPageList(pageIndex, pageSize);
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
            // 获得所有
            else if (action=="getAll")
            {
                List<Model.Classify> list = bll.GetAllList();
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write(js.Serialize(list));
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
                    context.Response.Write("no:该分类不存在");
                    return;
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write("ok:" + js.Serialize(user));
            }
            // 添加
            else if (action == "add")
            {
                Model.Classify classify = new Model.Classify();
                classify.ClassifyName = context.Request["classifyName"];
                if (string.IsNullOrWhiteSpace(classify.ClassifyName))
                {
                    context.Response.Write("no:参数不能为空");
                    return;
                }
                if (bll.Add(classify))
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
                Model.Classify classify = bll.GetModel(id);
                if (classify == null)
                {
                    context.Response.Write("no:该分类不存在");
                    return;
                }
                classify.Id = Convert.ToInt32(context.Request["id"]);
                classify.ClassifyName = context.Request["classifyName"];
                if (string.IsNullOrWhiteSpace(classify.ClassifyName))
                {
                    context.Response.Write("no:参数不能为空");
                    return;
                }
                if (bll.Update(classify))
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