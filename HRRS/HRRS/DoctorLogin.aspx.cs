using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class DoctorLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录
            if (Session["AutoLogin"] != null)
            {
                doctorName.Text = Session["doctorName"].ToString();
                doctorPassWord.Attributes.Add("Value", Session["doctorPwd"].ToString());
                DoctorAutoLogin.Checked = true;
            }
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string doctorName = Request.Form["doctorName"].Trim();
            string doctorPwd = Request.Form["doctorPassWord"].Trim();
            if (DoctorManager.DoctorLoginManager(doctorName, doctorPwd))
            {
                // 判断身份勾选自动登录
                if (DoctorAutoLogin.Checked)
                {
                    Session["AutoLogin"] = true;
                    Session["doctorPwd"] = doctorPwd;
                }
                Session["doctorName"] = doctorName;
                DataSet ds = DoctorManager.DoctorIDSelectManager(doctorName, doctorPwd);
                // 身份标识
                Session["doctorID"] = ds.Tables[0].Rows[0]["doctorID"].ToString();
                Response.Redirect("DoctorIndex.aspx");
            }
            else
            {
                Response.Redirect("Fail.aspx?parameter=doctorLogin");
            }
        }
    }
}