using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Master
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnofExit_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Write("<script>location.href='index.aspx';</script>");
        }
    }
}