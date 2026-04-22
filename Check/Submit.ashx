<%@ WebHandler Language="C#" Class="Submit" %>

using System;
using System.Web;
using System.Net;
using System.Text;
using System.IO;

public class Submit : IHttpHandler
{
    WebApp.Components.Submit submit = new WebApp.Components.Submit();
    WebApp.Components.SystemTools systemtools = new WebApp.Components.SystemTools();
    public void ProcessRequest(HttpContext context)
    {
        string strResult = null;
        string strInfo = null;
        if (context.Request["info"] != null)
        {
            strInfo = context.Request["info"].ToString();
            bool pro = systemtools.ProcessSqlStr(strInfo);
            if (pro == true)
            {
                string IP = context.Request.UserHostAddress;

                int m = submit.InsertSubmitform(strInfo + "_IP:" + IP, DateTime.Now.ToString());
                if (m > 0)
                {
                    string openid = domain.domainname.GetIndexConfigValue("openid");
                    send(openid,"您有一条新的询盘信息，请登录网站后台查看！");
                    strResult = "success";
                }
            }
            else
            {
                strResult = "failure";
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(strResult);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public void send(string op,string content)
    {
        string url = "https://www.400301.com/Api/Wechat/Push.aspx?key=oy93swn2wvcIDYNzMIw&openid="+op+"&context="+content;
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072; //一定要有这一句
        Encoding encoding = Encoding.UTF8;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "POST";
        request.Accept = "text/html, application/xhtml+xml, */*";
        request.ContentType = "application/json";
        request.ContentLength = 0;
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
        {
        }
    }
}