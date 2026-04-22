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

public partial class CheckUserName : System.Web.UI.Page
{
    string strSql = null;
    string strKeyName = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        strKeyName = Request["Value"];
        if (systemtools.ProcessSqlStr(strKeyName))
        {
            if (Request["Type"] == "spanUserName")
            {
                strSql = "select UserName from TbUser where UserName='" + strKeyName + "'";
            }
            else if (Request["Type"] == "spanUserPhone")
            {
                strSql = "select UserPhone from TbUser where UserPhone='" + strKeyName + "'";
            }
            else if (Request["Type"] == "spanUserEmail")
            {
                strSql = "select UserEmail from TbUser where UserEmail='" + strKeyName + "'";
            }
            else if (Request["Type"] == "spanUserQQ")
            {
                strSql = "select UserQQ from TbUser where UserQQ='" + strKeyName + "'";
            }
            Response.Write(readAgentUser());
            Response.End();
        }
        else
        {
            Response.Write("您的请求带有不合法的参数，谢谢合作！");
            Response.End();
        }
    }
    protected string readAgentUser()
    {
        BasicPage bp = new BasicPage();
        string strReturnValue = "false";
        SqlDataReader myreader = bp.getRead(strSql);
        if (myreader.Read())
        {
            strReturnValue = "true";
        }
        myreader.Close();
        return strReturnValue;
    }
}
