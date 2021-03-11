using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AdminManager:ManagerBase<Model.Admin>
    {
        DAL.AdminService dal = new DAL.AdminService();
        public AdminManager()
        {
            base.Dal = dal;
        }
        public bool Login(string adminName,string adminPwd,out string msg,out Model.Admin admin)
        {
            admin = dal.GetModel(adminName);
            if (admin != null)
            {
                if(admin.Pwd == adminPwd)
                {
                    msg = "ok:登录成功";
                    return true;
                }
            }
            msg = "no:用户名或密码错误";
            return false;
        }
    }
}
