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

public partial class PicDetail : System.Web.UI.Page
{
    public int intID;
    public int intClassID;
    public BasicPage bp = new BasicPage();
    public string strTitle = null;//标题
    public string strPath = null;
    public string strVideoUrl = null;

    public string strParentColumnName = null;
    public string strParentColumnSubName = null;
    public string strColumnName = null;
    public string strContent = null;
    public string strColumnSubName = null;

    public int intPrevious;
    public int intNext;

    public MyClass mc = new MyClass();
    public string strPrevious = "没有了";
    public string strNext = "没有了";
    public string strUsername = "";
    public string strPLControl;
    public int state;
    public int status;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        if (systemtools.IsNumberic(Request["ID"]))
        {
            intID = Int32.Parse(Request["ID"]);
            //调用类
            Common common = new Common();
            strPLControl = domain.domainname.GetIndexConfigValue("PLControl");
            strUsername = Basic.Engine.CookieDo.GetCookie("webUserName", "str_key");
            if (strUsername == "" || strUsername == null)
            {
                strUsername = "游客";
            }
            showpinlun();
            //读取整站SEO的设置信息
            ClientSEO clientseo = common.showSEO();
            this.Title = clientseo.WebTitle;
            description.Attributes["content"] = clientseo.WebDescription;
            keywords.Attributes["content"] = clientseo.WebKeywords;
            //根据ID显示内容
            showContent();
        }
        else
        {
            Response.Write("您的请求带有不合法的参数，谢谢合作！");
            Response.End();
        }
    }
    public DataTable dtblNews = new DataTable();
    public int intNews;
    public void showNews(int classid, int top)
    {
        dtblNews = bp.SelectDataBase("news", "select top " + top + " * from news where classid=" + classid + " order by paixu desc,istop desc,convert(varchar(100),putdate,23) desc,id desc").Tables[0];
        intNews = dtblNews.Rows.Count;
    }


    public string strNewsPath = "";

    protected void showContent()
    {
        News news = new News();
        SqlDataReader reader = news.GetSingleNews(intID);
        if (reader.Read())
        {
            strNewsPath = reader["path"].ToString();
            strTitle = reader["Title"].ToString();
            //lblTitle.Text = reader["Title"].ToString();
            //lblPutdate.Text = reader["Putdate"].ToString();
            lblContent.Text = reader["Content"].ToString();
            strContent = reader["Content"].ToString();
            state = Int32.Parse(reader["state"].ToString());
            status = Int32.Parse(reader["status"].ToString());
            strPath = reader["path"].ToString();
            strVideoUrl = reader["Fujian"].ToString();
            intClassID = Int32.Parse(reader["ClassId"].ToString());
        }
        reader.Close();

        showPreviousAndNext(intID, intClassID);

        Common common = new Common();
        //显示栏目名称
        ClientColumnName clientcolumnname = new ClientColumnName();
        clientcolumnname = common.showColumnName(intClassID);
        strColumnName = clientcolumnname.ColumnName;
        strColumnSubName = clientcolumnname.ColumnSubName;
        //显示父级栏目名称
        ClientParentColumnName clientparentcolumnname = new ClientParentColumnName();
        clientparentcolumnname = common.showParentColumnName(intClassID);
        strParentColumnName = clientparentcolumnname.ParentColumnName;
        strParentColumnSubName = clientparentcolumnname.ParentColumnSubName;
    }
    public void showPreviousAndNext(int ID, int ClassID)
    {
        News news = new News();
        SqlDataReader reader = news.GetNews(ClassID);
        DataTable dtbl = SystemTools.ConvertDataReaderToDataTable(reader);
        DataSet dstNews = new DataSet();
        dstNews.Tables.Add(dtbl);

        intPrevious = ID;
        intNext = ID;
        for (int i = 0; i < dstNews.Tables[0].Rows.Count; i++)
        {
            if (intID == Int32.Parse(dstNews.Tables[0].Rows[i]["Id"].ToString()))
            {
                if (i >= 1)
                {
                    intNext = Int32.Parse(dstNews.Tables[0].Rows[i - 1]["Id"].ToString());
                    strNext = dstNews.Tables[0].Rows[i - 1]["Title"].ToString();
                }
                if (i < dstNews.Tables[0].Rows.Count - 1)
                {
                    intPrevious = Int32.Parse(dstNews.Tables[0].Rows[i + 1]["Id"].ToString());
                    strPrevious = dstNews.Tables[0].Rows[i + 1]["Title"].ToString();
                }
            }
        }
    }
    public DataTable dtpinlun = new DataTable();
    public int intpinlun;
    public int shown;
    private void showpinlun()
    {
        dtpinlun = bp.SelectDataBase("tbpinlun", "select  * from tbpinlun where Proid=" + intID + " order by convert(varchar(100),putdate,23) desc,id desc").Tables[0];
        intpinlun = dtpinlun.Rows.Count;
       if(intpinlun>6)
        {
            shown = 6;
        }
        else
        {
            shown = intpinlun;
        }
    }
}
