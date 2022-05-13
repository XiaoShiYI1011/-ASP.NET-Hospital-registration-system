using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class DBHelper
    {
        /// <summary>
        /// 连接字符串，记得更改服务器名（LAPTOP-TLITH67M\XSY）iZhsfqse1qey1uZ
        /// </summary>
        public static string ConnString = @"Server = LAPTOP-TLITH67M\XSY; Database = db_HRRS; Integrated Security = True";
        //public static string ConnString = @"Data Source=iZhsfqse1qey1uZ;Initial Catalog=db_HRRS;User ID=sa; password=10119057";

        /// <summary>
        /// 增、删、改用
        /// </summary>
        /// <param name="sqlStr">增、删、改语句</param>
        /// <returns>受影响行数</returns>
        public static int AddDeleteModify(string sqlStr)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            int rows = cmd.ExecuteNonQuery();
            return rows;
        }

        /// <summary>
        /// 查询用
        /// </summary>
        /// <param name="sqlStr">查询语句</param>
        /// <returns>查询结果集</returns>
        public static DataSet GetDataSet(string sqlStr)
        {
            SqlConnection conn = new SqlConnection(ConnString);
            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(sqlStr, conn);
            dap.Fill(ds);
            return ds;
        }
    }
}
