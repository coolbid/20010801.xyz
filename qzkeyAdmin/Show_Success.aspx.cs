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

public partial class Manager_Show_Success : Basic.ManagerPage
{
    public string strMessage;
    public string strUrl;
    public string page;
    protected void Page_Load(object sender, EventArgs e)
    {
        strMessage = Request["message"];
        strUrl = Request["url"];
        page = Request["page"];
        if(strUrl.IndexOf("?") != (-1))
        {
            strUrl += "&page=" + page;
        }
        else
        {
            strUrl += "?page=" + page;
        }
    }
}

