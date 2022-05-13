using System;

namespace HRRS
{
    /// <summary>
    /// 消息实体类
    /// </summary>
    public class Message
    {
        /// <summary>
        /// 问诊ID
        /// </summary>
        private int inquiry;

        /// <summary>
        /// 问诊患者
        /// </summary>
        private string userName;

        /// <summary>
        /// 问诊患者ID
        /// </summary>
        private int userID;

        /// <summary>
        /// 患者询问的医生
        /// </summary>
        private string doctorName;

        /// <summary>
        /// 患者询问的医生ID
        /// </summary>
        private int doctorID;

        /// <summary>
        /// 消息
        /// </summary>
        private string messageInfo;

        /// <summary>
        /// 消息时间
        /// </summary>
        private DateTime messageTime;

        private string messageImg;

        /// <summary>
        /// 用户头像
        /// </summary>
        private string userImgPath;

        /// <summary>
        /// 医生头像
        /// </summary>
        private string doctorImgPath;

        /// <summary>
        /// 用户类型（1 为用户，0 为医生）
        /// </summary>
        private int userType;

        public Message() { }

        public int Inquiry
        {
            get { return inquiry; }
            set { inquiry = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public string DoctorName
        {
            get { return doctorName; }
            set { doctorName = value; }
        }

        public int DoctorID
        {
            get { return doctorID; }
            set { doctorID = value; }
        }

        public string MessageInfo
        {
            get { return messageInfo; }
            set { messageInfo = value; }
        }

        public DateTime MessageTime
        {
            get { return messageTime; }
            set { messageTime = value; }
        }

        public string MeaasgeImg
        {
            get { return messageImg; }
            set { messageImg = value; }
        }

        public string UserImgPath
        {
            get { return userImgPath; }
            set { userImgPath = value; }
        }

        public string DoctorImgPath
        {
            get { return doctorImgPath; }
            set { doctorImgPath = value; }
        }

        public int UserType
        {
            get { return userType; }
            set { userType = value; }
        }
    }
}