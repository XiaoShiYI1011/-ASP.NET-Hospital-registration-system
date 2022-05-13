using System.Data;

namespace DAL
{
    public class AppointmentService
    {
        /// <summary>
        /// 预约信息添加
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="hospitalID">医院ID</param>
        /// <param name="deptID">科室ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="AppointmentTime">预约时间</param>
        /// <returns>受影响行数</returns>
        public static int AppointmentInsertService(string userID, string hospitalID, string deptID, string doctorID, string AppointmentTime)
        {
            string sql = string.Format("INSERT INTO t_appointment(userID, hospitalID, deptID, doctorID, AppointmentTime) VALUES({0}, {1}, {2}, {3}, '{4}')", userID, hospitalID, deptID, doctorID, AppointmentTime);
            return DBHelper.AddDeleteModify(sql);
        }

        public static DataSet AppointmentSelect(int id)
        {
            string sql = "select e.appointmentID,a.userID,a.RealName,b.HospitaName,c.Department,d.DoctorRealName,e.AppointmentTime from t_appointment e, t_userInfo a,t_hospitalinfo b,t_dept c,t_doctorInfo d where  a.userID=e.userID and e.hospitalID=b.hospitalID and e.doctorID=d.doctorID and e.deptID=c.deptID and a.userID=" + id + "";
            return DBHelper.GetDataSet(sql);
        }

        public static int AppointmentDelet(int id)
        {
            string sql = "DELETE FROM [dbo].[t_appointment] WHERE userID='" + id + "'";
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 医生端预约信息查询
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet AppointmentInfoService(string doctorID)
        {
            string sql = string.Format("SELECT appointmentID, t_userInfo.RealName, AppointmentTime FROM t_appointment, t_userInfo WHERE t_appointment.userID = t_userInfo.userID AND doctorID = {0}", doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 删除预约信息
        /// </summary>
        /// <param name="appointmentID">预约ID</param>
        /// <returns>受影响行数</returns>
        public static int AppointmentDeleteService(string appointmentID)
        {
            string sql = string.Format("DELETE t_appointment WHERE appointmentID = {0}", appointmentID);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 重复预约查询
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet AppointmentRepeatService(string userID) 
        {
            string sql = string.Format("SELECT * FROM t_appointment WHERE userID = {0}", userID);
            return DBHelper.GetDataSet(sql);
        }
    }
}
