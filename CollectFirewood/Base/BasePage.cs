using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CollectFirewood.Base
{
    public class BasePage:Page
    {
        public BasePage(string checkPath,string redirectPath,string sessionName)
        {
            this.CheckPath = checkPath;
            this.RedirectPath = redirectPath;
            this.SessionName = sessionName;
        }
        public string CheckPath { get; set; }
        public string RedirectPath { get; set; }
        public string SessionName { get; set; }
        // 页面初始化
        protected virtual void Page_Init(object sender, EventArgs e)
        {
            string path = Request.Url.LocalPath;
            if (path.Contains(RedirectPath))
            {
                return;
            }
            if (path.Contains(CheckPath))
            {
                if (Session[SessionName] == null)
                {
                    Response.Redirect("~"+RedirectPath);
                    return;
                }
            }
        }
    }
}