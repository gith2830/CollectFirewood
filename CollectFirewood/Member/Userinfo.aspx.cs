using CollectFirewood.Base;
using Model;
using System;
using BLL;
using Common;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class UserInfo : MemberPage // 继承MemberPage未登录的用户自动跳转到登录页面
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int UserId = (Session["user"] as Model.User).Id;
            if (!IsPostBack)
            {
                UserManager userManager = new UserManager();
                User user = userManager.GetModel(UserId);
                this.Nickname.Text = user.Nickname;
                this.Info_Address.Text = user.Address;
                this.Description.Text = user.Description;
                this.RadioButtonListOfSex.SelectedValue = user.Sex.ToString();
                


            }
            ProjectManager projectManager = new ProjectManager();
            List<Project> list = projectManager.GetModelByIdTest(int.Parse(((Session["user"] as User).Id).ToString()));
            this.RepeaterReturnMoney.DataSource = projectManager.RetuenMoney(UserId);
            this.RepeaterProject.DataSource = list;
            DataBind();

        }
        protected void UpdateOfInfo_Click(object sender, EventArgs e)
        {
            User user = new User()
            {
                Id = int.Parse(((Session["user"] as User).Id).ToString()),
                Nickname = this.Nickname.Text,
                Sex = this.RadioButtonListOfSex.SelectedValue.ToString()[0],
                Address = this.Info_Address.Text,
                Phone = this.Info_Phone.Text
            };
            UserManager userManager = new UserManager();
            if (userManager.PhoneNumberTest(user) != null)
            {
                if (this.Info_Address.Text == "")
                {
                    Response.Write("<script>alert('请输入地址！');</script>");
                    return;
                }
                else
                {

                    if (userManager.UpdateInfo(user) > 0)
                    {

                        Response.Write("<script>alert('修改成功');</script>");
                        Response.Write("<script> window.location.href = document.URL; </script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('修改失败');</script>");
                        return;
                    }

                }
            }
            else
            {
                Response.Write("<script>alert('请输入正确的手机号码');</script>");
                return;
            }
        }

        protected void BtnOfUpdatePassWord_Click(object sender, EventArgs e)
        {
            if (this.ConfirmPassword.Text == "" || this.NewPassWord.Text == "")
            {
                Response.Write("<script>alert('请输入密码！');</script>");
                return;
            }
            else
            {
                UserManager userManager = new UserManager();
                User user = new User()
                {
                    Id = int.Parse(((Session["user"] as User).Id).ToString()),
                    Pwd = MD5Helper.GetMD5String(this.NewPassWord.Text),
                    Phone = this.PassWord_PhoneNumber.Text
                };
                if (user.Pwd == MD5Helper.GetMD5String(this.ConfirmPassword.Text))
                {
                    if (userManager.PhoneNumberTest(user) != null)
                    {
                        if (userManager.UpdatePassWord(user) > 0)
                        {
                            Session["user"] = null;
                            Response.Write("<script>alert('修改成功');</script>");
                            Response.Redirect("index.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('修改失败');</script>");
                            return;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('请输入正确的手机号码');</script>");
                        return;
                    }
                }
                else
                {
                    Response.Write("<script>alert('两次密码输入不一致');</script>");
                    return;
                }
            }
        }

        protected void BtnOfUpdate_Click(object sender, EventArgs e)
        {
            if (this.Description.Text == "")
            {
                Response.Write("<script>alert('请填写个人说明！');</script>");
                return;
            }
            else
            {
                UserManager userManager = new UserManager();
                User userinfo = userManager.GetModel(int.Parse(((Session["user"] as User).Id).ToString()));
                if (this.Content__Detailed__Cover1.HasFile)
                {
                    string fileName = Content__Detailed__Cover1.FileName;
                    string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                    if (fileFix != "png" && fileFix != "jpg")
                    {
                        Response.Write("<script>alert('上传的类别不是图片类型！');<script>");
                        return;
                    }
                    else
                    {
                        Content__Detailed__Cover1.SaveAs(Server.MapPath("~/Material/") + fileName);
                        string Path = "/Material/" + fileName;
                        User user = new User()
                        {
                            Id = int.Parse(((Session["user"] as User).Id).ToString()),
                            UserPic = Path,
                            Phone = this.Other_Phone.Text,
                            Description = this.Description.Text
                        };
                        if (userManager.PhoneNumberTest(user) != null)
                        {
                            if (userManager.UpdateOther(user) > 0)
                            {
                                Response.Write("<script>alert('修改成功');</script>");
                                Response.Write("<script> window.location.href = document.URL; </script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('修改失败');</script>");
                                return;
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('请输入正确的手机号码');</script>");
                            return;
                        }
                    }
                }
                else
                {
                    string Path = userinfo.UserPic;
                    User user = new User()
                    {
                        Id = int.Parse(((Session["user"] as User).Id).ToString()),
                        UserPic = Path,
                        Phone = this.Other_Phone.Text,
                        Description = this.Description.Text
                    };
                    if (userManager.PhoneNumberTest(user) != null)
                    {
                        if (userManager.UpdateOtherNoPic(user) > 0)
                        {
                            Response.Write("<script>alert('修改成功');</script>");
                            Response.Write("<script> window.location.href = document.URL; </script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('修改失败');</script>");
                            return;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('请输入正确的手机号码');</script>");
                        return;
                    }
                }
            }
        }
    }
}