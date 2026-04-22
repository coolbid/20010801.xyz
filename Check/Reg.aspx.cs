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

public partial class Reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Common common = new Common();
        //¶ÁÈ¡ÑùÊ½
        ClientSkin clientskin = common.showSkin();
        HtmlLink cssLink = new HtmlLink();
        cssLink.Href = clientskin.StylePath;
        cssLink.Attributes.Add("rel", "stylesheet");
        cssLink.Attributes.Add("type", "text/css");
        Page.Header.Controls.Add(cssLink);
    }
}
