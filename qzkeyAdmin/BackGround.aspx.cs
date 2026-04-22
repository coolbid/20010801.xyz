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
using System.IO;

public partial class Manager_BackGround : Basic.ManagerPage
{
    BackGround background = new BackGround();
    public string strpath = null;
    string strPicPath = null;
    string strFileName = null;
    public string strImg = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        btnReset.Attributes.Add("onclick", "return checkNull2()");
        btnSave3.Attributes.Add("onclick", "return checkNull3()");
        if (!IsPostBack)
        {
            showContent();
        }
    }
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = background.GetBackGround(intID);
        if (reader.Read())
        {
            strpath = reader["Path"].ToString();
            bgValue.Value = reader["Path"].ToString();
            txt_path.Text = reader["bgPath"].ToString();
            radlbgDisplayMode.SelectedValue = reader["bgDisplayMode"].ToString();
            radlbgState.SelectedValue = reader["bgState"].ToString();
            strImg = reader["bgPath"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intID = 1;
        string strState = "1";
        string strbgValue = bgValue.Value;
        strPicPath = txt_path.Text;
        string strbgState = "2";
        string strbgDisplayMode = "3";
        int intRowCount = background.UpdateBackGround(intID, strbgValue, strState, strbgState, strPicPath, strbgDisplayMode);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=网站背景设置成功！&Url=BackGround.aspx");
        }
    }
    protected void btnSaveClick3(object sender, EventArgs e)
    {
        int intID = 1;
        string strState = "1";
        string strbgValue = "";
        strPicPath = txt_path.Text;
        string strbgState = radlbgState.SelectedValue;
        string strbgDisplayMode = radlbgDisplayMode.SelectedValue;
        int intRowCount = background.UpdateBackGround(intID, strbgValue, strState, strbgState, strPicPath, strbgDisplayMode);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=网站背景设置成功！&Url=BackGround.aspx");
        }
    }
    protected void btnResetClick(object sender, EventArgs e)
    {
        int intID = 1;
        int intRowCount = background.DeleteBackGround(intID);
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=恢复默认背景成功！&url=BackGround.aspx");
        }
        else
        {
            Response.Redirect("Show_Error.aspx?message=操作失败，目前已经是默认的背景颜色！&url=BackGround.aspx");
        }
    }
}

