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
using domain;

public partial class _Default : System.Web.UI.Page
{
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    public string strCssPath = null;
    public domainname dn = new domainname();
    //个性化结束
    protected void Page_Load(object sender, EventArgs e)
    {
        //通用开始(无须修改)
        SystemTools systemtools = new SystemTools();
        systemtools.showTimeLimit();//判断网站是否到期
        Common common = new Common();
        ClientSEO clientseo = common.showSEO();
        this.Title =  "登录-" + mc.ShowWebsiteKeyById(1, "CompanyName");

        //通用结束
        dn.GetVipControl();
        dn.restrict();
    }
}

