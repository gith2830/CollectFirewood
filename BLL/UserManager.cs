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
        // dal接口 调用执行dal层的方法
        DAL.UserService dal = new DAL.UserService();
        public UserManager()
        {
            //传入父类初始化接口
            base.Dal = dal;
        }

        public override bool Add(User model)
        {       
            if (dal.Add(model) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public override bool Delete(int id)
        {
            var commentmanager = new BLL.CommentManager();
            commentmanager.DeleteAllByUserId(id);
            var supportProjectManager = new BLL.SupportProjectManager();
            supportProjectManager.DeleteAllByUserId(id);
            if (dal.Delete(id)>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 登录方法
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="password">密码</param>
        /// <param name="outUser">返回的user</param>
        /// <returns>是否登录成功</returns>
        public bool Login(string username, string password, out User outUser)
        {
            User user = dal.GetModel(username);
            outUser = user;
            if (user == null) 
            {
                return false;
            }
            if (username == user.UserName && Common.MD5Helper.GetMD5String(password) == user.Pwd)
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int Register(User user)
        {
            UserManager userManager = new UserManager();
            user.Pwd = Common.MD5Helper.GetMD5String(user.Pwd);
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

        public int UpdateInfo(User user)
        {
            UserService userService = new UserService();
            return userService.UpdateInfo(user);
        }
        public int UpdatePassWord(User user)
        {
            UserService userService = new UserService();
            return userService.UpdatePassWord(user);
        }
        public int UpdateOther(User user)
        {
            UserService userService = new UserService();
            return userService.UpdateOther(user);
        }
        public User PhoneNumberTest(User user)
        {
            UserService userService = new UserService();
            return userService.PhoneNumberTest(user);
        }
        public int UpdateInfoHaveCookies(User user)
        {
            UserService userService = new UserService();
            return userService.UpdateInfoHaveCookies(user);
        }
        public int UpdateOtherNoPic(User user)
        {
            UserService userService = new UserService();
            return userService.UpdateOtherNoPic(user);
        }
    }
}
