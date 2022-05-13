using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;

namespace HRRS
{
    /// <summary>
    /// UserGetMessageListService 获取未读消息列表（用户端）
    /// </summary>
    public class UserGetMessageListService : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string userID = context.Request["userID"].ToString();
            DataSet ds = OnlineInquiryManager.UserGetMessageListManager(userID);
            List<UserGetMessageList> list = new List<UserGetMessageList>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                int count = i + 1;
                UserGetMessageList userGetMessageList = new UserGetMessageList
                {
                    DoctorID = ds.Tables[0].Rows[i]["doctorID"].ToString(),
                    DoctorRealName = ds.Tables[0].Rows[i]["DoctorRealName"].ToString(),
                    DoctorImg = ds.Tables[0].Rows[i]["DoctorImg"].ToString(),
                    Count = count ==1? 1 : 0,
                };
                DataSet msgDs = OnlineInquiryManager.UserGetNewMessageManager(ds.Tables[0].Rows[i]["doctorID"].ToString(), userID);
                if (msgDs.Tables[0].Rows.Count != 0)
                {
                    userGetMessageList.Message = msgDs.Tables[0].Rows[0]["Message"].ToString();
                    userGetMessageList.MessageTime = (DateTime)msgDs.Tables[0].Rows[0]["MessageTime"];
                }
                list.Add(userGetMessageList);
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