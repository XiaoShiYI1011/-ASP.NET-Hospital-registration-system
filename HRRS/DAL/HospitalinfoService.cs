using System.Data;

namespace DAL
{
    public class HospitalinfoService
    {
        public static DataSet HospitaSelectGrade()
        {
            string sql = "select Grade from t_hospitalinfo group by Grade";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectRegion()
        {
            string sql = "select HospitaRegion from t_hospitalinfo group by HospitaRegion";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectName()
        {
            string sql = "select HospitaName from t_hospitalinfo group by HospitaName";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectinit()
        {
            string sql = "select * from t_hospitalinfo";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectinitGrade(string grade)
        {
            string sql = "select * from t_hospitalinfo where Grade='" + grade + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectinitRegion(string region)
        {
            string sql = "select * from t_hospitalinfo where HospitaRegion='" + region + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaSelectGradeRegion(string grade, string region)
        {
            string sql = "select * from t_hospitalinfo where Grade='" + grade + "' and HospitaRegion='" + region + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaIdSelect(int id)
        {
            string sql = "select * from t_hospitalinfo where hospitalID='" + id + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static DataSet HospitaDept(int id)
        {
            string sql = "select * from t_hospitalinfo a,t_dept b,t_doctorInfo c where a.hospitalID=c.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "'";
            return DBHelper.GetDataSet(sql);
        }
    }
}
