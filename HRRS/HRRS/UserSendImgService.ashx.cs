using BLL;
using System;
using System.Drawing;
using System.IO;
using System.Web;

namespace HRRS
{
    /// <summary>
    /// UserSendImgService 用户发送图片的一般处理程序
    /// </summary>
    public class UserSendImgService : IHttpHandler
    {
        public static string saveDataPath;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string img = context.Request["base64"];
            bool resault = Base64ToImage(img, context);
            if (resault)
            {
                string userID = context.Request["userID"];
                string doctorID = context.Request["doctorID"];
                if (OnlineInquiryManager.MessageImgInsertManager(userID, doctorID, saveDataPath))
                {
                    context.Response.Write("[{\"result\":\"true\"}]");
                }
                else
                {
                    context.Response.Write("[{\"result\":\"false\"}]");
                }
            }
            else
            {
                context.Response.Write("[{\"result\":\"false\"}]");
            }
        }

        /// <summary>
        /// base64解析为图片并保存
        /// </summary>
        /// <param name="base64Str">base64字符串</param>
        /// <param name="context">封装有关个别 HTTP 请求的所有 HTTP 特定的信息</param>
        /// <returns>执行成功或失败</returns>
        public bool Base64ToImage(string base64Str, HttpContext context)
        {
            base64Str = base64Str.Replace("data:image/png;base64,", "").Replace("data:image/jgp;base64,", "").Replace("data:image/jpg;base64,", "").Replace("data:image/jpeg;base64,", "");  //将base64头部信息替换
            // 去掉特殊符号
            string dummyData = base64Str.Trim().Replace("%", "").Replace(",", "").Replace(" ", "+");
            if (dummyData.Length % 4 > 0)
            {
                dummyData = base64Str.PadRight(dummyData.Length + 4 - dummyData.Length % 4, '=');
            }
            try
            {
                string inputStr = dummyData;
                byte[] arr = Convert.FromBase64String(inputStr);
                MemoryStream ms = new MemoryStream(arr);  // 中间商
                Bitmap bmp = new Bitmap(ms);  // GDI 位图
                string path = context.Server.MapPath("~/Assets/ChatImg/");
                string imgName = DateTime.Now.ToString("yyMMddhhmmssfff");
                string file = path + imgName + ".jpg";  // 图片路径包括名字后缀
                bmp.Save(file, System.Drawing.Imaging.ImageFormat.Jpeg);  // 保存到文件夹
                ms.Close();  // 关闭流
                saveDataPath = "~/Assets/ChatImg/" + imgName + ".jpg";  // 保存到数据库的路径
            }
            catch (Exception e)
            {
                string error = e.Message;
                return false;
            }
            return true;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}