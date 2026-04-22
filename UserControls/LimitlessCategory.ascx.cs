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

public partial class LimitlessCategory : System.Web.UI.UserControl
{
    public BasicPage bp = new BasicPage();
    public string strlist = null;
    public string strStaticPage = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        showStaticPage();
        MakeProList("0");
        strlist = "d = new dTree('d');d.add(0,-1,'产品分类','');" + strlist + "document.write(d);";
    }
    /// <summary>
    /// 装配ProList
    /// </summary>
    /// <param name="id">上级ID</param>
    private void MakeProList(string id)
    {
        DataSet ds = bp.SelectDataBase("ProClass", "select id,context,parentid from ProClass where parentid=" + id + " order by id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            strlist = strlist + "d.add(" + drv["id"].ToString() + "," + drv["parentid"].ToString() + ",'" + drv["context"].ToString() + "','" + returnUrl(drv["id"].ToString(), strStaticPage) + "');";
            MakeProList(drv["id"].ToString());
        }
    }
    protected void showStaticPage()
    {
        SqlDataReader reader = bp.getRead("select StaticPage from ColumnList where ColumnType='产品列表'");
        if (reader.Read())
        {
            strStaticPage = reader["StaticPage"].ToString();
        }
        reader.Close();
    }
    protected string returnUrl(string ID, string StaticPage)
    {
        string strUrl = null;
        if (StaticPage == "0")
        {
            strUrl = "Product.aspx?ClassID=" + ID;
        }
        else
        {
            strUrl = "Product" + ID + "_1.html";
        }
        return strUrl;
    }
}
