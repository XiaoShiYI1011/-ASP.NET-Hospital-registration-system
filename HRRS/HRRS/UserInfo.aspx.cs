using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class UserInfo : System.Web.UI.Page
    {
        public static string Count = "0";
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
            Count = count.ToString();
            if (!IsPostBack)
            {
                Show();
            }
        }

        /// <summary>
        /// 显示个人信息
        /// </summary>
        public void Show()
        {
            Image2.ImageUrl = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][7].ToString();
            Image1.ImageUrl = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][7].ToString();
            headerName_label.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][1].ToString();
            userName.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][1].ToString();
            realName.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][3].ToString();
            userSex.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][4].ToString();
            userPhone.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][6].ToString();
            iDCard.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][5].ToString();
            UpDateUserName.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][1].ToString();
            UpDateRealName.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][3].ToString();
            if (UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][4].ToString() == "男")
            {
                UpDateSex.Checked = true;
            }
            else
            {
                RadioButton1.Checked = true;
            }
            UpDateUserPhone.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][6].ToString();
            UpDateIDCard.Text = UserManager.UserInfoManager(Session["UserName"].ToString()).Tables[0].Rows[0][5].ToString();
        }

        /// <summary>
        /// 个人信息修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnConfUpDate_Click(object sender, EventArgs e)
        {
            string userName = UpDateUserName.Text;
            string realName = UpDateRealName.Text;
            string userSex;
            if (UpDateSex.Checked)
            {
                userSex = "男";
            }
            else
            {
                userSex = "女";
            }
            double userPhone = Convert.ToDouble(UpDateUserPhone.Text);
            string IDCard = UpDateIDCard.Text;
            if (UserManager.UserInfoUpdateManager(userName, realName, userSex, IDCard, userPhone, Session["UserName"].ToString()))
            {
                Show();
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }

        /// <summary>
        /// 显示修改头像弹框
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpHeadPortrait_Click(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = true;
        }

        /// <summary>
        /// 隐藏修改头像弹框
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void close_icon_Click(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = false;
        }

        /// <summary>
        /// 隐藏修改头像弹框
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_out_Click(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = false;
        }

        protected void btnUpHeadPortrait_Click1(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = true;
        }

        protected void close_icon_Click1(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = false;
        }

        protected void Btn_out_Click1(object sender, EventArgs e)
        {
            UpHeadPortraitModel.Visible = false;
        }

        protected void confUpDateImg_Click(object sender, EventArgs e)
        {
            if (UserManager.UserInfoUpdateImgManager(Session["img"].ToString(), Session["userID"].ToString()))
            {
                UpHeadPortraitModel.Visible = false;
                Show();
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }

        protected void BtnFileUP_Click(object sender, EventArgs e)
        {
            string name = FileUP.FileName;
            string fix = name.Substring(name.LastIndexOf(".") + 1).ToLower();
            if (fix == "png" || fix == "jpg" || fix == "jpeg")
            {
                FileUP.SaveAs(Server.MapPath("~/Assets/User_Imgs/") + FileUP.FileName);
                Session["img"] = "~/Assets/User_Imgs/" + FileUP.FileName;
                Image1.ImageUrl = "~/Assets/User_Imgs/" + FileUP.FileName;
            }
        }
    }
}