using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class Consults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录
            if (Session["userID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=userInfoCheck");
            }
            DataSet ds = OnlineInquiryManager.UserGetMessageListManager(Session["userID"].ToString());
            int count = 0;
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                count += i;
            }
            Unread.InnerText = count.ToString();
        }
    }
}