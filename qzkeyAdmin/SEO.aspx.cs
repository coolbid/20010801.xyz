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

public partial class Manager_SEO : Basic.ManagerPage
{
    SEO seo = new SEO();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        if (!IsPostBack)
        {
            showContent();
        }

    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = seo.GetSEO(intID);
        if (reader.Read())
        {
            txtTitle.Text = reader["webTitle"].ToString();
            txtDescription.Text = reader["webDescription"].ToString();
            txtKeywords.Text = reader["webKeywords"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = seo.UpdateSEO(intID, txtTitle.Text, txtDescription.Text, txtKeywords.Text.Replace("，", ","));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=网站SEO优化设置成功！&Url=SEO.aspx");
        }
    }
}

