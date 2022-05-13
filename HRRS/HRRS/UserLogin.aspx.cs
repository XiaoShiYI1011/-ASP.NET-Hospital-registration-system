using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断是否已经登录
            if (Session["AutoLogin"] != null)
            {
                userName.Text = Session["UserName"].ToString();
                passWord.Attributes.Add("Value", Session["UserPwd"].ToString());
                autoLogin.Checked = true;
            }
        }

        /// <summary>
        /// 登录按钮，登录成功则存入 Session
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string userName = Request.Form["userName"].Trim();
            string userPwd = Request.Form["passWord"].Trim();
            if (UserManager.LoginManager(userName, userPwd))
            {
                // 判断身份勾选自动登录
                if (autoLogin.Checked)
                {
                    Session["AutoLogin"] = true;
                    Session["UserPwd"] = userPwd;
                }
                Session["UserName"] = userName;
                DataSet ds = UserManager.UserIDManager(userName, userPwd);
                // 身份标识
                Session["userID"] = ds.Tables[0].Rows[0]["userID"].ToString();
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Redirect("Fail.aspx?parameter=login");
            }
        }

        protected void btn_qx_Click(object sender, EventArgs e)
        {
            UpDateUserName.Text = "";
            iDCard.Text = "";
            UpDatePassWord.Text = "";
            confUpDatePassWord.Text = "";
        }

        protected void btn_know_Click(object sender, EventArgs e)
        {
            string username = Request.Form["UpDateUserName"].Trim();
            string idcard = Request.Form["iDCard"].Trim(); 
            string uspwd = Request.Form["confUpDatePassWord"].Trim();
            if (UserManager.UserSelectNameID(username,idcard,uspwd))
            {
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                UpDateUserName.Text = "";
                iDCard.Text = "";
                Response.Write("<script>alert('请检查用户名或身份证是否输入正确')</script>");
            }
        }
    }
}