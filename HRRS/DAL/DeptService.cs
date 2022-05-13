using System.Data;

namespace DAL
{
    public class DeptService
    {
        public static DataSet Deptinfo()
        {
            string sql = "SELECT * FROM t_dept";
            return DBHelper.GetDataSet(sql);
        }
    }
}
