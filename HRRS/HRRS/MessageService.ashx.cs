using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;

namespace HRRS
{
    /// <summary>
    /// MessageService 即时通讯处理程序（获取消息）【野路子写法，能跑别动】
    /// </summary>
    #region 佛祖保佑      永无BUG      永不修改
    /*
     \\ \\ \\ \\ \\ \\ \\ \\ || || || || || || // // // // // // // //
     \\ \\ \\ \\ \\ \\ \\        _ooOoo_          // // // // // // //
     \\ \\ \\ \\ \\ \\          o8888888o            // // // // // //
     \\ \\ \\ \\ \\             88" . "88               // // // // //
     \\ \\ \\ \\                (| -_- |)                  // // // //
     \\ \\ \\                   O\  =  /O                     // // //
     \\ \\                   ____/`---'\____                     // //
     \\                    .'  \\|     |//  `.                      //
     ==                   /  \\|||  :  |||//  \                     ==
     ==                  /  _||||| -:- |||||-  \                    ==
     ==                  |   | \\\  -  /// |   |                    ==
     ==                  | \_|  ''\---/''  |   |                    ==
     ==                  \  .-\__  `-`  ___/-. /                    ==
     ==                ___`. .'  /--.--\  `. . ___                  ==
     ==              ."" '<  `.___\_<|>_/___.'  >'"".               ==
     ==            | | :  `- \`.;`\ _ /`;.`/ - ` : | |              \\
     //            \  \ `-.   \_ __\ /__ _/   .-` /  /              \\
     //      ========`-.____`-.___\_____/___.-`____.-'========      \\
     //                           `=---='                           \\
     // //   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  \\ \\
     // // //      佛祖保佑      永无BUG      永不修改        \\ \\ \\
     // // // // // // || || || || || || || || || || \\ \\ \\ \\ \\ \\
     */
    #endregion
    public class MessageService : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string userID = context.Request["userID"].ToString();  // 用户ID
            string doctorID = context.Request["doctorID"].ToString();  // 医生ID
            DataSet ds = OnlineInquiryManager.OnlineInquirySelectManager(userID, doctorID);
            List<Message> list = new List<Message>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Message msg = new Message
                {
                    Inquiry = Convert.ToInt32(ds.Tables[0].Rows[i]["inquiryID"]),
                    UserName = ds.Tables[0].Rows[i]["RealName"].ToString(),
                    UserID = Convert.ToInt32(ds.Tables[0].Rows[i]["userID"]),
                    DoctorName = ds.Tables[0].Rows[i]["DoctorRealName"].ToString(),
                    DoctorID = Convert.ToInt32(ds.Tables[0].Rows[i]["doctorID"]),
                    MessageInfo = ds.Tables[0].Rows[i]["Message"].ToString(),
                    MessageTime = Convert.ToDateTime(ds.Tables[0].Rows[i]["MessageTime"]),
                    MeaasgeImg = ds.Tables[0].Rows[i]["MessageImg"].ToString(),
                    UserImgPath = ds.Tables[0].Rows[i]["UserImg"].ToString(),
                    DoctorImgPath = ds.Tables[0].Rows[i]["DoctorImg"].ToString(),
                    UserType = Convert.ToInt32(ds.Tables[0].Rows[i]["UserType"])
                };
                list.Add(msg);
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