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

public partial class Manager_WebSiteSet : Basic.ManagerPage
{
    WebSite website = new WebSite();
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
        SqlDataReader reader = website.GetWesSite(intID);
        if (reader.Read())
        {
            txtICP.Text = reader["ICP"].ToString();
            txtWebUrl.Text = reader["WebUrl"].ToString();
            txtCompanyName.Text = reader["CompanyName"].ToString();
            txtAddress.Text = reader["Address"].ToString();
            txtPhone.Text = reader["Phone"].ToString();
            txtMobile.Text = reader["Mobile"].ToString();
            txtEmail.Text = reader["Email"].ToString();
            txtFax.Text = reader["Fax"].ToString();
            txtContact.Text = reader["Contact"].ToString();
            txtQQ.Text = reader["QQ"].ToString();
            content.Value = reader["Map"].ToString();
            txtWeChat.Text = reader["WeChat"].ToString();
            txtZip.Text = reader["Zip"].ToString();
            txtopenid.Text = domain.domainname.GetIndexConfigValue("openid");
            if (reader["NameState"].ToString() == "1")
            {
                chkNameState.Checked = true;
            }
            else
            {
                chkNameState.Checked = false;
            }
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strMap = content.Value;
        string strNameState = "0";
        if (chkNameState.Checked == true)
        {
            strNameState = "1";
        }
        int intID = 1;
        string stropenid = txtopenid.Text;
        bool strresult1 = domain.domainname.SetIndexConfigValue("openid", stropenid);
        int intRowCount = website.UpdateWesSite(intID, txtICP.Text.Trim(), txtWebUrl.Text.Trim(), txtCompanyName.Text.Trim(), strNameState, txtAddress.Text.Trim(), txtPhone.Text.Trim(), txtMobile.Text.Trim(), txtEmail.Text.Trim(), txtFax.Text.Trim(), txtContact.Text.Trim(), txtQQ.Text.Trim(), strMap, txtWeChat.Text.Trim(), txtZip.Text.Trim());
        if (intRowCount > 0&& strresult1)
        {
            Response.Redirect("Show_Success.aspx?Message=网站基本信息设置成功！&Url=WebSiteSet.aspx");
        }
    }
}

