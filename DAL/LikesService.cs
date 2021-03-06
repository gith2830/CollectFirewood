using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LikesService
    {
        public Model.Likes GetModelByUserIdAndProjectId(int UserId,int ProjectId)
        {
            string sql = $"select * from Likes where UserId='{UserId}' and ProjectId='{ProjectId}'";
            SqlDataReader dr = DbHelper.GetReader(sql);
            Model.Likes likes = null;
            while (dr.Read())
            {
                likes = new Model.Likes()
                {
                    UserId = int.Parse(dr["UserId"].ToString()),
                    ProjectId=int.Parse(dr["ProjectId"].ToString())
                };
            }
            dr.Close();
            return likes;
        }

        public int Insert(int UserId,int ProjectId)
        {
            string sql = $"INSERT INTO [dbo].[Likes] ([UserId] ,[ProjectId])VALUES('{UserId}' ,'{ProjectId}')";
            return DbHelper.Update(sql);
        }

        public int Delete(int UserId,int ProjectId)
        {
            string sql = $"DELETE FROM [dbo].[Likes] where UserId='{UserId}' and ProjectId='{ProjectId}'";
            return DbHelper.Update(sql);
        }

        public int Delete(Dictionary<string,object> dicWhere)
        {
            StringBuilder sql = new StringBuilder("delete from Likes where 1=1");
            List<SqlParameter> pList = new List<SqlParameter>();
            foreach (var item in dicWhere)
            {
                sql.Append(" and " + item.Key + "=@" + item.Key.ToString());
                pList.Add(new SqlParameter("@" + item.Key, item.Value));
            }
            return DbHelper.ExecuteNotQuery(sql.ToString(), pList.ToArray());
        }
    }
}
