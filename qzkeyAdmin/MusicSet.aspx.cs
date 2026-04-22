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

public partial class Manager_MusicSet : Basic.ManagerPage
{
    Music music = new Music();
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
        SqlDataReader reader = music.GetWebMusic(intID);
        if (reader.Read())
        {
            txtPath.Text = reader["Path"].ToString();
            radlState.SelectedValue = reader["State"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = music.UpdateWebMusic(intID, txtPath.Text.Trim(), radlState.SelectedValue);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=背景音乐设置成功！&Url=MusicSet.aspx");
        }
    }
}

