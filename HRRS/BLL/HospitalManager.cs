using DAL;
using System.Data;

namespace BLL
{
    public class HospitalManager
    {
        public static DataSet HospitaSelectGrade()
        {
            return HospitalinfoService.HospitaSelectGrade();
        }

        public static DataSet HospitaSelectRegion()
        {
            return HospitalinfoService.HospitaSelectRegion();
        }

        public static DataSet HospitaSelectName()
        {
            return HospitalinfoService.HospitaSelectName();
        }

        public static DataSet HospitaSelectinit()
        {
            return HospitalinfoService.HospitaSelectinit();
        }

        public static DataSet HospitaSelectinitGrade(string grade)
        {
            return HospitalinfoService.HospitaSelectinitGrade(grade);
        }

        public static DataSet HospitaSelectinitRegion(string region)
        {
            return HospitalinfoService.HospitaSelectinitRegion(region);
        }

        public static DataSet HospitaSelectGradeRegion(string grade, string region)
        {
            return HospitalinfoService.HospitaSelectGradeRegion(grade, region);
        }

        public static DataSet HospitaIdSelect(int id)
        {
            return HospitalinfoService.HospitaIdSelect(id);
        }

        public static DataSet HospitaDept(int id)
        {
            return HospitalinfoService.HospitaDept(id);
        }
    }
}
