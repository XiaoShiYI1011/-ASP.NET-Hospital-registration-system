using BLL;
using System.Web;

namespace HRRS
{
    /// <summary>
    /// SendMessageService 即使通讯处理程序（用户发送信息）
    /// </summary>
    public class SendMessageService : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string userID = context.Request["userID"].ToString();  // 用户ID
            string doctorID = context.Request["doctorID"].ToString();  // 医生ID
            string msg = context.Request["msg"].ToString();  // 消息
            if (OnlineInquiryManager.OnlineInquiryUserInsertManager(userID, doctorID, msg))
            {
                context.Response.Write("[{\"result\":\"true\"}]");
            }
            else
            {
                context.Response.Write("[{\"result\":\"false\"}]");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}