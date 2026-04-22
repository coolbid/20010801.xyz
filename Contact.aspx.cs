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

public partial class Contact2 : System.Web.UI.Page
{
    int intClassID;
    public string strParentColumnName = null;
    public string strParentColumnSubName = null;
    public string strColumnName = null;
    public string strColumnSubName = null;
    public string strPath = null;

    public string strCompanyName = null;
    public string strAddress = null;
    public string strPhone = null;
    public string strMobile = null;
    public string strEmail = null;
    public string strFax = null;
    public string strContact = null;
    public string strWebUrl = null;
    public string strQQ = null;
    public string strMap = null;
    public string strWeChat = null;
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
            //根据ClassID显示内容
            showContact();
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
    protected void showContact()
    {
        Common common = new Common();
        Contact contact = new Contact();
        contact = common.showContact();
        strCompanyName = contact.CompanyName;
        if (strCompanyName != "")
        {
            strCompanyName = "<li><strong style=\"font-size: 14px;\">" + strCompanyName + "</strong></li>";
        }
        strAddress = contact.Address;
        if (strAddress != "")
        {
            strAddress = "<li>Add：" + strAddress + "</li>";
        }
        strPhone = contact.Phone;
        if (strPhone != "")
        {
            strPhone = "<li>Whatsapp：" + strPhone + "</li>";
        }
        strMobile = contact.Mobile;
        if (strMobile != "")
        {
            strMobile = "<li>Phone：" + strMobile + "</li>";
        }
        strEmail = contact.Email;
        if (strEmail != "")
        {
            strEmail = "<li>Email：" + strEmail + "</li>";
        }
        strFax = contact.Fax;
        if (strFax != "")
        {
            strFax = "<li>Fax：" + strFax + "</li>";
        }
        strContact = contact.ContactName;
        if (strContact != "")
        {
            strContact = "<li>Contacts：" + strContact + "</li>";
        }
        strWebUrl = contact.WebUrl;
        if (strWebUrl != "")
        {
            strWebUrl = "<li>公司网站：" + strWebUrl + "</li>";
        }
        strQQ = contact.QQ;
        if (strQQ != "")
        {
            strQQ = "<li>QQ：" + strQQ + "</li>";
        }
        strWeChat = contact.WeChat;
        if (strWeChat != "")
        {
            strWeChat = "<li>WeChat：" + strWeChat + "</li>";
        }
        strMap = contact.Map;
        if (strMap != "")
        {
            strMap = "<li>" + strMap + "</li>";
        }

    }
}

