using BLL;
using Model;
using CollectFirewood.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollectFirewood.Member
{
    public partial class Projectinfo : MemberPage
    {
        public Model.Project project;
        public Model.User User;
        protected void Page_Load(object sender, EventArgs e)
        {
            int ProjectId = int.Parse(Request.QueryString["Id"]);
            int UserId = int.Parse(((Session["user"] as User).Id).ToString());
            LikesManager likesManager = new LikesManager();
            Model.Likes likes = likesManager.GetModelByUserIdAndProjectId(UserId, ProjectId);
            //判断用户是否关注有该项目
            if (likes == null)
            {
                this.like.Text = "关注";
            }
            else
            {
                this.like.Text = "取消关注";
            }
            //获取项目数据
            ProjectManager projectManager = new ProjectManager();
            project = projectManager.GetModel(ProjectId);
            UserManager userManager = new UserManager();
            User = userManager.GetModel(project.OwnerId);
            SupportProject supportProject = new SupportProject();
            //获取评论
            CommentManager commentManager = new CommentManager();
            this.RepeaterComment.DataSource = commentManager.GetModelLinkUsers(UserId, ProjectId);
            this.RepeaterComment.DataBind();
            //获取回报内容
            Session["Return"] = project.Return;
            Session["ReturnMiddle"] = project.ReturnMiddle;
            Session["ReturnMax"] = project.ReturnMax;
            Session["ReturnTime"] = project.ReturnTime;
            Session["Freight"] = project.Freight;
            //获取支持者
            CalculationManager calculationManager = new CalculationManager();
            Session["Small"] = calculationManager.CountSupportPeopleSmall(ProjectId);
            Session["Middle"] = calculationManager.CountSupportPeopleMiddle(ProjectId);
            Session["Max"] = calculationManager.CountSupportPeopleMax(ProjectId);
            Session["CountOfSupport"] = calculationManager.CountSupportWhereProjectId(ProjectId);
        }

        protected void like_Click(object sender, EventArgs e)
        {
            LikesManager likesManager = new LikesManager();
            CalculationManager calculationManager = new CalculationManager();
            int UserId = int.Parse(((Session["user"] as User).Id).ToString());
            int ProjectId = int.Parse(Request.QueryString["Id"]);
            Model.Likes likes = likesManager.GetModelByUserIdAndProjectId(UserId, ProjectId);
            if (likes == null)
            {
                if (likesManager.Insert(UserId, ProjectId) > 0 && calculationManager.LikeCountAddition(ProjectId) > 0)
                {


                    Response.Write("<script>alert('关注成功！！');loaction.href='Projectinfo.aspx';</script>");
                    this.like.Text = "取消关注";
                    Response.Write("<script> window.location.href = document.URL; </script>");
                }
                else
                {
                    Response.Write("<script>alert('关注失败！！');</script>");
                }
            }
            else
            {
                if (likesManager.Delete(UserId, ProjectId) > 0 && calculationManager.LikeCountSubtraction(ProjectId) > 0)
                {
                    Response.Write("<script>alert('已取消关注！！');</script>");
                    this.like.Text = "关注";
                    Response.Write("<script> window.location.href = document.URL; </script>");
                }
                else
                {
                    Response.Write("<script>alert('取消失败！！');</script>");
                }
            }

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            Comment comment = new Comment()
            {
                UserId = int.Parse(((Session["user"] as User).Id).ToString()),
                ProjectId = int.Parse(Request.QueryString["Id"]),
                Content = this.Comment.Text,
                SendTime = DateTime.Now.ToString()

            };
            CommentManager commentManager = new CommentManager();
            if (this.Comment.Text == "")
            {
                Response.Write("<script>alert('请输入内容！');</script>");
                return;
            }
            else
            {
                if (commentManager.Add(comment))
                {
                    Response.Write("<script>alert('发表成功');</script>");
                    this.Comment.Text = "";
                    Response.Write("<script> window.location.href = document.URL; </script>");
                }
                else
                {
                    Response.Write("<script>alert('发表失败');</script>");
                }
            }
        }

        protected void support_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('请在下方输入支持金额！！');</script>");
        }

        protected void BtnOfSupportSmall_Click(object sender, EventArgs e)
        {
            CalculationManager calculationManager = new CalculationManager();
            ProjectManager projectManager = new ProjectManager();
            SupportProjectManager supportProjectManager = new SupportProjectManager();

            //用户捐款的金额
            decimal Money = int.Parse(this.SupportSmall.Text);
            int ProjectId = int.Parse(Request.QueryString["Id"]);
            int UserId = int.Parse(((Session["user"] as User).Id).ToString());
            Project project = projectManager.GetModel(ProjectId);
            //查看距离完成捐款还差多少钱
            decimal Difference = project.Goal - project.CurrentMoney;
            if (Difference == 0)
            {
                Response.Write("<script>alert('当前项目已筹到目标金额！');</script>");
                return;
            }
            else
            {
                if (Money < Difference)
                {
                    if (calculationManager.CurrentMoneyAddition(ProjectId, Money) > 0 && supportProjectManager.InsertData(UserId, ProjectId, Money) > 0)
                    {
                        Response.Write("<script>alert('感谢您的捐款，祝您生活愉快');</script>");
                        Response.Write("<script> window.location.href = document.URL; </script>" );
                    }
                    else
                    {
                        Response.Write("<script>alert('捐款失败');</script>");
                        return;
                    }

                }
                else
                {
                    Response.Write("<script>alert('捐款的金额过多！当前项目距离完成集资还差" + Difference + "'元);</script>");
                    return;
                }
            }
        }

        protected void btnofExit_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Write("<script>location.href='index.aspx';</script>");
        }
    }
}