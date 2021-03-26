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
        public int PageIndex { get; set; }
        public int PageCount { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClassifyManager classifyManager = new ClassifyManager();
                this.TypeList.DataSource = classifyManager.GetAllList();
                ProjectManager projectManager = new ProjectManager();
                int pageIndex;
                int pageSize = 10;
                if (!int.TryParse(Request["pageIndex"], out pageIndex))
                {
                    pageIndex = 1;
                }
                int pageCount = projectManager.GetPageCount(pageSize);
                PageCount = pageCount;
                pageIndex = pageIndex < 1 ? 1 : pageIndex;
                pageIndex = pageIndex > pageCount ? pageCount : pageIndex;
                PageIndex = pageIndex;
                this.ProjectList.DataSource = projectManager.GetPageList(PageIndex, pageSize);
                DataBind();
            }

            {
                ClassifyManager classifyManager = new ClassifyManager();
                this.TypeList.DataSource = classifyManager.GetAllList();
                this.TypeList.DataBind();
                if (!IsPostBack)
                {
                    if (Request["ClassifyId"] == null)
                    {
                        ProjectManager projectManager = new ProjectManager();
                        this.ProjectList.DataSource = projectManager.GetPageList(1, 15);
                        this.ProjectList.DataBind();
                    }
                    else
                    {
                        int classifyId = int.Parse(Request["ClassifyId"].ToString());
                        ProjectManager projectManager = new ProjectManager();
                        this.ProjectList.DataSource = projectManager.GetModelByClassifyId(classifyId);
                        this.ProjectList.DataBind();
                    }
                }

            }
        }
    }
}