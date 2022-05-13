using BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HRRS
{
    public partial class HospitalList : System.Web.UI.Page
    {
        public DataSet hospital;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Drinit();
                InIt();
            }
        }

        /// <summary>
        /// 下拉框初始化
        /// </summary>
        void Drinit()
        {
            DropDownList1.DataSource = HospitalManager.HospitaSelectGrade();
            DropDownList1.DataTextField = "Grade";
            DropDownList1.DataValueField = "Grade";
            DropDownList1.DataBind();
            ListItem item = new ListItem();
            item.Text = "全部";
            item.Value = "全部";
            DropDownList1.Items.Add(item);
            DropDownList1.SelectedValue = "全部";

            DropDownList2.DataSource = HospitalManager.HospitaSelectRegion();
            DropDownList2.DataTextField = "HospitaRegion";
            DropDownList2.DataValueField = "HospitaRegion";
            DropDownList2.DataBind();
            ListItem items = new ListItem();
            items.Text = "全部";
            items.Value = "全部";
            DropDownList2.Items.Add(items);
            DropDownList2.SelectedValue = "全部";
        }

        /// <summary>
        /// 页面初始化
        /// </summary>
        void InIt()
        {
            hospital = HospitalManager.HospitaSelectinit();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string gr = this.DropDownList1.SelectedValue.ToString();
            string re = this.DropDownList2.SelectedValue.ToString();
            if (gr != "全部")
            {
                if (re != "全部")
                {
                    hospital = HospitalManager.HospitaSelectGradeRegion(gr, re);
                }
                else
                {
                    hospital = HospitalManager.HospitaSelectinitGrade(gr);
                }
            }
            else
            {
                if (re != "全部")
                {
                    hospital = HospitalManager.HospitaSelectinitRegion(re);
                }
                else
                {
                    InIt();
                }
            }
        }

        protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string gr = this.DropDownList1.SelectedValue.ToString();
            string re = this.DropDownList2.SelectedValue.ToString();
            if (gr != "全部")
            {
                if (re != "全部")
                {
                    hospital = HospitalManager.HospitaSelectGradeRegion(gr, re);
                }
                else
                {
                    hospital = HospitalManager.HospitaSelectinitGrade(gr);
                }
            }
            else
            {
                if (re != "全部")
                {
                    hospital = HospitalManager.HospitaSelectinitRegion(re);
                }
                else
                {
                    InIt();
                }
            }
        }
    }
}