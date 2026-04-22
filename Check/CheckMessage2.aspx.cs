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

public partial class CheckMessage2 : System.Web.UI.Page
{
    Feedback feedback = new Feedback();
    SystemTools systemtools = new SystemTools();
    Time time = new Time();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strVNum = Session["serverCode"].ToString();
        Session.Remove("VNum");
        ViewState["VNum"] = strVNum;
        string strResult = null;
        if (Request["Code"] == ViewState["VNum"].ToString())
        {
            string strPro = Request["products"].ToString();
            string strTel = Request["tel"].ToString();
            string strEmail = Request["email"].ToString();
            string strContent = Request["content"].ToString();


            string IP = Request.UserHostAddress;

            WebApp.Components.Submit submit = new WebApp.Components.Submit();
            int m = submit.InsertSubmitform("_产品："+strPro + "_电话："+strTel+"_邮箱："+strEmail+"_内容："+strContent+"_IP:" + IP, DateTime.Now.ToString());
            if (m > 0)
            {
                strResult = "success";
            }
        }
        else
        {
            strResult = "false";
        }
        Response.Write(strResult);
        Response.End();
    }
}
