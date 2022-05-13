using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class ReservationInfo : System.Web.UI.Page
    {
        public static string Count = "0";
        public DataSet reinfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录
            if (Session["userID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=userInfoCheck");
            }
            else
            {
                DataSet ds = OnlineInquiryManager.UserGetMessageListManager(Session["userID"].ToString());
                int count = 0;
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    count += i;
                }
                Count = count.ToString();
                int id = int.Parse(Session["userID"].ToString());
                reinfo = AppointmentManager.AppointmentSelect(id);
                if (reinfo.Tables[0].Rows.Count == 0)
                {
                    Label1.Text = "---";
                    Label2.Text = "未预约";
                    Label3.Text = "未预约";
                    Label4.Text = "未预约";
                    Label5.Text = "未预约";
                    Label6.Text = "未预约";
                    Button1.Visible = false;
                }
                else
                {
                    Label1.Text = reinfo.Tables[0].Rows[0][0].ToString();
                    Label2.Text = reinfo.Tables[0].Rows[0][2].ToString();
                    Label3.Text = reinfo.Tables[0].Rows[0][3].ToString();
                    Label4.Text = reinfo.Tables[0].Rows[0][4].ToString();
                    Label5.Text = reinfo.Tables[0].Rows[0][5].ToString();
                    Label6.Text = reinfo.Tables[0].Rows[0][6].ToString();
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string id = reinfo.Tables[0].Rows[0][1].ToString();
            if (AppointmentManager.AppointmentDelet(int.Parse(id)))
            {
                Label1.Text = "---";
                Label2.Text = "未预约";
                Label3.Text = "未预约";
                Label4.Text = "未预约";
                Label5.Text = "未预约";
                Label6.Text = "未预约";
                Button1.Visible = false;
            }
        }
    }
}