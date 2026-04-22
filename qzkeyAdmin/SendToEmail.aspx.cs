using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using jmail;
using System.Net.Mail;
using WebApp.Components;

public partial class Manager_SendToEmail : System.Web.UI.Page
{
    Admin Admin = new Admin();
    Time Time = new Time();
    SqlDataReader reader;
    string Email;
    string strResult;
    protected void Page_Load(object sender, EventArgs e)
    {
        Email = Request["Email"].Trim();
        if (getEmail(Email) == true)//判断该邮箱是否管理员邮箱
        {
            strResult = SendEmail(Email);
            Response.Write(strResult);
        }
        else
        {
            Response.Write("Error");
        }
        Response.End();
    }
    protected bool getEmail(string strEmail)
    {
        bool result = false;
        int intID = 1;
        reader = Time.GetTimeLimit(intID);
        if (reader.Read())
        {
            if (strEmail == reader["Email"].ToString())
            {
                result = true;
            }
        }
        reader.Close();
        return result;
    }
    protected string SendEmail(string sEmail)
    {
        string strValue = null;
        string strUserId = null;
        string strPwd = null;
        string strEmail = null;
        string strMailContent = null;
        //获得普通管理员帐号和密码
        reader = Admin.GetAdmin();
        if (reader.Read())
        {
            strUserId = reader["AdminName"].ToString();
            strPwd = reader["AdminPassword"].ToString();
        }
        reader.Close();
        //结束
        strEmail = sEmail;
        strMailContent = strMailContent + "尊敬的用户你好：";
        strMailContent = strMailContent + "<br>";
        strMailContent = strMailContent + "您于" + DateTime.Now + "使用了网站密码找回功能";
        strMailContent = strMailContent + "<br>";
        strMailContent = strMailContent + "用户名：" + strUserId;
        strMailContent = strMailContent + "<br>";
        strMailContent = strMailContent + "密码：" + strPwd;
        strMailContent = strMailContent + "<br>";
        strMailContent = strMailContent + "请慎重保管网站密码，不要轻易透露给他人！";
        bool result = Basic.Tools.Mail.Send(strEmail, "腾云建站", "关于网站管理员找回密码的通知", strMailContent.ToString());
        if (result)
        {
            strValue = "True";
        }
        else
        {
            strValue = "False";
        }
        return strValue;
    }
}

