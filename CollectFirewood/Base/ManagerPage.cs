using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollectFirewood.Base
{
    public class ManagerPage:BasePage
    {
        public ManagerPage() : base("/Manager/", "/Manager/Login.aspx", "admin") { }
    }
}