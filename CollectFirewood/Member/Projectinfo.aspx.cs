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
    public partial class Projectinfo : MemberPage
    {
        public Model.Project project;
        public Model.User User;
        protected void Page_Load(object sender, EventArgs e)
        {
            int ProjectId = int.Parse(Request.QueryString["Id"]);
            ProjectManager projectManager = new ProjectManager();
            project = projectManager.GetModel(ProjectId);
            UserManager userManager = new UserManager();
            User = userManager.GetModel(project.OwnerId);
            SupportProject supportProject = new SupportProject();
            
        }
    }
}