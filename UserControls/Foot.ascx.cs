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

public partial class Foot : System.Web.UI.UserControl
{
    public string strCompanyName = null;
    public string strAddress = null;
    public string strContact = null;
    public string strPhone = null;
    public string strMobile = null;
    public string strEmail = null;
    public string strFax = null;
    public string strQQ = null;
    public string strICP = null;

    public string strPath;
    public string strState;
    public DataSet dstQQ = new DataSet();
    public int intQQ;
    public string strQQList = null;

    public string strContent;
    public string strCodeState;

    public string strWebKeywords;

    public string strSupportName;
    public string strTitle;
    public string strWebSite;
    public string strSupportState;
    public string strStateManage;

    public MyClass mc = new MyClass();
    public BasicPage bp = new BasicPage();
    public string LiuliangControl;
    protected void Page_Load(object sender, EventArgs e)
    {
        LiuliangControl = domain.domainname.GetIndexConfigValue("LiuliangControl");
        Common common = new Common();
        Contact contact = new Contact();
        contact = common.showContact();
        strCompanyName = contact.CompanyName;
        if (strCompanyName != "")
        {
            strCompanyName = strCompanyName + "&nbsp;&nbsp;";
        }
        strAddress = contact.Address;
        if (strAddress != "")
        {
            strAddress = "<p>  <i class=\"fa fa-map-marker fa-fw\"></i></span>&nbsp;&nbsp;Add: " + strAddress + "</p>";
        }
        strContact = contact.ContactName;
        if (strContact != "")
        {
            strContact = "<p style=\"\"><i class=\"fa fa-home fa-fw\"  aria-hidden=\"true\" ></i></span>&nbsp;&nbsp;Contact: " + strContact + "</p>";
        }
        strPhone = contact.Phone;
        if (strPhone != "")
        {
            strPhone = "<p> <i class=\"fa fa-phone\" aria-hidden=\"true\" style=\"margin-left:5px;\"></i></span>&nbsp;Phone: " + strPhone + "</p>";
        }
        strEmail = contact.Email;
        if (strEmail != "")
        {
            strEmail = "<p><i class=\"fa fa-envelope-o\" aria-hidden=\"true\" style=\"margin-left:5px;\"></i></span>&nbsp;Email: " + strEmail + "</p>";
        }
        strQQ = contact.QQ;
        if (strQQ != "")
        {
            strQQ = "业务QQ：" + strQQ + "&nbsp;&nbsp;";
        }
        strMobile = contact.Mobile;
        if (strMobile != "")
        {
            strMobile = "<p> <i class=\"fa fa-whatsapp\" aria-hidden=\"true\" style=\"margin-left:5px;\" ></i></span>&nbsp;Whatsapp: "+strMobile+"</p>";
        }
        strFax = contact.Fax;
        if (strFax != "")
        {
            strFax = "传真：" + strFax;
        }

        strICP = contact.ICP;
        if (strICP != "")
        {
            strICP = "备案号：<a href='http://www.beian.miit.gov.cn/' target=\"_blank\">" + strICP + "</a>";
        }
        ClientMusic clientmusic = new ClientMusic();
        clientmusic = common.showMusic();
        strPath = clientmusic.Path;
        strState = clientmusic.State;

        QQ qq = new QQ();
        SqlDataReader reader = qq.GetQQState();
        DataTable dtbl = SystemTools.ConvertDataReaderToDataTable(reader);
        dstQQ.Tables.Add(dtbl);
        intQQ = dstQQ.Tables[0].Rows.Count;

        for (int i = 0; i < intQQ; i++)
        {
            strQQList = strQQList + dstQQ.Tables[0].Rows[i]["qq"].ToString() + "|" + dstQQ.Tables[0].Rows[i]["name"].ToString() + ",";
        }
        if (intQQ > 0)
        {
            strQQList = strQQList.Substring(0, strQQList.Length - 1);
        }

        SetupCode setupcode = new SetupCode();
        setupcode = common.showSetupCode();

        strCodeState = setupcode.State;
        strContent = setupcode.Content;//显示第三方代码

        //显示SEO关键词
        ClientSEO clientseo = common.showSEO();
        strWebKeywords = clientseo.WebKeywords;

        //设置技术支持
        ClientSupport clientsupport = common.showSupport();
        strSupportName = clientsupport.SupportName;
        strTitle = clientsupport.Title;
        strWebSite = clientsupport.WebSite;
        strSupportState = clientsupport.State;
        strStateManage = clientsupport.StateManage;
        showLinks();
        showMenu();
    }


    public DataTable dtblNews = new DataTable();
    public int intNews;
    public void showNews(int classid, int top)
    {
        dtblNews = bp.SelectDataBase("news", "select top " + top + " * from news where classid=" + classid + " order by paixu desc,istop desc,convert(varchar(100),putdate,23) desc,id desc").Tables[0];
        intNews = dtblNews.Rows.Count;
    }

    public DataSet dstMenu = new DataSet();
    public int intMenu;
    private void showMenu()
    {
        dstMenu = bp.SelectDataBase("News", "select Id,ParentId,ColumnType,ColumnName,ColumnNo,ColumnUrlClient,ColumnStaticPage,StaticPage from ColumnList where ParentId=0 and IndexStatus=0 order by ColumnNo desc,Id asc");
        intMenu = dstMenu.Tables[0].Rows.Count;
    }
    public DataTable dtLink = new DataTable();
    public int intLink;
    private void showLinks()
    {
        dtLink = bp.SelectDataBase("News", "select top 30 title,url from Links order by id desc").Tables[0];
        intLink = dtLink.Rows.Count;
    }
}

