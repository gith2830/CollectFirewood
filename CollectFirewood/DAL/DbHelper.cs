using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    static class DbHelper
    {
        static readonly string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        /// <summary>
        /// 执行sql
        /// </summary>
        /// <param name="strCmd">sql指令</param>
        /// <param name="ps">sql参数</param>
        /// <returns>影响行数</returns>
        public static int ExecuteNotQuery(string strCmd, params SqlParameter[] ps)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(strCmd, con))
                    {
                        cmd.Parameters.AddRange(ps);
                        return cmd.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
                return 0;
            }
        }
        /// <summary>
        /// 执行sql
        /// </summary>
        /// <param name="strCmd">sql命令</param>
        /// <param name="ps">sql参数</param>
        /// <returns>执行结果</returns>
        public static object ExecuteScalar(string strCmd, params SqlParameter[] ps)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(strCmd, con))
                    {
                        cmd.Parameters.AddRange(ps);
                        return cmd.ExecuteScalar();
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }
        }
        /// <summary>
        /// 获得一个数据库表
        /// </summary>
        /// <param name="strCmd">sql命令</param>
        /// <param name="ps">sql参数</param>
        /// <returns></returns>
        public static DataTable GetDataTable(string strCmd, params SqlParameter[] ps)
        {
            try
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(strCmd, connStr))
                {
                    adapter.SelectCommand.Parameters.AddRange(ps);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }
        }

        /// <summary>
        /// 执行事务
        /// </summary>
        /// <param name="strCmd">sql代码</param>
        /// <param name="ps">sql参数</param>
        /// <returns></returns>
        public static int ExecuteTransaction(string strCmd, params SqlParameter[] ps)
        {
            int result = 0;
            SqlTransaction tran = null;
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(strCmd, con))
                    {
                        tran = con.BeginTransaction();
                        cmd.Parameters.AddRange(ps);
                        result = cmd.ExecuteNonQuery();
                        tran.Commit();
                        return result;
                    }
                }
            }
            catch (Exception e)
            {
                tran?.Rollback();
                Console.WriteLine(e.Message);
                return result;
            }
        }
    }
}
