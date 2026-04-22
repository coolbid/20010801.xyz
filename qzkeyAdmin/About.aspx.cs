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

public partial class Manager_About : Basic.ManagerPage
{
    About about = new About();
    int ClassID;
    public string strColumnName = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        ClassID = Int32.Parse(Request["ClassID"]);
        if (!IsPostBack)
        {
            showColumnName();
            showContent();
        }
    }
    protected void showColumnName()
    {
        NewsClass newsclass = new NewsClass();
        SqlDataReader reader = newsclass.GetSingleColumnList(ClassID);
        if (reader.Read())
        {
            strColumnName = reader["ColumnName"].ToString();
        }
        reader.Close();
    }
    protected void showContent()
    {
        SqlDataReader reader = about.GetAbout(ClassID);
        if (reader.Read())
        {
            content.Value = reader["content"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveCick(object sender, EventArgs e)
    {
        int intRowCount = about.UpdateAbout(ClassID, content.Value, DateTime.Now.ToString());
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=保存成功！&Url=About.aspx?ClassID=" + ClassID + "");
        }
    }
}

