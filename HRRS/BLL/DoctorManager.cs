using DAL;
using System.Data;

namespace BLL
{
    public class DoctorManager
    {
        /// <summary>
        /// 医生登录
        /// </summary>
        /// <param name="doctorName">医生账号</param>
        /// <param name="doctorPwd">医生密码</param>
        /// <returns>查询结果集</returns>
        public static bool DoctorLoginManager(string doctorName, string doctorPwd)
        {
            DataSet ds = DoctorService.DoctorLoginService(doctorName, doctorPwd);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生ID查询
        /// </summary>
        /// <param name="doctorName">医生账号</param>
        /// <param name="doctorPwd">医生密码</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorIDSelectManager(string doctorName, string doctorPwd)
        {
            return DoctorService.DoctorIDSelectService(doctorName, doctorPwd);
        }

        /// <summary>
        /// 医生工作时间
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>返回查询结果集</returns>
        public static DataSet DoctorWorkSelectManager(string doctorID)
        {
            return DoctorService.DoctorWorkSelectService(doctorID);
        }

        /// <summary>
        /// 链表查询,医生，科室，医院三表
        /// </summary>
        /// <returns></returns>
        public static DataSet DoctorSelect()
        {
            return DoctorService.DoctorSelect();
        }

        /// <summary>
        /// 医生信息查询
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorSelect(string doctorID)
        {
            return DoctorService.DoctorSelect(doctorID);
        }

        /// <summary>
        /// 医生值班时间修改
        /// </summary>
        /// <param name="WorkDay">值班时间</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>受影响行数</returns>
        public static bool DoctorWorkUpDateManager(string WorkDay, string doctorID)
        {
            if (DoctorService.DoctorWorkUpDateService(WorkDay, doctorID) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生职位查询
        /// </summary>
        /// <returns></returns>
        public static DataSet DoctorPositionSelect()
        {
            return DoctorService.DoctorPositionSelect();
        }

        /// <summary>
        /// 链表查询医院名字
        /// </summary>
        /// <param name="hospitaname"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitaSelect(string hospitaname)
        {
            return DoctorService.DoctorHospitaNameSelect(hospitaname);
        }

        /// <summary>
        /// 链表查询医生职位
        /// </summary>
        /// <param name="position"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitaPositionSelect(string position)
        {
            return DoctorService.DoctorHospitaPositionSelect(position);
        }

        /// <summary>
        /// 链表查询根据医院名字和医生职位
        /// </summary>
        /// <param name="hospitaname"></param>
        /// <param name="position"></param>
        /// <returns></returns>
        public static DataSet DoctorHospitahp(string hospitaname, string position)
        {
            return DoctorService.DoctorHospitahp(hospitaname, position);
        }

        /// <summary>
        /// 链表查询根据医院id查询医院内医生
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet DoctorNameIDHospita(string id)
        {
            return DoctorService.DoctorNameIDHospita(id);
        }

        /// <summary>
        /// 链表查询根据医生id查询医院内医生
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet DoctorIDHospita(string id)
        {
            return DoctorService.DoctorIDHospita(id);
        }

        /// <summary>
        /// 根据医院id查询科室下拉框
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet HospitaDoctorDeptSelectDepartment(int id)
        {
            return DoctorService.HospitaDoctorDeptSelectDepartment(id);
        }

        /// <summary>
        /// 根据医院id查询职称下拉框
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet HospitaDoctorDeptSelectDoctorPosition(int id)
        {
            return DoctorService.HospitaDoctorDeptSelectDoctorPosition(id);
        }

        /// <summary>
        /// 根据医院id和科室查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="ks"></param>
        /// <returns></returns>
        public static DataSet HDDDepartment(int id, string ks)
        {
            return DoctorService.HDDDepartment(id, ks);
        }

        /// <summary>
        /// 根据医院id和职称查询
        /// </summary>
        /// <param name="id"></param>
        /// <param name="dp"></param>
        /// <returns></returns>
        public static DataSet HDDDoctorPosition(int id, string dp)
        {
            return DoctorService.HDDDoctorPosition(id, dp);
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
            return DoctorService.HDDDepartmentDoctorPosition(id, ks, dp);
        }

        public static DataTable DoctorIndexManager(string id)
        {
            return DoctorService.DoctorIndexService(id);
        }

        public static DataTable HospitalselectManager()
        {
            return DoctorService.HospitalselectService();
        }

        public static DataTable DeptselectManager()
        {
            return DoctorService.DeptselectService();
        }

        public static bool DoctorUpManager(string doctorname, string DoctorRealName, char DoctorSex, int hospitalID, int deptID, string DoctorDescribe, string DoctorPosition, string DoctorName)
        {
            return DoctorService.DoctorUpService(doctorname, DoctorRealName, DoctorSex, hospitalID, deptID, DoctorDescribe, DoctorPosition, DoctorName) > 0;
        }

        public static bool DoctorImgManager(string img, string id)
        {
            return DoctorService.DoctorImageService(img, id);
        }
    }
}
