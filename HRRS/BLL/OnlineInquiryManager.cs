using DAL;
using System.Data;

namespace BLL
{
    public class OnlineInquiryManager
    {
        /// <summary>
        /// 消息查询
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet OnlineInquirySelectManager(string userID, string doctorID)
        {
            return OnlineInquiryService.OnlineInquirySelectService(userID, doctorID);
        }

        /// <summary>
        /// 用户发送信息
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="msg">消息</param>
        /// <returns>成功返回 true，失败返回 falsw</returns>
        public static bool OnlineInquiryUserInsertManager(string userID, string doctorID, string msg)
        {
            if (OnlineInquiryService.OnlineInquiryUserInsertService(userID, doctorID, msg) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生发送信息
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="msg">消息</param>
        /// <returns>受影响行数</returns>
        public static bool OnlineInquiryDoctorInsertManager(string userID, string doctorID, string msg)
        {
            if (OnlineInquiryService.OnlineInquiryDoctorInsertService(userID, doctorID, msg) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生端消息列表查询（显示ID, 用户姓名）
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet GetMessageListManager(string doctorID)
        {
            return OnlineInquiryService.GetMessageListService(doctorID);
        }

        /// <summary>
        /// 最新消息查询（医生端）
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet GetNewMessageManager(string userID, string doctorID)
        {
            return OnlineInquiryService.GetNewMessageService(userID, doctorID);
        }

        /// <summary>
        /// 用户端消息列表查询（显示ID, 医生姓名）
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet UserGetMessageListManager(string userID)
        {
            return OnlineInquiryService.UserGetMessageListService(userID);
        }

        /// <summary>
        /// 最新消息查询（用户端）
        /// </summary>
        /// <param name="doctorID">医生ID</param>
        /// <param name="userID">用户ID</param>
        /// <returns>查询结果集</returns>
        public static DataSet UserGetNewMessageManager(string doctorID, string userID)
        {
            return OnlineInquiryService.UserGetNewMessageService(doctorID, userID);
        }

        /// <summary>
        /// 改为医生已读
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>修改成功或修改失败</returns>
        public static bool UpDateDoctorReadManager(string userID, string doctorID)
        {
            if (OnlineInquiryService.UpDateDoctorReadService(userID, doctorID) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 改为用户已读
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <returns>修改成功或修改失败</returns>
        public static bool UpDateUserReadManager(string userID, string doctorID)
        {
            if (OnlineInquiryService.UpDateUserReadService(userID, doctorID) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 用户发图片
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="imgPath">图片路径</param>
        /// <returns>成功或失败</returns>
        public static bool MessageImgInsertManager(string userID, string doctorID, string imgPath)
        {
            if (OnlineInquiryService.MessageImgInsertService(userID, doctorID, imgPath) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 医生发图片
        /// </summary>
        /// <param name="userID">用户ID</param>
        /// <param name="doctorID">医生ID</param>
        /// <param name="imgPath">图片路径</param>
        /// <returns>成功或失败</returns>
        public static bool DoctorMessageImgInsertManager(string userID, string doctorID, string imgPath)
        {
            if (OnlineInquiryService.DoctorMessageImgInsertService(userID, doctorID, imgPath) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
