using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class DoctorDetails : System.Web.UI.Page
    {
        public DataSet doctor;
        public static string doctorID;  // 医生ID
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录
            if (Session["userID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=userInfoCheck");
            }
            doctorID = Request["doctorID"].ToString();
            doctor = DoctorManager.DoctorIDHospita(doctorID);
            if (!IsPostBack)
            {
                DataSet ds = DoctorManager.DoctorWorkSelectManager(doctorID);
                string workDay = ds.Tables[0].Rows[0]["WorkDay"].ToString();
                string[] workDayArr = workDay.Split('，');
                for (int i = 0; i < workDayArr.Length; i++)
                {
                    if (workDayArr[i] == DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button1.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button2.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button3.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button4.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button5.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button6.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button7.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button8.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button9.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button10.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button11.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button12.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button13.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button14.Visible = true;
                    }
                }
            }
            // 将已读消息清空
            string userID = Session["userID"].ToString();
            OnlineInquiryManager.UpDateUserReadManager(userID, doctorID);
        }

        /// <summary>
        /// 在线预约
        /// </summary>
        /// <param name="time">预约时间</param>
        public void Appointment(string time)
        {
            DataSet doctorDs = DoctorManager.DoctorSelect(doctorID);
            string deptID = doctorDs.Tables[0].Rows[0]["deptID"].ToString();
            string hospitalID = doctorDs.Tables[0].Rows[0]["hospitalID"].ToString();
            DataSet ds = AppointmentManager.AppointmentRepeatManager(Session["userID"].ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                string userIDR = ds.Tables[0].Rows[0]["userID"].ToString();
                string hospitalIDR = ds.Tables[0].Rows[0]["hospitalID"].ToString();
                string deptIDR = ds.Tables[0].Rows[0]["deptID"].ToString();
                string doctorIDR = ds.Tables[0].Rows[0]["doctorID"].ToString();
                string timeR = ds.Tables[0].Rows[0]["AppointmentTime"].ToString();
                if (userIDR == Session["userID"].ToString() && hospitalIDR == hospitalID && deptIDR == deptID && doctorIDR == doctorID && timeR == time)
                {
                    Response.Write("<script>alert('请勿重复预约');</script>");
                }
                else
                {
                    if (AppointmentManager.AppointmentInsertManager(Session["userID"].ToString(), hospitalID, deptID, doctorID, time))
                    {
                        Response.Write("<script>alert('预约成功');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('预约失败！');</script>");
                    }
                }
            }
            else
            {
                if (AppointmentManager.AppointmentInsertManager(Session["userID"].ToString(), hospitalID, deptID, doctorID, time))
                {
                    Response.Write("<script>alert('预约成功');</script>");
                }
                else
                {
                    Response.Write("<script>alert('预约失败！');</script>");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.Day.ToString() + "日 " + DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(1).Day.ToString() + "日 " + DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(2).Day.ToString() + "日 " + DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(3).Day.ToString() + "日 " + DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(4).Day.ToString() + "日 " + DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(5).Day.ToString() + "日 " + DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(6).Day.ToString() + "日 " + DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
            Appointment(time);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.Day.ToString() + "日 " + DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(1).Day.ToString() + "日 " + DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(2).Day.ToString() + "日 " + DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(3).Day.ToString() + "日 " + DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(4).Day.ToString() + "日 " + DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(5).Day.ToString() + "日 " + DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(6).Day.ToString() + "日 " + DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
            Appointment(time);
        }
    }
}