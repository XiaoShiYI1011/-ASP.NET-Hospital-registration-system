using System.Data;

namespace DAL
{
    public class OnlineInquiryService
    {
        /// <summary>
        /// 消息查询
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet OnlineInquirySelectService(string userID, string doctorID)
        {
            string sql = string.Format("SELECT * FROM t_onlineInquiry, t_userInfo, t_doctorInfo WHERE t_onlineInquiry.userID = t_userInfo.userID AND t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND t_userInfo.userID = {0} AND t_doctorInfo.doctorID = {1} ORDER BY MessageTime ASC", userID, doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 用户发送信息
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="msg">消息</param>
        /// <returns>受影响行数</returns>
        public static int OnlineInquiryUserInsertService(string userID, string doctorID, string msg)
        {
            string sql = string.Format("INSERT t_onlineInquiry (userID, doctorID, Message, UserType) VALUES ({0}, {1}, '{2}', 1)", userID, doctorID, msg);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 医生发送信息
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="msg">消息</param>
        /// <returns>受影响行数</returns>
        public static int OnlineInquiryDoctorInsertService(string userID, string doctorID, string msg)
        {
            string sql = string.Format("INSERT t_onlineInquiry (userID, doctorID, Message, UserType) VALUES ({0}, {1}, '{2}', 0)", userID, doctorID, msg);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 医生端消息列表查询（显示ID, 用户姓名）
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet GetMessageListService(string doctorID)
        {
            string sql = string.Format("SELECT t_onlineInquiry.userID, t_userInfo.RealName, t_userInfo.UserImg FROM t_onlineInquiry, t_userInfo WHERE t_onlineInquiry.userID = t_userInfo.userID AND doctorID = {0} AND DoctorRead = 0 GROUP BY t_onlineInquiry.userID, t_userInfo.RealName,t_userInfo.UserImg", doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 最新消息查询（医生端）
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet GetNewMessageService(string userID, string doctorID)
        {
            string sql = string.Format("SELECT TOP 1 Message, MessageTime FROM t_onlineInquiry WHERE userID = {0} AND doctorID = {1} AND  UserType = 1 ORDER BY MessageTime DESC", userID, doctorID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 用户端消息列表查询（显示ID, 医生姓名）
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet UserGetMessageListService(string userID)
        {
            string sql = string.Format("SELECT t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg FROM t_onlineInquiry, t_doctorInfo WHERE t_onlineInquiry.doctorID = t_doctorInfo.doctorID AND userID = {0} AND UserRead = 0  GROUP BY t_onlineInquiry.doctorID , t_doctorInfo.DoctorRealName, t_doctorInfo.DoctorImg", userID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 最新消息查询（用户端）
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet UserGetNewMessageService(string doctorID, string userID)
        {
            string sql = string.Format("SELECT TOP 1 Message, MessageTime FROM t_onlineInquiry WHERE doctorID = {0} AND userID = {1} AND UserType = 0 ORDER BY MessageTime DESC", doctorID, userID);
            return DBHelper.GetDataSet(sql);
        }

        /// <summary>
        /// 改为医生已读
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>受影响行数</returns>
        public static int UpDateDoctorReadService(string userID, string doctorID)
        {
            string sql = string.Format("UPDATE t_onlineInquiry SET DoctorRead = 1 WHERE  userID = {0} AND doctorID = {1}", userID, doctorID);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 改为用户已读
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>受影响行数</returns>
        public static int UpDateUserReadService(string userID, string doctorID)
        {
            string sql = string.Format("UPDATE t_onlineInquiry SET UserRead = 1 WHERE  userID = {0} AND doctorID = {1}", userID, doctorID);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 用户发图片
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="imgPath">图片路径</param>
        /// <returns>受影响行数</returns>
        public static int MessageImgInsertService(string userID, string doctorID, string imgPath)
        {
            string sql = string.Format("INSERT t_onlineInquiry (userID, doctorID, MessageImg, UserType) VALUES ({0}, {1}, '{2}', 1)", userID, doctorID, imgPath);
            return DBHelper.AddDeleteModify(sql);
        }

        /// <summary>
        /// 医生发图片
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="imgPath">图片路径</param>
        /// <returns>受影响行数</returns>
        public static int DoctorMessageImgInsertService(string userID, string doctorID, string imgPath)
        {
            string sql = string.Format("INSERT t_onlineInquiry (userID, doctorID, MessageImg, UserType) VALUES ({0}, {1}, '{2}', 0)", userID, doctorID, imgPath);
            return DBHelper.AddDeleteModify(sql);
        }
    }
}
