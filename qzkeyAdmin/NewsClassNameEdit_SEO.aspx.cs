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

public partial class Manager_NewsClassNameEdit_SEO : Basic.ManagerPage
{
    NewsClass newsclass = new NewsClass();
    int intID;
    public string strColumnName;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools system = new SystemTools();
        if (system.IsNumberic(Request["ID"]))
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            intID = Int32.Parse(Request["ID"]);
            if (!IsPostBack)
            {
                showContent();
            }
        }
    }
    protected void showContent()
    {
        SqlDataReader reader = newsclass.GetSingleColumnList(intID);
        if (reader.Read())
        {
            strColumnName = reader["ColumnName"].ToString();
            txtTitle.Text = reader["ColumnTitle"].ToString();
            txtDescription.Text = reader["ColumnDescription"].ToString();
            txtKeywords.Text = reader["ColumnKeywords"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intRowCount = newsclass.SetColumnSEO(intID, txtTitle.Text, txtDescription.Text, txtKeywords.Text);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=栏目SEO优化设置成功！&Url=NewsClassNameEdit_SEO.aspx?id=" + intID + "");
        }
    }
}

