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

public partial class Left : System.Web.UI.UserControl
{
    public BasicPage bp = new BasicPage(); 
    public int intClassID;
    int intID;
    int intTypeID;
    int intProId;

    public MyClass mc = new MyClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        intClassID = basic.Tools.RequestClass.GetQueryInt("ClassID", 0);
        intID = basic.Tools.RequestClass.GetQueryInt("ID", 0);
        intTypeID = basic.Tools.RequestClass.GetQueryInt("TypeID", 0);
        intProId = basic.Tools.RequestClass.GetQueryInt("ProId", 0);


         



        showContent();
    }

    public DataTable dtblNews = new DataTable();
    public int intNews;
    public void showNews(int classid, int top)
    {
        dtblNews = bp.SelectDataBase("news", "select top " + top + " * from news where classid=" + classid + " order by paixu desc,istop desc,convert(varchar(100),putdate,23) desc,id desc").Tables[0];
        intNews = dtblNews.Rows.Count;
    }

    public DataTable dstCol = new DataTable();
    public int intCol = 0;
    protected void showCol(int id)
    {
        dstCol = bp.SelectDataBase("news", "select * from Columnlist where parentid=" + id + " order by ColumnNo desc,id asc").Tables[0];
        intCol = dstCol.Rows.Count;
    }


    public DataTable dstCol2 = new DataTable();
    public int intCol2 = 0;
    protected void showCol2(int id)
    {
        dstCol2 = bp.SelectDataBase("news", "select * from Columnlist where parentid=" + id + " order by ColumnNo desc,id asc").Tables[0];
        intCol2 = dstCol2.Rows.Count;
    }

    //子栏目
    public int intColumnList;
    public DataSet dsSubmenu = new DataSet();
    public string strColumnName;
    public string strColumnSubName;
    protected void ShowSubmenu(int CLASSID)
    {
        dsSubmenu = mc.SelectAllSubMenu(CLASSID);
        intColumnList = dsSubmenu.Tables[0].Rows.Count;

        if (intColumnList > 0)
        {
            //父级栏目名称
            SqlDataReader myreader = bp.getRead("select ColumnName,ColumnSubName from ColumnList where ID = (select ParentId from ColumnList where ID=" + CLASSID + ")");
            if (myreader.Read())
            {
                strColumnName = myreader["ColumnName"].ToString();
                strColumnSubName = myreader["ColumnSubName"].ToString();
            }
            myreader.Close();
        }
        else
        {
            //父级栏目名称
            SqlDataReader myreader = bp.getRead("select ColumnName,ColumnSubName from ColumnList where ID = " + CLASSID);
            if (myreader.Read())
            {
                strColumnName = myreader["ColumnName"].ToString();
                strColumnSubName = myreader["ColumnSubName"].ToString();
            }
            myreader.Close();
        }

    }
    //产品分类
    public DataSet dst = new DataSet();
    public int intCount = 0;
    protected void showContent()
    {
        dst = bp.SelectDataBase("ProClass", "select * from ProClass where ParentId=0  order by Paixu desc,Id asc");
        intCount = dst.Tables[0].Rows.Count;
         
    }
    public DataSet dstSub = new DataSet();
    public int intCountSub = 0;
    protected void showContentSub(int Id)
    {
        dstSub = bp.SelectDataBase("ProClass", "select * from ProClass where ParentId=" + Id + " order by Paixu desc,Id asc");
        intCountSub = dstSub.Tables[0].Rows.Count;
    }

    public DataSet dstSub2 = new DataSet();
    public int intCountSub2 = 0;
    protected void showContentSub2(int Id)
    {
        dstSub2 = bp.SelectDataBase("ProClass", "select * from ProClass where ParentId=" + Id + "  order by Paixu desc,Id asc");
        intCountSub2 = dstSub2.Tables[0].Rows.Count;
    }

    public string strCompanyName = null;
    public string strAddress = null;
    public string strContact = null;
    public string strPhone = null;
    public string strMobile = null;
    public string strEmail = null;
    public string strFax = null;
    public string strQQ = null;
    public string strICP = null;
    protected void showContact()
    {
        Common common = new Common();
        Contact contact = new Contact();
        contact = common.showContact();
        strCompanyName = contact.CompanyName;
        if (strCompanyName != "")
        {
            strCompanyName = "<p>" + strCompanyName + "</p>";
        }
        strAddress = contact.Address;
        if (strAddress != "")
        {
            strAddress = "<p>地址：" + strAddress + "</p>";
        }
        strPhone = contact.Phone;
        if (strPhone != "")
        {
            strPhone = "<p>电话：" + strPhone + "</p>";
        }
        strMobile = contact.Mobile;
        if (strMobile != "")
        {
            strMobile = "<p>手机：" + strMobile + "</p>";
        }
        strEmail = contact.Email;
        if (strEmail != "")
        {
            strEmail = "<p>Email：" + strEmail + "</p>";
        }
        strFax = contact.Fax;
        if (strFax != "")
        {
            strFax = "<p>传真：" + strFax + "</p>";
        }
        strContact = contact.ContactName;
        if (strContact != "")
        {
            strContact = "<p  style=\"padding-top:25px;\" >联系人：" + strContact + "</p>";
        }
        strQQ = contact.QQ;
        if (strQQ != "")
        {
            strQQ = "<p>QQ：" + strQQ + "</p>";
        }
    }
}

