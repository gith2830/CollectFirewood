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
    }
}
