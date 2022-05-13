using System;

namespace HRRS
{
    public partial class Fail : System.Web.UI.Page
    {
        public string parameter;
        protected void Page_Load(object sender, EventArgs e)
        {
            Btn_goLogin.Style["display"] = "none";
            Btn_goLogin2.Style["display"] = "none";
            parameter = Request["parameter"];
            if (parameter == "login")
            {
                Title.Text = "账号或密码错误";
                Content.Text = "请检查账号或密码是否输入正确";
            }
            else if (parameter == "userInfoCheck")
            {
                Btn_goLogin.Style["display"] = "block";
                Title.Text = "您还未登录";
                Content.Text = "请登录后再进行操作";
            }
            else if (parameter == "register")
            {
                Title.Text = "注册失败";
                Content.Text = "请检查信息是否输入正确";
            }
            else if (parameter == "doctorLogin")
            {
                Title.Text = "账号或密码错误";
                Content.Text = "请检查账号或密码是否输入正确";
            }
            else if (parameter == "doctorLoginCheck")
            {
                Btn_goLogin2.Style["display"] = "block";
                Title.Text = "您还未登录";
                Content.Text = "请登录后再进行操作";
            }
        }

        protected void Btn_out_Click(object sender, EventArgs e)
        {
            if (parameter == "login")
            {
                Response.Redirect("UserLogin.aspx");
            }
            else if (parameter == "userInfoCheck")
            {
                Response.Redirect("index.aspx");
            }
            else if (parameter == "register")
            {
                Response.Redirect("UserRegister.aspx");
            }
            else if (parameter == "doctorLogin")
            {
                Response.Redirect("DoctorLogin.aspx");
            }
            else if (parameter == "doctorLoginCheck")
            {
                Response.Redirect("DoctorLogin.aspx");
            }
        }

        protected void Btn_goLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void Btn_goLogin2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorLogin.aspx");
        }
    }
}