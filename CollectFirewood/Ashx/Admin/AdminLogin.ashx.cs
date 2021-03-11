using System.Web;
using System.Web.SessionState;

namespace CollectFirewood.ashx
{
    /// <summary>
    /// AdminLogin 的摘要说明
    /// </summary>
    public class AdminLogin : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.ContentType = "text/html";
            Login(context);
        }
        private void Login(HttpContext context)
        {
            BLL.AdminManager bll = new BLL.AdminManager();
            string userName = context.Request["txtName"];
            string userPwd = context.Request["txtPwd"];
            Model.Admin admin = null;
            string msg = string.Empty;
            if (bll.Login(userName, userPwd, out msg, out admin))
            {
                context.Session["admin"] = admin;
                
            }
            context.Response.Write(msg);
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