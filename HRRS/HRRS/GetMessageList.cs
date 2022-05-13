using System;

namespace HRRS
{
    public class GetMessageList
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        private string userID;

        /// <summary>
        /// 用户头像路径
        /// </summary>
        private string userImgPath;

        /// <summary>
        /// 用户姓名
        /// </summary>
        private string userName;

        /// <summary>
        /// 用户消息
        /// </summary>
        private string message;

        /// <summary>
        /// 消息时间
        /// </summary>
        private DateTime messageTime;

        /// <summary>
        /// 未读消息条数
        /// </summary>
        private int count;

        public GetMessageList() { }

        public string UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public string UserImgPath
        {
            get { return userImgPath; }
            set { userImgPath = value; }
        }

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
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