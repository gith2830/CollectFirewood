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
    public class LaunchInfoService:IServiceBase<LaunchInfo>
    {
        public int Add(LaunchInfo model)
        {
            string sql = "insert into LaunchInfo([UserId],[TrueName],[PhoneNumber],[BankName],[Branch],[BankCard],[Address],[ProjectId]) VALUES(@UserId,@TrueName,@PhoneNumber,@BankName,@Branch,@BankCard,@Address,@ProjectId)";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@TrueName",model.TrueName),
                new SqlParameter("@PhoneNumber",model.PhoneNumber),
                new SqlParameter("@BankName",model.BankName),
                new SqlParameter("@Branch",model.Branch),
                new SqlParameter("@BankCard",model.BankCard),
                new SqlParameter("@Address",model.Address),
                new SqlParameter("@ProjectId",model.ProjectId),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }

        public int Delete(int id)
        {
            string sql = "delete from LaunchInfo where id = @id";
            SqlParameter p = new SqlParameter("@id", id);
            return DbHelper.ExecuteNotQuery(sql, p);
        }
        public int Delete(Dictionary<string,object> dicWhere)
        {
            StringBuilder sql = new StringBuilder("delete from LaunchInfo where 1=1");
            List<SqlParameter> pList = new List<SqlParameter>();
            foreach (var item in dicWhere)
            {
                sql.Append(" and " + item.Key + "=@" + item.Key.ToString());
                pList.Add(new SqlParameter("@" + item.Key, item.Value));
            }
            return DbHelper.ExecuteNotQuery(sql.ToString(), pList.ToArray());
        }

        public LaunchInfo GetModel(int id)
        {
            string sql = "select * from LaunchInfo where Id=@id";
            SqlParameter p = new SqlParameter("@id", id);
            DataTable dt = DbHelper.GetDataTable(sql, p);
            if (dt == null || dt.Rows.Count < 1)
            {
                return null;
            }
            Model.LaunchInfo model = new Model.LaunchInfo();
            model.UserId = Convert.ToInt32(dt.Rows[0]["Id"].ToString());
            model.TrueName = dt.Rows[0]["TrueName"].ToString();
            model.PhoneNumber = dt.Rows[0]["PhoneNumber"].ToString();
            model.BankName = dt.Rows[0]["BankName"].ToString();
            model.Branch = dt.Rows[0]["Branch"].ToString();
            model.BankCard = dt.Rows[0]["BankCard"].ToString();
            model.Address = dt.Rows[0]["Address"].ToString();
            model.ProjectId = Convert.ToInt32(dt.Rows[0]["ProjectId"]==DBNull.Value?"0": dt.Rows[0]["ProjectId"]);
            return model;
        }

        public int GetModelCount()
        {
            string sql = "select count(*) from LaunchInfo";
            return (int)DbHelper.ExecuteScalar(sql);
        }

        public List<LaunchInfo> GetPageList(int start, int end)
        {
            string sql = "select * from(select *,row_number()over(order by id) as num from LaunchInfo) as t where t.num between @start and @end";
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
            List<Model.LaunchInfo> models = new List<Model.LaunchInfo>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                models.Add(new LaunchInfo() {
                    UserId = Convert.ToInt32(dt.Rows[i]["Id"].ToString()),
                    TrueName = dt.Rows[i]["TrueName"].ToString(),
                    PhoneNumber = dt.Rows[i]["PhoneNumber"].ToString(),
                    BankName = dt.Rows[i]["BankName"].ToString(),
                    Branch = dt.Rows[i]["Branch"].ToString(),
                    BankCard = dt.Rows[i]["BankCard"].ToString(),
                    Address = dt.Rows[i]["Address"].ToString(),
                    ProjectId = Convert.ToInt32(dt.Rows[i]["ProjectId"]==DBNull.Value?"0": dt.Rows[i]["ProjectId"]),
            });
            }
            return models;
        }

        public int Launch(LaunchInfo launchInfo)
        {
            string sql = $"INSERT INTO [dbo].[LaunchInfo]([UserId],[TrueName],[PhoneNumber],[BankName],[Branch],[BankCard],[Address],[ProjectId])" +
                $"VALUES('{launchInfo.UserId}','{launchInfo.TrueName}','{launchInfo.PhoneNumber}','{launchInfo.BankName}','{launchInfo.Branch}','{launchInfo.BankCard}','{launchInfo.Address}','{launchInfo.ProjectId}')";
            return DbHelper.Update(sql);
        }

        public int Update(LaunchInfo model)
        {
            string sql = "update classifys set LaunchInfo = @ClassifyName  where id = @id";
            SqlParameter[] ps = new SqlParameter[]
            {
                new SqlParameter("@UserId",model.UserId),
                new SqlParameter("@TrueName",model.TrueName),
                new SqlParameter("@PhoneNumber",model.PhoneNumber),
                new SqlParameter("@BankName",model.BankName),
                new SqlParameter("@Branch",model.Branch),
                new SqlParameter("@BankCard",model.BankCard),
                new SqlParameter("@Address",model.Address),
                new SqlParameter("@ProjectId",model.ProjectId),
            };
            return DbHelper.ExecuteNotQuery(sql, ps);
        }
    }
}
