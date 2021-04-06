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
        public int? ClassifyId { get; set; }
        public ProjectState State { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.EnableViewState = false;
            ProjectManager projectManager = new ProjectManager();
            //int State = int.Parse(Request.QueryString["State"]);
            //projectManager.GetPageListForState()
            int pageIndex;
            int pageSize = 16;
            if (!int.TryParse(Request["pageIndex"], out pageIndex))
            {
                pageIndex = 1;
            }
            //ProjectState state = Session["state"] == null ? ProjectState.Null : (ProjectState)Enum.Parse(typeof(ProjectState), Session["state"].ToString());
            ProjectState state = Request["state"] == null ? ProjectState.Null : (ProjectState)Enum.Parse(typeof(ProjectState), Request["state"].ToString());
            if (Request["state"] != null)
            {
                Session["state"] = Convert.ToInt32(state);
            }
            int classifyId = Request["classifyId"] == null ? 0 : Convert.ToInt32(Request["classifyId"]);
            if (Request["classifyId"] != null)
            {
                Session["classifyId"] = classifyId;
            }
                //第二次
                State = state;
                //if (State == Model.ProjectState.Null)
                //{
                //    ClassifyId = classifyId;
                //    Session["classifyId"] = classifyId;
                //    Session["state"] = state;
                //    PageCount = projectManager.GetPageCount(classifyId, state, pageSize);
                //    pageIndex = pageIndex < 1 ? 1 : pageIndex;
                //    pageIndex = pageIndex > PageCount ? PageCount : pageIndex;
                //    PageIndex = pageIndex;
                //    this.ProjectList.DataSource = projectManager.GetPageListForState(PageIndex, pageSize, classifyId, state);
                //}
                ClassifyId = classifyId;
                PageCount = projectManager.GetPageCount(classifyId,state, pageSize);
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageIndex = pageIndex > PageCount ? PageCount : pageIndex;
                PageIndex = pageIndex;
                this.ProjectList.DataSource = projectManager.GetPageListForState(PageIndex, pageSize, classifyId, state);
            ClassifyManager classifyManager = new ClassifyManager();
            this.TypeList.DataSource = classifyManager.GetAllList();
            DataBind();
        }

        protected void btnofExit_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Write("<script>location.href='index.aspx';</script>");
        }
    }
}