using DAL;
using System.Data;

namespace BLL
{
    public class DeptManager
    {
        public static DataSet Deptinfo()
        {
            return DeptService.Deptinfo();
        }
    }
}
