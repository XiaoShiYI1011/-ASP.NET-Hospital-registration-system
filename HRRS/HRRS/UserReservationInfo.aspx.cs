using BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HRRS
{
    public partial class UserReservationInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show();
            }
        }

        public void Show()
        {
            Repeater1.DataSource = AppointmentManager.AppointmentInfoManager(Session["doctorID"].ToString());
            Repeater1.DataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (AppointmentManager.AppointmentDeleteManager(e.CommandArgument.ToString()))
            {
                Show();
            }
            else
            {
                Response.Write("<script>alert('操作失败！');</script>");
            }
        }
    }
}