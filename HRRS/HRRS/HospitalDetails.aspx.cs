using BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HRRS
{
    public partial class HospitalDetails : System.Web.UI.Page
    {
        public DataSet dept;
        public DataSet hospital;
        public DataSet doctor;
        protected void Page_Load(object sender, EventArgs e)
        {
            string hospitalID = Request["hospitalID"];
            hospital = HospitalManager.HospitaIdSelect(int.Parse(hospitalID));
            dept = DeptManager.Deptinfo();
            if (!IsPostBack)
            {

                InIt();
                Drinit();
            }
        }

        void InIt()
        {
            string hospitalID = Request["hospitalID"];
            doctor = HospitalManager.HospitaDept(int.Parse(hospitalID));
        }

        void Drinit()
        {
            string hospitalID = Request["hospitalID"];
            DropDownList1.DataSource = DoctorManager.HospitaDoctorDeptSelectDepartment(int.Parse(hospitalID));
            DropDownList1.DataTextField = "Department";
            DropDownList1.DataValueField = "Department";
            DropDownList1.DataBind();
            ListItem item = new ListItem
            {
                Text = "全部",
                Value = "全部"
            };
            DropDownList1.Items.Add(item);
            DropDownList1.SelectedValue = "全部";

            DropDownList2.DataSource = DoctorManager.HospitaDoctorDeptSelectDoctorPosition(int.Parse(hospitalID));
            DropDownList2.DataTextField = "DoctorPosition";
            DropDownList2.DataValueField = "DoctorPosition";
            DropDownList2.DataBind();
            ListItem items = new ListItem
            {
                Text = "全部",
                Value = "全部"
            };
            DropDownList2.Items.Add(items);
            DropDownList2.SelectedValue = "全部";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hospitalID = Request["hospitalID"];
            int id = int.Parse(hospitalID);
            string ks = DropDownList1.SelectedValue.ToString();
            string dp = DropDownList2.SelectedValue.ToString();
            if (ks != "全部")
            {
                if (dp != "全部")
                {
                    doctor = DoctorManager.HDDDepartmentDoctorPosition(id, ks, dp);
                }
                else
                {
                    doctor = DoctorManager.HDDDepartment(id, ks);
                }
            }
            else
            {
                if (dp != "全部")
                {
                    doctor = DoctorManager.HDDDoctorPosition(id, dp);
                }
                else
                {
                    InIt();
                }
            }
        }
    }
}