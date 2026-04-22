using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text;

public partial class qzkeyAdmin_ashx_shangxiantongzhi : Basic.ManagerPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strResult = "0";
        if (basic.Tools.RequestClass.GetQueryString("action") == "tongzhi")
        {
            #region 执行通知

            basic.BasicPage bp = new basic.BasicPage();

            string zhanghao = "";
            string mima = "";
            SqlDataReader reader = bp.getRead("select top 1 * from Admin");
            if (reader.Read())
            {
                zhanghao = reader["AdminName"].ToString();
                mima = reader["AdminPassword"].ToString();
            }
            reader.Close();

            //读取网站配置信息
            string BeginTime = "";
            string EndTime = "";
            string Email = "";
            SqlDataReader reader2 = bp.getRead("select top 1 * from TbTimeLimit");
            if (reader2.Read())
            {
                BeginTime = reader2["BeginTime"].ToString();
                EndTime = reader2["EndTime"].ToString();
                Email = reader2["Email"].ToString();
            }
            reader2.Close();

            //账号不为空
            if (!string.IsNullOrEmpty(zhanghao) && !string.IsNullOrEmpty(Email))
            {
                #region 发送邮件

                string wangzhi = HttpContext.Current.Request.Url.Host;
                string strMailContent = null;
                strMailContent = "恭喜！您的网站开通啦！";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "网址：<a target='_blank' href='http://" + wangzhi + "'>http://" + wangzhi + "</a>";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "管理后台：<a target='_blank' href='http://" + wangzhi + "/qzkeyAdmin/login.aspx'>http://" + wangzhi + "/qzkeyAdmin/login.aspx</a>";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "账号：" + zhanghao;
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "密码：" + mima;
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "使用期限：" + BeginTime + "至" + EndTime;
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "如有疑问请联系您的专属售后项目经理。";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "感谢您对腾云的支持与信任，如果有任何问题，欢迎随时与我们取得联系！";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "--------------------------------------------";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "腾云建站--中国领先的建站品牌";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "官方网站：<a target='_blank' href='http://www.400301.com'>http://www.400301.com</a>";
                strMailContent = strMailContent + "<br>";
                strMailContent = strMailContent + "本邮件由系统发送，无需回复。";


                WebClient wc = new WebClient();
                StringBuilder postData = new StringBuilder();
                postData.Append("key=" + Basic.Keys.MailKey);
                postData.Append("&tomail=" + Email);
                postData.Append("&body=" + strMailContent);
                byte[] sendData = Encoding.GetEncoding("UTF-8").GetBytes(postData.ToString());
                wc.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
                wc.Headers.Add("ContentLength", sendData.Length.ToString());
                byte[] recData = wc.UploadData(Basic.Keys.MailUrl, "POST", sendData);

                string result = Encoding.GetEncoding("UTF-8").GetString(recData).ToLower();

                if (result == "true")
                {
                    strResult = "1";
                    //操作成功
                }
                else
                {
                    strResult = "9";
                    //操作失败
                }
                #endregion
            }
            else
            {
                strResult = "8";
                //账号未设置
            }

            #endregion
        }
        else
        {

            strResult = "99";
        }
        Response.Write(strResult);
        Response.End();
    }
}