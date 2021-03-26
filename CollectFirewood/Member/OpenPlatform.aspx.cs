using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class OpenPlatform : System.Web.UI.Page
    {
        public Model.User user;
        public Model.Project project;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectManager projectManager = new ProjectManager();
            List<Project> list = projectManager.GetModelByAll();
            this.ProjectList.DataSource = list;     
            this.ProjectList.DataBind();

        }

        protected void btnOfMore_Click(object sender, EventArgs e)
        {
            if(Session["user"] as Model.User == null)
            {
                Response.Write("<script>alert('查看更多项目内容需要登录！');</script>");
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}