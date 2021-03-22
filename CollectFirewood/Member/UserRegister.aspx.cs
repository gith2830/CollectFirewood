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
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random numbercode = new Random();
                int code = numbercode.Next(1000, 9999);
                this.getnumbercode.Text = code.ToString();
                Session["code"] = code;
            }
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string userphone = this.userphone.Text;
            string nickname = this.nickname.Text;
            string username = this.username.Text;
            string password = this.password.Text;
            char sex = Convert.ToChar( this.RadioButtonList1.SelectedValue);
            int numbercode =int.Parse(this.numbercode.Text);
            //判读是否打勾
            if (checkbox.Checked)
            {
                //判断验证码是否输入正确
                if (numbercode != int.Parse(Session["code"].ToString()))
                {
                    Response.Write("<script>alert('验证码不正确！');</script>");
                    return;
                }
                else
                {
                    UserManager userManager = new UserManager();
                    //判断用户名是否存在
                    if (userManager.SearchUsername(username))
                    {
                        Response.Write("<script>alert('用户名已存在！');</script>");
                        this.username.Text = "";
                        this.username.Focus();
                        return;
                    }
                    else
                    {                        
                        User user = new User();
                        user.UserName = username;
                        user.Nickname = nickname;
                        user.Phone = userphone;
                        user.Pwd = password;
                        user.Sex = sex;
                        user.Address = "尚未填写";
                        user.Description = "这个人很懒，什么都没有留下";
                        user.Url = "";
                        user.UserPic = "/Material/人.png";
                        if (userManager.Register(user)==1)
                        {
                            Response.Write("<script>alert('注册成功！');</script>");
                            Response.Redirect("UserLogin.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('注册失败！');</script>");
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('请阅读并同意《服务协议》！！');</script>");
                return;
            }
        }
    }
}