using DAL;
using System;
using System.Data;

namespace BLL
{
    public class UserManager
    {
        /// <summary>
        /// 对登录信息查询的数据进行处理
        /// </summary>
        /// <param name="userName">账号</param>
        /// <param name="userPwd">密码</param>
        /// <returns>登录成功（true） ||  登录失败（false）</returns>
        public static bool LoginManager(string userName, string userPwd)
        {
            try
            {
                DataSet ds = UserService.LoginService(userName, userPwd);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// 用户ID查询
        /// </summary>
        /// <param name="userName">账号</param>
        /// <param name="userPwd">密码</param>
        /// <returns></returns>
        public static DataSet UserIDManager(string userName, string userPwd)
        {
            return UserService.UserIDService(userName, userPwd);
        }

        /// <summary>
        /// 对医院信息查询的数据进行处理
        /// </summary>
        /// <param name="top">查询数量</param>
        /// <returns>查询结果集</returns>
        public static DataSet HospitalInfoManager(string top)
        {
            return UserService.HospitalInfoService(top);
        }

        /// <summary>
        /// 首页医生信息查询
        /// </summary>
        /// <param name="top">查询数量</param>
        /// <returns>查询结果集</returns>
        public static DataSet DoctorInfoManager(string top)
        {
            return UserService.DoctorInfoService(top);
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
        /// <returns>添加成功或添加失败</returns>
        public static bool UserInsertManager(string UserName, string UserPwd, string RealName, string UserSex, string IDCard, string UserPhone)
        {
            if (UserService.UserInsertService(UserName, UserPwd, RealName, UserSex, IDCard, UserPhone) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataSet UserInfoManager(string username)
        {
            return UserService.UserInfoService(username);
        }

        public static bool UserInfoUpdateManager(string UserName, string RealName, string UserSex, string IDCard, double UserPhone, string Username)
        {
            return UserService.UserInfoUpdateService(UserName, RealName, UserSex, IDCard, UserPhone, Username) > 0;
        }

        public static bool UserInfoUpdateImgManager(string userimg, string userid)
        {
            return UserService.UserInfoUpdateImgService(userimg, userid) > 0;
        }

        public static bool UserRegisterManager(string UserName, string UserPwd, string RealName, char UserSex, string IDCard, double UserPhone, string defaul)
        {
            return UserService.UserRegisterService(UserName, UserPwd, RealName, UserSex, IDCard, UserPhone, defaul) > 0;
        }

        /// <summary>
        /// 根据用户姓名以及用户身份证号修改密码
        /// </summary>
        /// <param name="UserName"></param>
        /// <param name="IDCard"></param>
        /// <returns></returns>
        public static bool UserSelectNameID(string UserName, string IDCard, string UserPwd)
        {
            return UserService.UserSelectNameID(UserName, IDCard, UserPwd)>0;
        }
        }
}
