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
    public partial class Index : System.Web.UI.Page
    {
        public int PageIndex { get; set; }
        public int PageCount { get; set; }
        public int ClassifyId { get; set; }
        public ProjectState State { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProjectManager projectManager = new ProjectManager();
            CalculationManager calculationManager = new CalculationManager();
            projectManager.OverDate();

            this.EnableViewState = false;
            Session["SumOfProject"] = calculationManager.SumOfProject();
            Session["SumOfCurrentMoney"] = calculationManager.SumOfCurrentMoney();
            Session["SumOfSupportProjects"] = calculationManager.SumOfSupportProjects();
            ClassifyManager classifyManager = new ClassifyManager();
            this.TypeList.DataSource = classifyManager.GetAllList();
            int pageIndex;
            int pageSize = 16;
            if (!int.TryParse(Request["pageIndex"], out pageIndex))
            {
                pageIndex = 1;
            }
            int pageCount = projectManager.GetPageCount(pageSize);
            PageCount = pageCount;
            pageIndex = pageIndex < 1 ? 1 : pageIndex;
            pageIndex = pageIndex > pageCount ? pageCount : pageIndex;
            PageIndex = pageIndex;
            string keyword = Request.QueryString["KeyWords"];
            this.ProjectList.DataSource = projectManager.GetPageList(PageIndex, pageSize, keyword);
            string id = Request["classifyId"];
            int classifyId = Session["classifyId"] == null ? 0 : Convert.ToInt32(Session["classifyId"]);
            ProjectState state = Session["state"] == null ? ProjectState.Null : (ProjectState)Enum.Parse(typeof(ProjectState), Session["state"].ToString());
            if (ProjectState.TryParse(Request["state"], out state) | int.TryParse(Request["classifyId"], out classifyId))
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
            }
            else
            {
                PageCount = projectManager.GetPageCount(pageSize);
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageIndex = pageIndex > PageCount ? PageCount : pageIndex;
                PageIndex = pageIndex;                
                this.ProjectList.DataSource = projectManager.GetPageList(PageIndex, pageSize, keyword);
            }
            DataBind();
        }

        protected void btnofExit_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Write("<script>location.href='index.aspx';</script>");
        }
    }


}
    
