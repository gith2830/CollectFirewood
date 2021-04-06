using BLL;
using Model;
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
            ProjectManager projectManager = new ProjectManager();
            int UserId = (Session["user"] as Model.User).Id;
            CalculationManager calculationManager = new CalculationManager();
            Session["SumOfProject"] = calculationManager.SumOfProject();
            Session["SumOfCurrentMoney"] = calculationManager.SumOfCurrentMoney();
            Session["SumOfSupportProjects"] = calculationManager.SumOfSupportProjects();
            if (Request["State"]== null||int.Parse(Request["State"])==2)
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelById(UserId);
            }
            else if(int.Parse(Request["State"]) == 1)
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelByIdAndState(UserId,1);
            }
            else
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetModelByIdAndState(UserId, 0);
            }
            if (Request["Like"] != null)
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetProjectUserLikes(UserId);
            }
            if (Request["Support"] != null)
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetProjectUserSupport(UserId);
            }
            if (Request["Launch"] != null)
            {
                this.RepeaterOfProjectInfo.DataSource = projectManager.GetProjectUserLaunch(UserId);
            }
            DataBind();
           
        }

        protected void btnUserInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Userinfo.aspx");
        }

        protected void btnofExit_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("index.aspx");
        }
    }
}