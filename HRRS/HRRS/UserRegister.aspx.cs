using BLL;
using System;

namespace HRRS
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Btn_Click(object sender, EventArgs e)
        {
            string userName = Request.Form["userName"].Trim();
            string userPwd = Request.Form["confPassWord"].Trim();
            string realName = Request.Form["realName"].Trim();
            string userSex = RadioButton1.Checked == true ? "男" : "女";
            string iDCard = Request.Form["iDCard"].Trim();
            string userPhone = Request.Form["userPhone"].Trim();
            if (UserManager.UserInsertManager(userName, userPwd, realName, userSex, iDCard, userPhone))
            {
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                Response.Redirect("Fail.aspx?parameter=register");
            }
        }
    }
}