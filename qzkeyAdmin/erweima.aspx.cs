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
using System.Text;
using System.IO;

public partial class erweima : System.Web.UI.Page
{
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    public string strCssPath = null;
    //个性化结束
    public string strUserName = "";
    public string openid = "";
    public string asd = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //通用开始(无须修改)
        SystemTools systemtools = new SystemTools();
        systemtools.showTimeLimit();//判断网站是否到期
        Common common = new Common();
        ClientSEO clientseo = common.showSEO();
        this.Title = clientseo.WebTitle;
        description.Attributes["content"] = clientseo.WebDescription;
        keywords.Attributes["content"] = clientseo.WebKeywords;
        //通用结束
       

    }
   
}

