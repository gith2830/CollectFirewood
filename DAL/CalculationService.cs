using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DAL
{
    public class CalculationService
    {
        /// <summary>
        /// 项目总数总和
        /// </summary>
        /// <returns></returns>
        public int SumOfProject()
        {
            string sql = "select COUNT(id) as SumOfPeoject from Projects ";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int sum = 0;
            while (dr.Read())
            {
                sum = int.Parse(dr["SumOfPeoject"].ToString());
            }
            dr.Close();
            return sum;
        }
        /// <summary>
        /// 收到的众筹资总和
        /// </summary>
        /// <returns></returns>
        public int SumOfCurrentMoney()
        {
            string sql = "select sum(CurrentMoney) as SumOfCurrentMoney from Projects ";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int sum = 0;
            while (dr.Read())
            {
                sum = (int)Convert.ToDecimal(dr["SumOfCurrentMoney"].ToString());
            }
            dr.Close();
            return sum;
        }

        public int SumOfSupportProjects()
        {
            string sql = "select count(id) as SumOfSupportProjects from SupportProjects";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int sum = 0;
            while (dr.Read())
            {
                sum = (int)Convert.ToDecimal(dr["SumOfSupportProjects"].ToString());
            }
            dr.Close();
            return sum;
        }

        public int LikeCountAddition(int ProjectId)
        {
            string sql = $"update Projects set LikeCount= LikeCount+1 where id='{ProjectId}'";
            return DbHelper.Update(sql);
        }
        public int LikeCountSubtraction(int ProjectId)
        {
            string sql = $"update Projects set LikeCount= LikeCount-1 where id='{ProjectId}'";
            return DbHelper.Update(sql);
        }
        public int CurrentMoneyAddition(int ProjectId, decimal Money)
        {
            string sql = $"update Projects set CurrentMoney= CurrentMoney+'{Money}' where id='{ProjectId}'";
            return DbHelper.Update(sql);
        }
        public int CountSupportPeopleSmall(int ProjectId)
        {
            string sql = $"select COUNT(*) as SupportPeople from SupportProjects where ProjectId='{ProjectId}' and Money between 300 and 1000";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int num = 0;
            while (dr.Read())
            {
                num = int.Parse(dr["SupportPeople"].ToString());
            };
            dr.Close();
            return num;
        }
        public int CountSupportPeopleMiddle(int ProjectId)
        {
            string sql = $"select COUNT(*) as SupportPeople from SupportProjects where ProjectId='{ProjectId}' and Money between 1000 and 5000";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int num = 0;
            while (dr.Read())
            {
                num = int.Parse(dr["SupportPeople"].ToString());
            };
            dr.Close();
            return num;
        }
        public int CountSupportPeopleMax(int ProjectId)
        {
            string sql = $"select COUNT(*) as SupportPeople from SupportProjects where ProjectId='{ProjectId}' and Money >=5000 ";
            SqlDataReader dr = DbHelper.GetReader(sql);
            int num = 0;
            while (dr.Read())
            {
                num = int.Parse(dr["SupportPeople"].ToString());
            };
            dr.Close();
            return num;
        }
    }
}
