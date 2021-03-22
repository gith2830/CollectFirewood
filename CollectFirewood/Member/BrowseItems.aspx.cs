using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class BrowseItems : System.Web.UI.Page
    {
        public Model.Project Project;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectManager projectManager = new ProjectManager();
            //int State = int.Parse(Request.QueryString["State"]);
            //projectManager.GetPageListForState()
            
            
            this.ProjectList.DataSource = projectManager.GetPageList(1,15);
            DataBind();

            ClassifyManager classifyManager = new ClassifyManager();
            this.TypeList.DataSource = classifyManager.GetAllList();
            DataBind();
            
            
        }
    }
}