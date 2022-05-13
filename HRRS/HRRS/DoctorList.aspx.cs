using BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HRRS
{
    public partial class DoctorList : System.Web.UI.Page
    {
        public DataSet doctor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Drinit();
                InIt();
            }
        }

        void Drinit()
        {
            DropDownList1.DataSource = HospitalManager.HospitaSelectName();
            DropDownList1.DataTextField = "HospitaName";
            DropDownList1.DataValueField = "HospitaName";
            DropDownList1.DataBind();
            ListItem item = new ListItem();
            item.Text = "全部";
            item.Value = "全部";
            DropDownList1.Items.Add(item);
            DropDownList1.SelectedValue = "全部";

            DropDownList2.DataSource = DoctorManager.DoctorPositionSelect();
            DropDownList2.DataTextField = "DoctorPosition";
            DropDownList2.DataValueField = "DoctorPosition";
            DropDownList2.DataBind();
            ListItem items = new ListItem();
            items.Text = "全部";
            items.Value = "全部";
            DropDownList2.Items.Add(items);
            DropDownList2.SelectedValue = "全部";
        }

        void InIt()
        {
            doctor = DoctorManager.DoctorSelect();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hname = DropDownList1.SelectedValue.ToString();
            string dposi = DropDownList2.SelectedValue.ToString();
            if (hname != "全部")
            {
                if (dposi != "全部")
                {
                    doctor = DoctorManager.DoctorHospitahp(hname, dposi);
                }
                else
                {
                    doctor = DoctorManager.DoctorHospitaSelect(hname);
                }
            }
            else
            {
                if (dposi != "全部")
                {
                    doctor = DoctorManager.DoctorHospitaPositionSelect(dposi);
                }
                else
                {
                    InIt();
                }
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hname = DropDownList1.SelectedValue.ToString();
            string dposi = DropDownList2.SelectedValue.ToString();
            if (hname != "全部")
            {
                if (dposi != "全部")
                {
                    doctor = DoctorManager.DoctorHospitahp(hname, dposi);
                }
                else
                {
                    doctor = DoctorManager.DoctorHospitaSelect(hname);
                }
            }
            else
            {
                if (dposi != "全部")
                {
                    doctor = DoctorManager.DoctorHospitaPositionSelect(dposi);
                }
                else
                {
                    InIt();
                }
            }
        }
    }
}