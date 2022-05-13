using DAL;
using System.Data;

namespace BLL
{
    public class AppointmentManager
    {
        /// <summary>
        /// 预约信息添加
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="hospitalID">医院ID</param>
        /// <param name="deptID">科室ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="AppointmentTime">预约时间</param>
        /// <returns>添加成功或者失败</returns>
        public static bool AppointmentInsertManager(string userID, string hospitalID, string deptID, string doctorID, string AppointmentTime)
        {
            if (AppointmentService.AppointmentInsertService(userID, hospitalID, deptID, doctorID, AppointmentTime) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataSet AppointmentSelect(int id)
        {
            return AppointmentService.AppointmentSelect(id);
        }

        public static bool AppointmentDelet(int id)
        {
            if (AppointmentService.AppointmentDelet(id) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生端预约信息查询
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet AppointmentInfoManager(string doctorID)
        {
            return AppointmentService.AppointmentInfoService(doctorID);
        }

        /// <summary>
        /// 删除预约信息
        /// </summary>
        /// <param name="appointmentID">预约ID</param>
        /// <returns>成功或失败</returns>
        public static bool AppointmentDeleteManager(string appointmentID)
        {
            if (AppointmentService.AppointmentDeleteService(appointmentID) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 重复预约查询
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet AppointmentRepeatManager(string userID)
        {
            return AppointmentService.AppointmentRepeatService(userID);
        }
    }
}
