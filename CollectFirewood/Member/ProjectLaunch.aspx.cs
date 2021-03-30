using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using BLL;
using System.Web.UI;
using System.Web.UI.WebControls;
using CollectFirewood.Base;

namespace CollectFirewood.Member
{
    public partial class ProjectLaunch : MemberPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            LaunchInfoManager launchInfoManager = new LaunchInfoManager();
            ProjectManager projectManager = new ProjectManager();
            int UserId = int.Parse(((Session["user"] as User).Id).ToString());
            if (this.Content__Detailed__Cover.HasFile)
            {
                string fileName = Content__Detailed__Cover.FileName;
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                if (fileFix != "png" && fileFix != "jpg")
                {
                    Response.Write("<script>alert('上传的类别不是图片类型！');<script>");
                }
                else
                {
                    Content__Detailed__Cover.SaveAs(Server.MapPath("~/Material/") + fileName);
                    Session["CoverImg"] = "/Material/" + fileName;
                  
                }
            }
            //Session["ProjectName"] = this.Content__Detailed__inputName.Text;
            //Session["Goal"] = Convert.ToDecimal(this.Content__Detailed__inputMoney.Text);
            //Session["Deadline"] = int.Parse(this.Content__Detailed__inputDay.Text);
            //Session["ClassfyId"] = int.Parse(this.DropDownListByTypes.SelectedValue);
            //Session["Address"] = this.Content__Detailed__Address.Text;
            //Session["Content"] = this.Content__Detailed__Details.Text;
            //Session["Goal"] = Convert.ToDecimal(this.TextBox2.Text);
            //Session["Return"] = this.TextBox3.Text;
            //Session["ReturnTime"] = this.TextBox6.Text;
            //Session["Freight"] = this.TextBox5.Text;

            //Session["TrueName"] = this.TextBox7.Text;
            //Session["UserAddress"] = this.UserAddress.Text;
            //Session["PhoneNumber"] = this.TextBox8.Text;
            //Session["BankName"] = this.TextBox9.Text;
            //Session["Branch"] = this.TextBox10.Text;
            //Session["BankId"] = this.TextBox12.Text;
            Project project = new Project()
            {
                ProjectName = this.Content__Detailed__inputName.Text.ToString(),
                Goal = Convert.ToDecimal(this.Content__Detailed__inputMoney.Text),
                Deadline = DateTime.Now.AddDays(100),
                ClassifyId= int.Parse(this.DropDownListByTypes.SelectedValue.ToString()),
                Address= this.Content__Detailed__Address.Text.ToString(),
                Content= this.Content__Detailed__Details.Text.ToString(),
                Return=this.TextBox3.Text.ToString(),
                ReturnMiddle=this.TextBox1.Text.ToString(),
                ReturnMax=this.TextBox4.Text.ToString(),
                OwnerId=UserId,
                CoverImg=Session["CoverImg"].ToString(),
                ReturnTime=int.Parse(this.TextBox6.Text.ToString())

            };


            if (projectManager.ProjectLaunch(project) > 0)
            {
                Project NewProject = new Project();
                NewProject= projectManager.GetProjectLaunchId(UserId);
                LaunchInfo launchInfo = new LaunchInfo()
                {
                    ProjectId = NewProject.Id,
                    TrueName = this.TextBox7.Text.ToString(),
                    UserId = UserId,
                    Address = this.UserAddress.Text.ToString(),
                    PhoneNumber = this.TextBox8.Text.ToString(),
                    BankName = this.TextBox9.Text.ToString(),
                    Branch = this.TextBox10.Text.ToString(),
                    BankCard = this.TextBox12.Text.ToString()
                };
                if (launchInfoManager.Launch(launchInfo) > 0)
                {
                    Response.Write("<script>alert('项目已经发布成功，请等待审核！');</script>");
                    Response.Write("<script>window.location.href='Examine.aspx';</script>");
                   
                }
            }              
        }
    }
}