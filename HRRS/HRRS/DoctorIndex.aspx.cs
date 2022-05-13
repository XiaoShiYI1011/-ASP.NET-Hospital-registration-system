using BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HRRS
{
    public partial class DoctorIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctorID"] == null)
            {
                Response.Redirect("Fail.aspx?parameter=doctorLoginCheck");
            }
            if (!IsPostBack)
            {
                Show();
                string id = Session["doctorID"].ToString();
                DataSet ds = DoctorManager.DoctorWorkSelectManager(id);
                string workDay = ds.Tables[0].Rows[0]["WorkDay"].ToString();
                string[] workDayArr = workDay.Split('，');
                for (int i = 0; i < workDayArr.Length; i++)
                {
                    if (workDayArr[i] == DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button1.Visible = true;
                        CheckBox1.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button2.Visible = true;
                        CheckBox2.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button3.Visible = true;
                        CheckBox3.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button4.Visible = true;
                        CheckBox4.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button5.Visible = true;
                        CheckBox5.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button6.Visible = true;
                        CheckBox6.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午")
                    {
                        Button7.Visible = true;
                    }
                    if (workDayArr[i] == DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button8.Visible = true;
                        CheckBox8.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button9.Visible = true;
                        CheckBox9.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button10.Visible = true;
                        CheckBox10.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button11.Visible = true;
                        CheckBox11.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button12.Visible = true;
                        CheckBox12.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button13.Visible = true;
                        CheckBox13.Checked = true;
                    }
                    if (workDayArr[i] == DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午")
                    {
                        Button14.Visible = true;
                        CheckBox14.Checked = true;
                    }
                }
            }
        }

        /// <summary>
        /// 初始化
        /// </summary>
        public void Show()
        {
            string id = Session["doctorID"].ToString();
            DataTable dt = DoctorManager.DoctorIndexManager(id);
            DoctorName.Text = dt.Rows[0][1].ToString();
            DoctorRealName.Text = dt.Rows[0][3].ToString();
            DoctorSex.Text = dt.Rows[0][4].ToString();
            HospitaName.Text = dt.Rows[0][12].ToString();
            Department.Text = dt.Rows[0][19].ToString();
            DoctorDescribe.Text = dt.Rows[0][5].ToString();
            DoctorPosition.Text = dt.Rows[0][9].ToString();
            UpDoctorName.Text = dt.Rows[0][1].ToString();
            UpDoctorRealName.Text = dt.Rows[0][3].ToString();
            Image2.ImageUrl = dt.Rows[0][6].ToString();
            Image1.ImageUrl = dt.Rows[0][6].ToString();
            if (dt.Rows[0][4].ToString() == "男")
            {
                UpDateSex.Checked = true;
            }
            else
            {
                RadioButton1.Checked = true;
            }
            UpDoctorDescribe.Text = dt.Rows[0][5].ToString();
            Uphospitaldrop.DataSource = DoctorManager.HospitalselectManager();
            Uphospitaldrop.DataValueField = "hospitalID";
            Uphospitaldrop.DataTextField = "HospitaName";
            Uphospitaldrop.DataBind();
            Uphospitaldrop.SelectedValue = dt.Rows[0][7].ToString();
            Updeptdrop.DataSource = DoctorManager.DeptselectManager();
            Updeptdrop.DataValueField = "deptID";
            Updeptdrop.DataTextField = "Department";
            Updeptdrop.DataBind();
            Updeptdrop.SelectedValue = dt.Rows[0][8].ToString();
            ListItem item1 = new ListItem
            {
                Text = "主任医师",
                Value = "主任医师"
            };
            ListItem item2 = new ListItem
            {
                Text = "副主任医师",
                Value = "副主任医师"
            };
            ListItem item3 = new ListItem
            {
                Text = "主治医师",
                Value = "主治医师"
            };
            ListItem item4 = new ListItem
            {
                Text = "助理医师",
                Value = "助理医师"
            };
            UpPositiondrop.Items.Add(item1);
            UpPositiondrop.Items.Add(item2);
            UpPositiondrop.Items.Add(item3);
            UpPositiondrop.Items.Add(item4);
            UpPositiondrop.SelectedValue = dt.Rows[0][9].ToString();
        }

        /// <summary>
        /// 值班日期修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnConfUpdate_Click(object sender, EventArgs e)
        {
            string workDay = UpDateWork();
            string id = Session["doctorID"].ToString();
            if (DoctorManager.DoctorWorkUpDateManager(workDay, id))
            {
                Response.AddHeader("Refresh", "0");
            }
            else
            {
                Response.Write("<script>alert('修改失败！');</script>");
            }
        }

        /// <summary>
        /// 获取值班时间
        /// </summary>
        /// <returns>值班时间</returns>
        public string UpDateWork()
        {
            string time = null;
            if (CheckBox1.Checked)
            {
                time += DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox2.Checked)
            {
                time += DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox3.Checked)
            {
                time += DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox4.Checked)
            {
                time += DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox5.Checked)
            {
                time += DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox6.Checked)
            {
                time += DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox7.Checked)
            {
                time += DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午，";
            }
            if (CheckBox8.Checked)
            {
                time += DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox9.Checked)
            {
                time += DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox10.Checked)
            {
                time += DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox11.Checked)
            {
                time += DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox12.Checked)
            {
                time += DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox13.Checked)
            {
                time += DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            if (CheckBox14.Checked)
            {
                time += DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午，";
            }
            return time;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.Day.ToString() + "日 " + DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(1).Day.ToString() + "日 " + DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(2).Day.ToString() + "日 " + DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(3).Day.ToString() + "日 " + DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(4).Day.ToString() + "日 " + DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(5).Day.ToString() + "日 " + DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(6).Day.ToString() + "日 " + DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "上午";
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.Day.ToString() + "日 " + DateTime.Now.ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(1).Day.ToString() + "日 " + DateTime.Now.AddDays(1).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(2).Day.ToString() + "日 " + DateTime.Now.AddDays(2).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(3).Day.ToString() + "日 " + DateTime.Now.AddDays(3).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(4).Day.ToString() + "日 " + DateTime.Now.AddDays(4).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(5).Day.ToString() + "日 " + DateTime.Now.AddDays(5).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            string time = DateTime.Now.Month.ToString() + "月" + DateTime.Now.AddDays(6).Day.ToString() + "日 " + DateTime.Now.AddDays(6).ToString("dddd", new System.Globalization.CultureInfo("zh-cn")) + "下午";
        }

        protected void btnUpImg_Click(object sender, EventArgs e)
        {
            DoctorUpHeadPortraitModel.Visible = true;
        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {
            DoctorUpHeadPortraitModel.Visible = false;
        }

        protected void BtnClose2_Click(object sender, EventArgs e)
        {
            DoctorUpHeadPortraitModel.Visible = false;
        }

        /// <summary>
        /// 医生信息修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnConfUpDate_Click(object sender, EventArgs e)
        {
            char sex;
            if (UpDateSex.Checked)
            {
                sex = '男';
            }
            else
            {
                sex = '女';
            }
            if (DoctorManager.DoctorUpManager(UpDoctorName.Text, UpDoctorRealName.Text, sex, int.Parse(Uphospitaldrop.SelectedValue), int.Parse(Updeptdrop.SelectedValue), UpDoctorDescribe.Text, UpPositiondrop.SelectedValue, DoctorName.Text))
            {
                UpPositiondrop.Items.Clear();
                Show();
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }

        /// <summary>
        /// 医生头像修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnFileUP_Click(object sender, EventArgs e)
        {
            string name = FileUP.FileName;
            string fix = name.Substring(name.LastIndexOf(".") + 1).ToLower();
            if (fix == "png" || fix == "jpg" || fix == "jpeg")
            {
                FileUP.SaveAs(Server.MapPath("~/Assets/Doctor_Imgs/") + FileUP.FileName);
                Session["doctorimg"] = "~/Assets/Doctor_Imgs/" + FileUP.FileName;
                Image1.ImageUrl = "~/Assets/Doctor_Imgs/" + FileUP.FileName;
            }
        }

        /// <summary>
        /// 医生头像修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void confUpDateImg_Click(object sender, EventArgs e)
        {
            if (DoctorManager.DoctorImgManager(Session["doctorimg"].ToString(), Session["doctorid"].ToString()))
            {
                DoctorUpHeadPortraitModel.Visible = false;
                Show();
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
            }
        }
    }
}