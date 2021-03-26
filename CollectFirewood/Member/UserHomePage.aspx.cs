using BLL;
using CollectFirewood.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class UserHomePage : MemberPage // 继承MemberPage未登录的用户自动跳转到登录页面
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["State"] == null)
            {
                ProjectManager projectManager = new ProjectManager();
                int UserId = (Session["user"] as Model.User).Id;
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelById(UserId);
                this.RepeaterOfProjectInfo.DataBind();
            }
            else if(int.Parse(Request["State"]) == 1)
            {
                ProjectManager projectManager = new ProjectManager();
                int UserId = (Session["user"] as Model.User).Id;
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelByIdAndState(UserId,1);
                this.RepeaterOfProjectInfo.DataBind();
            }
            else
            {
                ProjectManager projectManager = new ProjectManager();
                int UserId = (Session["user"] as Model.User).Id;
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelByIdAndState(UserId, 0);
                this.RepeaterOfProjectInfo.DataBind();
            }
           
        }

        protected void btnUserInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userinfo.aspx");
        }
    }
}