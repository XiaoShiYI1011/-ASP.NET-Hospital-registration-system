using BLL;
using System;

namespace HRRS
{
    public partial class ReplyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=doctorLoginCheck");
            }
            // 已读消息清空
            string doctorID = Session["doctorID"].ToString();
            string userID = Request["userID"].ToString();
            OnlineInquiryManager.UpDateDoctorReadManager(userID, doctorID);
        }
    }
}