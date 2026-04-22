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
using basic;
using WebApp.Components;

public partial class CheckZhuXiao : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
       Basic.Engine.CookieDo.WriteCookie("webUserName", "str_key", "123", -150);
    }
}
