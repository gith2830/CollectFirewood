using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = this.username.Text;
            string password = this.password.Text;
            if (username=="" || password=="")
            {
                Response.Write("<script>alert('用户名或密码不能为空！');</script>");
            }
            else
            {
                if (checkbox.Checked)
                {
                    UserManager userManager = new UserManager();
                    if (userManager.Login(username, password))
                    {
                        Response.Redirect("index.aspx");                       
                    }
                    else
                    {
                        Response.Write("<script>alert('请确认是否输入正确的用户名或密码！！');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('请勾选服务协议！！！！！');</script>");
                    return;
                }
            }
            
        }
    }
}