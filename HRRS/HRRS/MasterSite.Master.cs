using System;

namespace HRRS
{
    public partial class MasterSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                disabledTrue.Style["display"] = "none";
                disabledFalse.Style["display"] = "block";
            }
            else
            {
                disabledTrue.Style["display"] = "block";
                disabledFalse.Style["display"] = "none";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // 点击退出，销毁所有 Session
            Session.Abandon();
            Response.AddHeader("Refresh","0");
            Response.Write("<script>alert('已退出登录')</script>");
        }
    }
}