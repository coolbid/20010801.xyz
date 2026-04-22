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
using System.Text;
using System.Text.RegularExpressions;
using basic;

public partial class Manager_WaterMark : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
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
    public string strImg;
    protected void showContent()
    {
        watermarktype.SelectedValue = domain.domainname.GetIndexConfigValue("watermarktype");
        watermarkposition.SelectedValue = domain.domainname.GetIndexConfigValue("watermarkposition");
        watermarkimgquality.Text = domain.domainname.GetIndexConfigValue("watermarkimgquality");
        watermarkpic.Text = domain.domainname.GetIndexConfigValue("watermarkpic");
        watermarktransparency.Text = domain.domainname.GetIndexConfigValue("watermarktransparency");
        watermarktext.Text = domain.domainname.GetIndexConfigValue("watermarktext");
        watermarkfont.SelectedValue = domain.domainname.GetIndexConfigValue("watermarkfont");
        watermarkfontsize.Text = domain.domainname.GetIndexConfigValue("watermarkfontsize");
        strImg = domain.domainname.GetIndexConfigValue("watermarkpic");


    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strwatermarktype = watermarktype.SelectedValue;
        string strwatermarkposition = watermarkposition.SelectedValue;
        string strwatermarkimgquality = watermarkimgquality.Text;
        string strwatermarkpic = watermarkpic.Text;
        string strwatermarktransparency = watermarktransparency.Text;
        string strwatermarktext = watermarktext.Text;
        string strwatermarkfont = watermarkfont.SelectedValue;
        string strwatermarkfontsize = watermarkfontsize.Text;
        bool strresult1 = domain.domainname.SetIndexConfigValue("watermarktype", strwatermarktype);
        bool strresult2 = domain.domainname.SetIndexConfigValue("watermarkposition", strwatermarkposition);
        bool strresult3 = domain.domainname.SetIndexConfigValue("watermarkimgquality", strwatermarkimgquality);
        bool strresult4 = domain.domainname.SetIndexConfigValue("watermarkpic", strwatermarkpic);
        bool strresult5 = domain.domainname.SetIndexConfigValue("watermarktransparency", strwatermarktransparency);
        bool strresult6 = domain.domainname.SetIndexConfigValue("watermarktext", strwatermarktext);
        bool strresult7 = domain.domainname.SetIndexConfigValue("watermarkfont", strwatermarkfont);
        bool strresult8 = domain.domainname.SetIndexConfigValue("watermarkfontsize", strwatermarkfontsize);
        if (strresult1 && strresult2 && strresult3 && strresult4 && strresult5 && strresult6 && strresult7 && strresult8)
        {
            Response.Redirect("Show_Success.aspx?Message=水印配置成功！&Url=WaterMark.aspx");
        }
    }

    public string chkPic(string path)
    {
        string strPath = null;

        if (string.IsNullOrEmpty(path))
        {
            strPath = "<a href='../upload/default.jpg' target='_blank'><img src='../upload/default.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
        }
        else
        {
            if (!File.Exists(Server.MapPath("../" + path)))
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/zanwu.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";

            }
            else
            {
                if (path.ToLower().Contains(".jpg") || path.ToLower().Contains(".png") || path.ToLower().Contains(".gif"))
                {
                    strPath = "<a href='" + path + "' target='_blank'><img src='" + path + "' alt='有缩略图' style='height:28px;width:31px;border:1px solid #dadada;'  /></a>";
                }
                else
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/fujian.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
                }
            }
        }
        return strPath;
    }



}
