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
using basic;

public partial class CheckPassword : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    public string strUserName = "";
    public string strDescription = "no";
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserName = Basic.Engine.CookieDo.GetCookie("webUserName", "str_key");
        string oldPasswords = basic.Tools.RequestClass.GetQueryString("oldPasswords");
        string Passwords = basic.Tools.RequestClass.GetQueryString("Passwords");
        if(strUserName==""|| strUserName==null)
        {
            strDescription = "weideng";
        }
        SqlDataReader myreader = bp.getRead("select * from TbUser where UserName='"+ strUserName + "' and UserPassword='"+ oldPasswords + "'");
        if (myreader.Read())
        {
            if (bp.doExecute("update tbuser set UserPassword='" + Passwords + "' where UserName='" + strUserName + "' and UserPassword='" + oldPasswords + "'"))
            {
                strDescription = "ok";
                Basic.Engine.CookieDo.WriteCookie("webUserName", "str_key", strUserName, -150);
            }
        }
        else
        {
            strDescription = "cuowu";
        }
        myreader.Close();

        Response.Write(strDescription);
    }
}
