using CollectFirewood.Base;
using System;
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

        }
    }
}