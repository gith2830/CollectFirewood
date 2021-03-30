using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserService:IServiceBase<Model.User>
    {
        #region 接口方法
        public int GetModelCount()
        {
            string sql = "select count(*) from Users";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public Model.User GetModel(int id)
        {
            string sql = "select * from Users where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt == null || dt.Rows.Count <= 0)
            {
                return null;
            }
            Model.User model = new Model.User();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.UserName = dt.Rows[0]["UserName"].ToString();
            model.Sex = char.Parse(dt.Rows[0]["Sex"].ToString());
            model.Address = dt.Rows[0]["Address"].ToString();
            model.Description = dt.Rows[0]["Description"].ToString();
            model.Nickname = dt.Rows[0]["Nickname"].ToString();
            model.Url = dt.Rows[0]["Url"].ToString();
            model.UserPic = dt.Rows[0]["UserPic"].ToString();
            model.Pwd = dt.Rows[0]["Pwd"].ToString();
            model.Phone = dt.Rows[0]["Phone"].ToString();
            return model;
        }

        public Model.User GetModel(string username)
        {
            string sql = "select * from Users where Username=@username";
            SqlParameter p = new SqlParameter("@username", username);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt == null || dt.Rows.Count <= 0)
            {
                return null;
            }
            Model.User model = new Model.User();
            model.Id = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.UserName = dt.Rows[0]["UserName"].ToString();
            model.Sex = char.Parse(dt.Rows[0]["Sex"].ToString());
            model.Address = dt.Rows[0]["Address"].ToString();
            model.Description = dt.Rows[0]["Description"].ToString();
            model.Nickname = dt.Rows[0]["Nickname"].ToString();
            model.Url = dt.Rows[0]["Url"].ToString();
            model.UserPic = dt.Rows[0]["UserPic"].ToString();
            model.Pwd = dt.Rows[0]["Pwd"].ToString();
            model.Phone = dt.Rows[0]["Phone"].ToString();
            return model;
        }

        public List<Model.User> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from Users) as t where t.num between @start and @end";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@start",start),
                new SqlParameter("@end",end),
            };
            DataTable dt = DbHelper.GetDataTable(sql, ps);
            if (dt != null && dt.Rows.Count < 1)
            {
                return null;
            }
            List<Model.User> models = new List<Model.User>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                Model.User model = new Model.User();
                model.Id = Convert.ToInt32(dt.Rows[i]["Id"].ToString());
                model.UserName = dt.Rows[i]["UserName"].ToString();
                model.Sex = char.Parse(dt.Rows[i]["Sex"].ToString());
                model.Address = dt.Rows[i]["Address"].ToString();
                model.Description = dt.Rows[i]["Description"].ToString();
                model.Nickname = dt.Rows[i]["Nickname"].ToString();
                model.Url = dt.Rows[i]["Url"].ToString();
                model.UserPic = dt.Rows[i]["UserPic"].ToString();
                model.Pwd = dt.Rows[i]["Pwd"].ToString();
                model.Phone = dt.Rows[i]["Phone"].ToString();
                models.Add(model);
            }
            return models;
        }

        public int Add(Model.User user)
        {
            string sql = "insert into users([UserName],[Nickname],[Pwd],[Sex],[Phone],[Address],[Url],[Description],[UserPic]) values(@UserName,@Nickname,@Pwd,@Sex,@Phone,@Address,@Url,@Description,@UserPic)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserName",user.UserName),
                new SqlParameter("@Nickname",user.Nickname),
                new SqlParameter("@Pwd",user.Pwd),
                new SqlParameter("@Sex",user.Sex),
                new SqlParameter("@Phone",user.Phone),
                new SqlParameter("@Address",user.Address),
                new SqlParameter("@Url",user.Url),
                new SqlParameter("@Description",user.Description),
                new SqlParameter("@UserPic",user.UserPic),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from users where id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }

        public int Update(Model.User user)
        {
            string sql = "update users set UserName=@UserName,Nickname=@Nickname,Pwd=@Pwd,Sex=@Sex,Phone=@Phone,Address=@Address,Url=@Url,Description=@Description,UserPic=@UserPic where Id=@Id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@Id",user.Id),
                new SqlParameter("@UserName",user.UserName),
                new SqlParameter("@Nickname",user.Nickname),
                new SqlParameter("@Pwd",user.Pwd),
                new SqlParameter("@Sex",user.Sex),
                new SqlParameter("@Phone",user.Phone),
                new SqlParameter("@Address",user.Address),
                new SqlParameter("@Url",user.Url),
                new SqlParameter("@Description",user.Description),
                new SqlParameter("@UserPic",user.UserPic),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
        #endregion
        /// <summary>
        /// 当cookis还没过期
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int UpdateInfoHaveCookies(User user)
        {
            string sql = $"update users set Sex='{user.Sex}',Address='{user.Address}'where Id='{user.Id}'";
            return DbHelper.Update(sql);
        }

        /// <summary>
        /// 修改用户部分信息   昵称  性别  地址
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int UpdateInfo(User user)
        {
            string sql = $"update users set Nickname='{user.Nickname}',Sex='{user.Sex}',Address='{user.Address}'where Id='{user.Id}'";
            return DbHelper.Update(sql);
        }
        /// <summary>
        /// 修改用户密码
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int UpdatePassWord(User user)
        {
            string sql = $"update users set Pwd='{user.Pwd}'where Id='{user.Id}'";
            return DbHelper.Update(sql);
        }
        /// <summary>
        /// 修改用户其他信息  包括头像介绍
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int UpdateOther(User user)
        {
            string sql = $"update users set UserPic='{user.UserPic}',Description='{user.Description}'where Id='{user.Id}'";
            return DbHelper.Update(sql);
        }
        /// <summary>
        /// 修改用户其他信息  介绍
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public int UpdateOtherNoPic(User user)
        {
            string sql = $"update users set Description='{user.Description}'where Id='{user.Id}'";
            return DbHelper.Update(sql);
        }
        /// <summary>
        /// 当用户修改密码时判读手机是否输入正确
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public User PhoneNumberTest(User user)
        {
            string sql = $"select * from users where Phone='{user.Phone}' and id='{user.Id}'";
            SqlDataReader dr = DbHelper.GetReader(sql);
            User UserPhone = null;
            while (dr.Read())
            {
                UserPhone = new User()
                {
                    Id=int.Parse(dr["id"].ToString()),
                    Phone=dr["Phone"].ToString()
                };
            }
            dr.Close();
            return UserPhone;
        }
    }
}
