using System.Data;

namespace DAL
{
    public class UserService
    {
        /// <summary>
        /// 登录信息查询
        /// </summary>
        /// <param name="userName">账号</param>
        /// <param name="userPwd">密码</param>
        /// <returns>查询结果集</returns>
        public static DataSet LoginService(string userName, string userPwd)
        {
            string sql = string.Format("SELECT UserName, UserPwd FROM t_userInfo WHERE UserName = '{0}' AND UserPwd = '{1}'", userName, userPwd);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 用户ID查询
        /// </summary>
        /// <param name="userName">账号</param>
        /// <param name="userPwd">密码</param>
        /// <returns>查询结果集</returns>
        public static DataSet UserIDService(string userName, string userPwd)
        {
            string sql = string.Format("SELECT userID, UserName, UserPwd FROM t_userInfo WHERE UserName = '{0}' AND UserPwd = '{1}'", userName, userPwd);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 医院信息查询
        /// </summary>
        /// <param name="top">查询数量</param>
        /// <returns>查询结果集</returns>
        public static DataSet HospitalInfoService(string top)
        {
            string sql = "SELECT TOP " + top + "hospitalID, HospitaName, HospitaDescribe, Grade, HospitalAddress, HospitalImg FROM t_hospitalinfo";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 首页医生信息查询
        /// </summary>
        /// <param name="top">查询数量</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorInfoService(string top)
        {
            string sql = "SELECT TOP " + top + " doctorID, DoctorName, DoctorRealName, DoctorSex, DoctorDescribe, DoctorImg, HospitaName, Department, DoctorPosition, WorkDay FROM t_doctorInfo, t_hospitalinfo, t_dept WHERE t_doctorInfo.hospitalID = t_hospitalinfo.hospitalID AND t_doctorInfo.deptID = t_dept.deptID";
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="UserName">账号</param>
        /// <param name="UserPwd">密码</param>
        /// <param name="RealName">真实姓名</param>
        /// <param name="UserSex">性别</param>
        /// <param name="IDCard">身份证</param>
        /// <param name="UserPhone">手机号</param>
        /// <returns>受影响行数</returns>
        public static int UserInsertService(string UserName, string UserPwd, string RealName, string UserSex, string IDCard, string UserPhone)
        {
            string sql = string.Format("INSERT t_userInfo (UserName, UserPwd, RealName, UserSex, IDCard, UserPhone) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', {5})", UserName, UserPwd, RealName, UserSex, IDCard, UserPhone);
            return DBHelper.AddDeleteModify(sql);
        }

        public static DataSet UserInfoService(string username)
        {
            string sql = "select * from t_userInfo where UserName='" + username + "'";
            return DBHelper.GetDataSet(sql);
        }

        public static int UserInfoUpdateService(string UserName, string RealName, string UserSex, string IDCard, double UserPhone, string Username)
        {
            string sql = string.Format("update t_userInfo set UserName='{0}',RealName='{1}',UserSex='{2}',IDCard='{3}',UserPhone={4} where UserName='{5}'", UserName, RealName, UserSex, IDCard, UserPhone, Username);
            return DBHelper.AddDeleteModify(sql);
        }

        public static int UserInfoUpdateImgService(string userimg, string userID)
        {
            string sql = string.Format("update t_userInfo set UserImg='{0}' where userID='{1}'", userimg, userID);
            return DBHelper.AddDeleteModify(sql);
        }

        public static int UserRegisterService(string UserName, string UserPwd, string RealName, char UserSex, string IDCard, double UserPhone, string defaul)
        {
            string sql = string.Format("insert into t_userInfo values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", UserName, UserPwd, RealName, UserSex, IDCard, UserPhone, defaul);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 根据用户姓名以及用户身份证号修改密码
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="IDCard"></param>
        /// <returns></returns>
        public static int UserSelectNameID(string UserName, string IDCard,string UserPwd)
        {
            string sql = "UPDATE [dbo].[t_userInfo] SET [UserPwd] ='"+UserPwd+"' where UserName='"+UserName+"' and IDCard='"+IDCard+"'";
            return DBHelper.AddDeleteModify(sql);
        }
    }
}
