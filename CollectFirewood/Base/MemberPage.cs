using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollectFirewood.Base
{
    public class MemberPage:BasePage
    {
        public MemberPage(): base("/Member/", "/Member/UserLogin.aspx", "user") { }
    }
}