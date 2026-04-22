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
using WebApp.Components;
using System.Data.SqlClient;
using basic;

public partial class Link : System.Web.UI.UserControl
{
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    public int intClassID;
    public int intID;
    public int intTypeID;
    public int intProID;
    public string strParentColumnName = null;
    public string strParentColumnSubName = null;
    public string strColumnName = null;
    public string strColumnSubName = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        intClassID = basic.Tools.RequestClass.GetQueryInt("ClassID", 0);
        intID = basic.Tools.RequestClass.GetQueryInt("ID", 0);
        intTypeID = basic.Tools.RequestClass.GetQueryInt("TypeID", 0);
        intProID = basic.Tools.RequestClass.GetQueryInt("ProID", 0);
        Common common = new Common();

        if (intClassID > 0)
        {
            ClientColumnName clientcolumnname = new ClientColumnName();
            clientcolumnname = common.showColumnName(intClassID);
            strColumnName = clientcolumnname.ColumnName;
            strColumnSubName = clientcolumnname.ColumnSubName;
        }
        if (intID > 0)
        {
            intClassID = int.Parse(mc.ShowNewsKeyById(intID, "ClassId"));
            ClientColumnName clientcolumnname = new ClientColumnName();
            clientcolumnname = common.showColumnName(intClassID);
            strColumnName = clientcolumnname.ColumnName;
            strColumnSubName = clientcolumnname.ColumnSubName;
        }
        if (intTypeID > 0|| Request.Url.ToString().ToLower().Contains("/product"))
        {
            strColumnName = "产品分类";
            strColumnSubName = "Products";
        }
        if (intProID > 0)
        {
            strColumnName = "产品展示";
            strColumnSubName = "Product";
        }
    }
}

