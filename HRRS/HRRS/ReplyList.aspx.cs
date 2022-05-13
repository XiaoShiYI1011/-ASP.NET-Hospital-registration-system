using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class ReplyList : System.Web.UI.Page
    {
        public static string Count = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=doctorLoginCheck");
            }

            string doctorID = Session["doctorID"].ToString();
            DataSet ds = OnlineInquiryManager.GetMessageListManager(doctorID);
            int count = 0;
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                count += i;
            }
            Count = count.ToString();
        }
    }
}