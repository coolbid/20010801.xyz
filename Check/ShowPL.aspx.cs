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
using basic;
using WebApp.Components;
using System.Text;
using System.IO;

public partial class ShowPL : System.Web.UI.Page
{
    public BasicPage bp = new BasicPage();
    public int ClassID;
    public string strParentColumnName = null;
    public string strColumnName = "搜索结果";
    public string KeyName = "";
    public string strPath = null;
    public SystemTools systemtools = new SystemTools();
    public bool IsIndex = false;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        page = basic.Tools.RequestClass.GetQueryInt("page", 1);
        ClassID = basic.Tools.RequestClass.GetQueryInt("Proid", 0);
        if (!Page.IsPostBack)
        {
            strsql = ComSQL(KeyName);
            orderby = "id desc";
            RptBind(strsql, orderby);
        }

    }

    #region 分页 绑定数据

    public string strsql, orderby;
    public DataSet dsNews = new DataSet();
    public int intNews;
    public int intTotalCount = 1;
    public int intUnm = 0;//共多少条记录
    public int page = 1;//第几页
    public int Num;//前多少页
    public int pageNum = 6;//每页的页数
    private void RptBind(string _strWhere, string _orderby)
    {
        Num = (page - 1) * pageNum;
        showpageNum();//总数
        intTotalCount = ShowintTotalCount(intUnm, pageNum);

        StringBuilder strSql1 = new StringBuilder();
        strSql1.Append("select top " + pageNum + " * from tbpinlun ");
        strSql1.Append(" where ");
        strSql1.Append(_strWhere);
        strSql1.Append(" and id not in ");
        strSql1.Append(" ( ");
        strSql1.Append(" select top " + Num + " id from tbpinlun ");
        strSql1.Append(" where  ");
        strSql1.Append(_strWhere);
        strSql1.Append(" order by ");
        strSql1.Append(_orderby);
        strSql1.Append(" ) ");
        strSql1.Append(" order by ");
        strSql1.Append(_orderby);

        dsNews = bp.SelectDataBase("tbpinlun", strSql1.ToString());
        intNews = dsNews.Tables[0].Rows.Count;

       
    }
    //总条数
    protected void showpageNum()
    {
        SqlDataReader myread = bp.getRead("select count(id) as CountId from tbpinlun where " + strsql);
        if (myread.Read())
        {
            intUnm = Convert.ToInt32(myread["CountId"].ToString());
        }
        myread.Close();
    }

    //计算一共多少页
    public int ShowintTotalCount(int Total, int PageSize)
    {
        if (Total % PageSize == 0)
        {
            return Total / PageSize;
        }
        else
        {
            return Total / PageSize + 1;
        }
    }
    //sql组合

    public string ComSQL(string KeyName)
    {
        StringBuilder strSql = new StringBuilder();
        strSql.Append("  Proid=" + ClassID);
        return strSql.ToString();
    }
    #endregion
}

