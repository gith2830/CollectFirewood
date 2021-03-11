using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class UserManager : ManagerBase<User>
    {
        DAL.UserService dal = new DAL.UserService();
        public UserManager()
        {
            base.Dal = dal;
        }
        public bool Login(string username,string password)
        {
            User user = dal.GetModel(username);
            if (user == null) 
            {
                return false;
            }
            if (user.UserName == username && password == user.Pwd)
            {
                return true;
            }
            return false;
        }
    }
}
