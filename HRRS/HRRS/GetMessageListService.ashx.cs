using BLL;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;

namespace HRRS
{
    /// <summary>
    /// GetMessageListService 获取医生端消息未读列表
    /// </summary>
    public class GetMessageListService : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string doctorID = context.Request["doctorID"].ToString();
            DataSet ds = OnlineInquiryManager.GetMessageListManager(doctorID);
            List<GetMessageList> list = new List<GetMessageList>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                int count = i + 1;
                GetMessageList getMessageList = new GetMessageList
                {
                    UserID = ds.Tables[0].Rows[i]["userID"].ToString(),
                    UserImgPath = ds.Tables[0].Rows[i]["UserImg"].ToString(),
                    UserName = ds.Tables[0].Rows[i]["RealName"].ToString(),
                    Count = count,
                };
                DataSet msgDs = OnlineInquiryManager.GetNewMessageManager(ds.Tables[0].Rows[i]["userID"].ToString(), doctorID);
                if (msgDs.Tables[0].Rows.Count != 0)
                {
                    getMessageList.Message = msgDs.Tables[0].Rows[0]["Message"].ToString();
                    getMessageList.MessageTime = (System.DateTime)msgDs.Tables[0].Rows[0]["MessageTime"];
                }
                list.Add(getMessageList);
            }
            context.Response.Write(new JavaScriptSerializer().Serialize(list));
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