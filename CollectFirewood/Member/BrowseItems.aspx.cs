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
    public partial class BrowseItems : System.Web.UI.Page
    {
        public Model.Project Project;
        public int PageIndex { get; set; }
        public int PageCount { get; set; }
        public int ClassifyId { get; set; }
        public ProjectState State { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectManager projectManager = new ProjectManager();
            //int State = int.Parse(Request.QueryString["State"]);
            //projectManager.GetPageListForState()
            int pageIndex;
            int pageSize = 10;
            if (!int.TryParse(Request["pageIndex"], out pageIndex))
            {
                pageIndex = 1;
            }
            ProjectState state = Session["state"]==null?ProjectState.Null: (ProjectState)Enum.Parse(typeof(ProjectState),Session["state"].ToString());
            string id = Request["classifyId"];
            int classifyId = Session["classifyId"]==null?0: Convert.ToInt32(Session["classifyId"]);
            if (ProjectState.TryParse(Request["state"], out state)| int.TryParse(Request["classifyId"], out classifyId))
            {
                State = state;
                ClassifyId = classifyId;
                Session["classifyId"] = classifyId;
                Session["state"] = state;
                PageCount = projectManager.GetPageCount(classifyId, state, pageSize);
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageIndex = pageIndex > PageCount ? PageCount : pageIndex;
                PageIndex = pageIndex;
                this.ProjectList.DataSource = projectManager.GetPageListForState(PageIndex, pageSize, classifyId, state);
                this.ProjectList.DataBind();
            }
            else
            {
                PageCount = projectManager.GetPageCount(pageSize);
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageIndex = pageIndex > PageCount ? PageCount : pageIndex;
                PageIndex = pageIndex;
                this.ProjectList.DataSource = projectManager.GetPageList(PageIndex, pageSize);
                this.ProjectList.DataBind();
            }

            ClassifyManager classifyManager = new ClassifyManager();
            this.TypeList.DataSource = classifyManager.GetAllList();
            this.TypeList.DataBind();
        
            this.ProjectList.DataSource = projectManager.GetPageList(1,15);
            this.ProjectList.DataBind();
            
        }
    }
}