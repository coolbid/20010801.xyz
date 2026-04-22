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
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using basic;
using System.Net;
using System.Text;

/// <summary>
/// 功能：服务器异步通知页面
/// 版本：3.3
/// 日期：2012-07-10
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// ///////////////////页面功能说明///////////////////
/// 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
/// 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
/// 该页面调试工具请使用写文本函数logResult。
/// 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
/// </summary>
public partial class notify_url : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            BasicPage bp = new BasicPage();
            string payment_fee = Request.Form["payment_fee"].ToString();//估计是税费
            string custom = Request.Form["custom"].ToString();//订单号
            string mc_gross = Request.Form["mc_gross"].ToString(); //付款总金额
            string payment_status = Request.Form["payment_status"].ToString(); //付款成功，则会返回“Completed”

            if (VerifyIPN())
            {
                if (payment_status == "Completed")
                {
                    bp.doExecute("Update tborder set zhuangtai='已PayPal付款' where Bianhao='" + custom + "'");
                }
            }
        }
        catch (Exception ex)
        {
            Write(ex.Message.ToString());
        }
    }
    public void Write(string str)
    {
      
    }
    bool VerifyIPN()
    {
        string strFormValues = Request.Form.ToString();
        string strNewValue;
        string strResponse;
        string serverURL = "https://www.sandbox.paypal.com/cgi-bin/webscr";

        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(serverURL);
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        strNewValue = strFormValues + "&cmd=_notify-validate";
        //req.ContentLength = strNewValue.Length;

        //StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        //stOut.Write(strNewValue);
        //stOut.Close();

        //StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
        //strResponse = stIn.ReadToEnd();
        //stIn.Close();



        WebClient MyWebClient = new WebClient();
        MyWebClient.Credentials = CredentialCache.DefaultCredentials;//获取或设置用于向Internet资源的请求进行身份验证的网络凭据
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
        Byte[] pageData = MyWebClient.DownloadData(serverURL + "?" + strNewValue); //从指定网站下载数据
        //string pageHtml = Encoding.Default.GetString(pageData);  //如果获取网站页面采用的是GB2312，则使用这句    
        strResponse = Encoding.UTF8.GetString(pageData); //如果获取网站页面采用的是UTF-8，则使用这句

        return strResponse == "VERIFIED";
    }
}