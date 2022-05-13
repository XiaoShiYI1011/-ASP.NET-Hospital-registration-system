using BLL;
using System;
using System.Data;

namespace HRRS
{
    public partial class index1 : System.Web.UI.Page
    {
        public DataSet t_hospital;
        public DataSet t_doctorInfo;
        protected void Page_Load(object sender, EventArgs e)
        {
            // 查询医院数据（查询 6 条数据）
            t_hospital = UserManager.HospitalInfoManager("6");
            // 查询医生数据（查询 9 条数据）
            t_doctorInfo = UserManager.DoctorInfoManager("8");
        }
    }
}