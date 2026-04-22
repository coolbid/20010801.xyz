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

public partial class Message2 : System.Web.UI.Page
{
    public int intClassID;
    public string strParentColumnName = null;
    public string strParentColumnSubName = null;
    public string strColumnName = null;
    public string strColumnSubName = null;
    public string strPath = null;
    int intRowCount;//用来记录总记录数

    public MyClass mc = new MyClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        if (systemtools.IsNumberic(Request["ClassID"]))
        {
            intClassID = Int32.Parse(Request["ClassID"]);
            //调用类
            Common common = new Common();
            //读取整站SEO的设置信息
            ClientSEO clientseo = common.showSEO();
            this.Title = clientseo.WebTitle;
            description.Attributes["content"] = clientseo.WebDescription;
            keywords.Attributes["content"] = clientseo.WebKeywords;
            //读取某个栏目的SEO设置信息
            ClientColumnSEO clientcolumnseo = common.showColumnSEO(intClassID);
            if (clientcolumnseo.ColumnTitle.Length > 0)
            {
                this.Title = clientcolumnseo.ColumnTitle;

            }
            if (clientcolumnseo.ColumnDescription.Length > 0)
            {
                description.Attributes["content"] = clientcolumnseo.ColumnDescription;
            }
            if (clientcolumnseo.ColumnKeywords.Length > 0)
            {
                keywords.Attributes["content"] = clientcolumnseo.ColumnKeywords;
            }
            //以上结束
            //显示栏目名称
            ClientColumnName clientcolumnname = new ClientColumnName();
            clientcolumnname = common.showColumnName(intClassID);
            strColumnName = clientcolumnname.ColumnName;
            strColumnSubName = clientcolumnname.ColumnSubName;
            //显示图片或者Flash
            strPath = clientcolumnname.Path;
            string strType = null;
            if (strPath.Length >= 3)
            {
                strType = strPath.Substring(strPath.Length - 3, 3);
            }
            string strLength = clientcolumnname.Length;
            string strWidth = clientcolumnname.Width;
            if (strType == "swf")
            {
                strPath = "<script type=\"text/javascript\">F_viewSwf('" + strWidth + "','" + strLength + "','transparent','transparent','" + strPath + "');</script>";
            }
            else
            {
                strPath = "<img src='" + clientcolumnname.Path + "' alt='' />"; //显示内页通栏图片
            }
            //显示父级栏目名称
            ClientParentColumnName clientparentcolumnname = new ClientParentColumnName();
            clientparentcolumnname = common.showParentColumnName(intClassID);
            strParentColumnName = clientparentcolumnname.ParentColumnName;
            strParentColumnSubName = clientparentcolumnname.ParentColumnSubName;
        }
    }
}
