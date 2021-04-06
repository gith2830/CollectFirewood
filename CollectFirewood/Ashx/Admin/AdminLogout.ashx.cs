using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace CollectFirewood.Ashx.Admin
{
    /// <summary>
    /// Logout 的摘要说明
    /// </summary>
    public class Logout : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session["admin"] = null;
            context.Response.Write("ok:退出成功");
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