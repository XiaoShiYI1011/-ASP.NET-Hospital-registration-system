using System;
using System.Data;
using BLL;

namespace HRRS
{
    public partial class MasterSite2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string doctorID = Session["doctorID"].ToString();
            DataSet ds = OnlineInquiryManager.GetMessageListManager(doctorID);
            int count = 0;
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                count += i;
            }
            Unread.InnerText = count.ToString();
        }

        protected void OutBtn_Click(object sender, EventArgs e)
        {
            // 点击退出，销毁所有 Session
            Session.Abandon();
            Response.Redirect("index.aspx");
            Response.Write("<script>alert('已退出登录')</script>");
        }
    }
}