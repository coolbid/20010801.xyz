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

public partial class Manager_LeiXing : Basic.ManagerPage
{
    Time time = new Time();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strRole = admin_info.Role;
        if (strRole == "1")
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            if (!IsPostBack)
            {
                showContent();
            }
        }
        else
        {
            Response.Write("<script>");
            Response.Write("alert('没有访问该文件的权限');parent.location.href='login.aspx'");
            Response.Write("</script>");
        }
    }
    protected void showContent()
    {
        DownloadFile.Text = domain.domainname.GetIndexConfigValue("DownloadFile");
        DownloadFileLength.Text = domain.domainname.GetIndexConfigValue("DownloadFileLength");
        PicManageFile.Text = domain.domainname.GetIndexConfigValue("PicManageFile");
        PicManageFileLength.Text = domain.domainname.GetIndexConfigValue("PicManageFileLength");
        BackGroundFile.Text = domain.domainname.GetIndexConfigValue("BackGroundFile");
        BackGroundFileLength.Text = domain.domainname.GetIndexConfigValue("BackGroundFileLength");
        NewsClassFile.Text = domain.domainname.GetIndexConfigValue("NewsClassFile");
        NewsClassFileLength.Text = domain.domainname.GetIndexConfigValue("NewsClassFileLength");
        NewsFile.Text = domain.domainname.GetIndexConfigValue("NewsFile");
        NewsFileLength.Text = domain.domainname.GetIndexConfigValue("NewsFileLength");
        ProClassFile.Text = domain.domainname.GetIndexConfigValue("ProClassFile");
        ProClassFileLength.Text = domain.domainname.GetIndexConfigValue("ProClassFileLength");
        ProductFile.Text = domain.domainname.GetIndexConfigValue("ProductFile");
        ProductFileLength.Text = domain.domainname.GetIndexConfigValue("ProductFileLength");
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strDownloadFile = DownloadFile.Text;
        string strDownloadFileLength = DownloadFileLength.Text;
        string strPicManageFile = PicManageFile.Text;
        string strPicManageFileLength = PicManageFileLength.Text;
        string strBackGroundFile = BackGroundFile.Text;
        string strBackGroundFileLength = BackGroundFileLength.Text;
        string strNewsClassFile = NewsClassFile.Text;
        string strNewsClassFileLength = NewsClassFileLength.Text;
        string strNewsFile = NewsFile.Text;
        string strNewsFileLength = NewsFileLength.Text;
        string strProClassFile = ProClassFile.Text;
        string strProClassFileLength = ProClassFileLength.Text;
        string strProductFile = ProductFile.Text;
        string strProductFileLength = ProductFileLength.Text;
        bool strresult1 = domain.domainname.SetIndexConfigValue("DownloadFile", strDownloadFile);
        bool strresult2 = domain.domainname.SetIndexConfigValue("DownloadFileLength", strDownloadFileLength);
        bool strresult3 = domain.domainname.SetIndexConfigValue("PicManageFile", strPicManageFile);
        bool strresult4 = domain.domainname.SetIndexConfigValue("PicManageFileLength", strPicManageFileLength);
        bool strresult5 = domain.domainname.SetIndexConfigValue("BackGroundFile", strBackGroundFile);
        bool strresult6 = domain.domainname.SetIndexConfigValue("BackGroundFileLength", strBackGroundFileLength);
        bool strresult7 = domain.domainname.SetIndexConfigValue("NewsClassFile", strNewsClassFile);
        bool strresult8 = domain.domainname.SetIndexConfigValue("NewsClassFileLength", strNewsClassFileLength);
        bool strresult9 = domain.domainname.SetIndexConfigValue("NewsFile", strNewsFile);
        bool strresult10 = domain.domainname.SetIndexConfigValue("NewsFileLength", strNewsFileLength);
        bool strresult11 = domain.domainname.SetIndexConfigValue("ProClassFile", strProClassFile);
        bool strresult12 = domain.domainname.SetIndexConfigValue("ProClassFileLength", strProClassFileLength);
        bool strresult13 = domain.domainname.SetIndexConfigValue("ProductFile", strProductFile);
        bool strresult14 = domain.domainname.SetIndexConfigValue("ProductFileLength", strProductFileLength);
        if (strresult1 && strresult2 && strresult3 && strresult4 && strresult5 && strresult6 && strresult7 && strresult8 && strresult9 && strresult10 && strresult11 && strresult12 && strresult13 && strresult14)
        {
            Response.Redirect("Show_Success.aspx?Message=网站配置成功！&Url=LeiXing.aspx");
        }
    }



}
