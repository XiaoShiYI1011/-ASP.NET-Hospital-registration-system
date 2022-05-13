using System;

namespace HRRS
{
    public class UserGetMessageList
    {
        /// <summary>
        /// 医生ID
        /// </summary>
        private string doctorID;

        /// <summary>
        /// 医生姓名
        /// </summary>
        private string doctorRealName;

        /// <summary>
        /// 医生头像路径
        /// </summary>
        private string doctorImg;

        /// <summary>
        /// 最新消息
        /// </summary>
        private string message;

        /// <summary>
        /// 消息时间
        /// </summary>
        private DateTime messageTime;

        /// <summary>
        /// 未读消息数
        /// </summary>
        private int count;

        public UserGetMessageList(){ }

        public string DoctorID
        {
            get { return doctorID; }
            set { doctorID = value; }
        }

        public string DoctorRealName
        {
            get { return doctorRealName; }
            set { doctorRealName = value; }
        }

        public string DoctorImg
        {
            get { return doctorImg; }
            set { doctorImg = value; }
        }

        public string Message
        {
            get { return message; }
            set { message = value; }
        }

        public DateTime MessageTime
        {
            get { return messageTime; }
            set { messageTime = value; }
        }

        public int Count
        {
            get { return count; }
            set { count = value; }
        }
    }
}