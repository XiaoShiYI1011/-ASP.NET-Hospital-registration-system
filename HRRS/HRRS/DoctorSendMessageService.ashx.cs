using BLL;
using System.Web;

namespace HRRS
{
    /// <summary>
    /// DoctorSendMessageService 医生发送消息
    /// </summary>
    public class DoctorSendMessageService : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string userID = context.Request["userID"].ToString();  // 用户ID
            string doctorID = context.Request["doctorID"].ToString();  // 医生ID
            string msg = context.Request["msg"].ToString();  // 消息
            if (OnlineInquiryManager.OnlineInquiryDoctorInsertManager(userID, doctorID, msg))
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