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
<<<<<<< HEAD
        public bool Login(string username,string password,out User outUser)
=======
        /// <summary>
        /// 登录方法
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool Login(string username,string password)
>>>>>>> 1a4b18b44d774ee80435e640f2286eea88a97cf8
        {
            User user = dal.GetModel(username);
            outUser = user;
            if (user == null) 
            {
                return false;
            }
            if (username == user.UserName && password == user.Pwd)
            {
                return true;
            }
            return false;
        }

        public int Register(User user)
        {
            UserManager userManager = new UserManager();
            if (userManager.Add(user))
            {
                return 1;
            }
            return 0;
        }
        /// <summary>
        /// 查询用户是否存在
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public bool SearchUsername(string username)
        {
            User user = dal.GetModel(username);
            if (user == null)
            {
                return false;
            }
            return true;
        }
    }
}
