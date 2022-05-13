using System.Data;

namespace DAL
{
    public class DoctorService
    {
        /// <summary>
        /// 医生登录
        /// </summary>
        /// <param name="doctorName">医生账号</param>
        /// <param name="doctorPwd">医生密码</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorLoginService(string doctorName, string doctorPwd) 
        {
            string sql = string.Format("SELECT * FROM t_doctorInfo WHERE DoctorName = '{0}' AND DoctorPwd = '{1}'", doctorName, doctorPwd);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 医生ID查询
        /// </summary>
        /// <param name="doctorName">医生账号</param>
        /// <param name="doctorPwd">医生密码</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorIDSelectService(string doctorName, string doctorPwd)
        {
            string sql = string.Format("SELECT doctorID FROM t_doctorInfo WHERE DoctorName = '{0}' AND DoctorPwd = '{1}'", doctorName, doctorPwd);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 医生信息查询
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns></returns>
        public static DataSet DoctorWorkSelectService(string doctorID)
        {
            string sql = string.Format("SELECT * FROM t_doctorInfo WHERE doctorID = {0}", doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询,医生，科室，医院三表
        /// </summary>
        /// <returns></returns>
        public static DataSet DoctorSelect()
        {
            string sql = "SELECT doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 医生信息查询
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorSelect(string doctorID)
        {
            string sql = string.Format("SELECT * FROM t_doctorInfo WHERE doctorID = {0}", doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 医生值班时间修改
        /// </summary>
        /// <param name="WorkDay">值班时间</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>受影响行数</returns>
        public static int DoctorWorkUpDateService(string WorkDay, string doctorID)
        {
            string sql = string.Format("UPDATE t_doctorInfo SET WorkDay = '{0}' WHERE doctorID = {1}", WorkDay, doctorID);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 医生职位查询
        /// </summary>
        /// <returns></returns>
        public static DataSet DoctorPositionSelect()
        {
            string sql = "select DoctorPosition from t_doctorInfo group by DoctorPosition";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询医院名字
        /// </summary>
        /// <param name="hospitaname"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitaNameSelect(string hospitaname)
        {
            string sql = string.Format("SELECT doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID and HospitaName='{0}'", hospitaname);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询医生职位
        /// </summary>
        /// <param name="position"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitaPositionSelect(string position)
        {
            string sql = string.Format("SELECT t_doctorInfo.doctorID,DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID=t_dept.deptID and  DoctorPosition='{0}'", position);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询根据医院名字和医生职位
        /// </summary>
        /// <param name="hospitaname"></param>
        /// <param name="position"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitahp(string hospitaname, string position)
        {
            string sql = string.Format("SELECT t_doctorInfo.doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID=t_dept.deptID and HospitaName='{0}'and DoctorPosition='{1}'", hospitaname, position);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询根据医院id查询医院内医生
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet DoctorNameIDHospita(string id)
        {
            string sql = string.Format("SELECT t_hospitalinfo.hospitalID,HospitaName,doctorID,DoctorRealName, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID and  t_hospitalinfo.hospitalID='{0}'", id);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 链表查询根据医生id查询医院内医生
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet DoctorIDHospita(string id)
        {
            string sql = string.Format("SELECT t_hospitalinfo.hospitalID,HospitaName,doctorID,DoctorRealName, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept where t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID and t_doctorInfo.deptID = t_dept.deptID and doctorID='{0}'", id);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 根据医院id查询科室下拉框
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet HospitaDoctorDeptSelectDepartment(int id)
        {
            string sql = "select c.Department from t_hospitalinfo a,t_doctorInfo b,t_dept c where a.hospitalID=b.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "' group by c.Department";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 根据医院id查询职称下拉框
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet HospitaDoctorDeptSelectDoctorPosition(int id)
        {
            string sql = "select b.DoctorPosition from t_hospitalinfo a,t_doctorInfo b,t_dept c where a.hospitalID=b.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "' group by b.DoctorPosition";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 根据医院id和科室查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="ks"></param>
        /// <returns></returns>
        public static DataSet HDDDepartment(int id, string ks)
        {
            string sql = "select b.doctorID,b.DoctorImg,b.DoctorRealName,b.DoctorPosition,c.Department from t_hospitalinfo a,t_doctorInfo b,t_dept c where a.hospitalID=b.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "' and c.Department='" + ks + "'";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 根据医院id和职称查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dp"></param>
        /// <returns></returns>
        public static DataSet HDDDoctorPosition(int id, string dp)
        {
            string sql = "select b.doctorID,b.DoctorImg,b.DoctorRealName,b.DoctorPosition,c.Department from t_hospitalinfo a,t_doctorInfo b,t_dept c where a.hospitalID=b.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "' and b.DoctorPosition='" + dp + "'";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 根据医院id和科室和职称查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="ks"></param>
        /// <param name="dp"></param>
        /// <returns></returns>
        public static DataSet HDDDepartmentDoctorPosition(int id, string ks, string dp)
        {
            string sql = "select b.doctorID,b.DoctorImg,b.DoctorRealName,b.DoctorPosition,c.Department from t_hospitalinfo a,t_doctorInfo b,t_dept c where a.hospitalID=b.hospitalID and b.deptID=c.deptID and a.hospitalID='" + id + "' and b.DoctorPosition='" + dp + "' and c.Department='" + ks + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static DataTable DoctorIndexService(string id)
        {
            string sql = string.Format("select * from t_doctorInfo,t_hospitalinfo,t_dept where doctorID = '{0}' and t_doctorInfo.hospitalID=t_hospitalinfo.hospitalID and t_doctorInfo.deptID=t_dept.deptID", id);
            return DBHelper.GetDataSet(sql).Tables[0];
        }

        public static DataTable HospitalselectService()
        {
            string sql = "select * from t_hospitalinfo";
            return DBHelper.GetDataSet(sql).Tables[0];
        }

        public static DataTable DeptselectService()
        {
            string sql = "select * from t_dept";
            return DBHelper.GetDataSet(sql).Tables[0];
        }

        public static int DoctorUpService(string doctorname, string DoctorRealName, char DoctorSex, int hospitalID, int deptID, string DoctorDescribe, string DoctorPosition, string DoctorName)
        {
            string sql = string.Format("update t_doctorinfo set doctorname='{0}',DoctorRealName='{1}',DoctorSex='{2}',hospitalID={3},deptID={4},DoctorDescribe='{5}',DoctorPosition='{6}' where DoctorName='{7}'", doctorname, DoctorRealName, DoctorSex, hospitalID, deptID, DoctorDescribe, DoctorPosition, DoctorName);
            return DBHelper.AddDeleteModify(sql);
        }

        public static bool DoctorImageService(string img, string id)
        {
            string sql = string.Format("update t_doctorinfo set doctorimg='{0}' where doctorid='{1}'", img, id);
            return DBHelper.AddDeleteModify(sql) > 0;
        }
    }
}
