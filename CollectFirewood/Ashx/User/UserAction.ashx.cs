using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace CollectFirewood.Ashx.User
{
    /// <summary>
    /// UserAction 的摘要说明
    /// </summary>
    public class UserAction : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {;
            context.Response.ContentType = "text/plain";
            BLL.UserManager bll = new BLL.UserManager();
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
                List<Model.User> list = bll.GetPageList(pageIndex, pageSize);
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
                int id = 0;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                var user = bll.GetModel(id);
                if (user == null)
                {
                    context.Response.Write("no:该用户不存在");
                    return;
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                context.Response.Write("ok:" + js.Serialize(user));
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
            // 修改
            else if (action == "edit")
            {
                int id;
                if (!int.TryParse(context.Request["id"], out id))
                {
                    context.Response.Write("error:非法的ID");
                    return;
                }
                Model.User user = bll.GetModel(id);
                if (user == null)
                {
                    context.Response.Write("no:该用户不存在");
                    return;
                }
                user.UserName = context.Request["userName"] == null ? user.UserName : context.Request["userName"];
                user.Nickname = context.Request["nickname"] == null ? user.UserName : context.Request["nickname"];
                user.Pwd = context.Request["pwd"] == null ? user.UserName : context.Request["pwd"];
                user.Sex = Convert.ToChar(context.Request["sex"] == null ? user.UserName : context.Request["sex"]);
                user.Phone = context.Request["phone"] == null ? user.UserName : context.Request["phone"];
                user.Address = context.Request["address"] == null ? user.UserName : context.Request["address"];
                if (string.IsNullOrWhiteSpace(user.Pwd))
                {
                    context.Response.Write("no:密码不能为空");
                }
                if (bll.Update(user))
                {
                    context.Response.Write("ok:修改成功");
                }
                else
                {
                    context.Response.Write("no:修改失败");
                }
            }
            // 添加
            else if (action == "add")
            {
                string username = context.Request["userName"];
                string pwd = context.Request["pwd"];
                char sex = Convert.ToChar(context.Request["sex"]==null?"\0": context.Request["sex"]);
                if(string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(pwd) || (sex)=='\0')
                {
                    context.Response.Write("no:参数错误");
                    return;
                }
                Model.User user = new Model.User();
                user.UserName = username;
                user.Nickname = context.Request["nickname"]==null? user.UserName : context.Request["nickname"];
                user.Pwd = pwd;
                user.Sex = sex;
                user.Phone = context.Request["phone"]==null?string.Empty: context.Request["phone"];
                user.Address = context.Request["address"] == null ? string.Empty : context.Request["address"];
                user.Url = context.Request["userUrl"] == null ? string.Empty : context.Request["userUrl"];
                user.Description = context.Request["description"] == null ? string.Empty : context.Request["description"];
                user.UserPic = context.Request["userPic"] == null ? string.Empty : context.Request["userPic"];

                if (bll.Add(user))
                {
                    context.Response.Write("ok:添加成功");
                }
                else 
                { 
                    context.Response.Write("no:添加失败");
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