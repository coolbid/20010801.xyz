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
using basic;
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Xml;

public partial class qzkeyAdmin_ashx_chapaiming : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string result = "0";
        string keywords = Request["keywords"];
        string yuming = HttpContext.Current.Request.Url.Host;

        try
        {
            System.Net.HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://www.baidu.com/s?wd=" + keywords + "&rn=50&tn=json");
            request.Method = "GET";
            request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
            request.UserAgent = "   Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //这个在Post的时候，一定要加上，如果服务器返回错误，他还会继续再去请求，不会使用之前的错误数据，做返回数据
            request.ServicePoint.Expect100Continue = false;
            Stream stream = response.GetResponseStream();
            StreamReader sr = new StreamReader(stream, Encoding.GetEncoding("UTF-8"));//UTF-8
            string htmlContent = sr.ReadToEnd();
            //获取被采集的主要内容
            //Response.Write(htmlContent);
            string _Href = @"" + yuming + @"([\s\S].*?)""title""";
            Regex regBody = new Regex(_Href, RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
            Match ma = regBody.Match(htmlContent);
            if (ma.Success)
            {
                string jieguo = ma.Groups[1].ToString();
                string paiming = @"""pn"":[\s\n]*?([\s\S].*?)}";
                Regex regpM = new Regex(paiming, RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
                Match pmNum = regpM.Match(jieguo);
                if (pmNum.Success)
                {
                    result = pmNum.Groups[1].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            result = "0";
        }
        Response.Write(result);
    }
}