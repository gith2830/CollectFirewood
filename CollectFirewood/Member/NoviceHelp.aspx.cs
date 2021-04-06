using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class NoviceHelp : System.Web.UI.Page
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