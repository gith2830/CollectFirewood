using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectManager projectManager = new ProjectManager();
            this.ProjectList.DataSource = projectManager.GetPageList(1,15);
            //DataBind();
        }
    }
}