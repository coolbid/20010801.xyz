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

public partial class Manager_ProClassNameDel : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    int intID;
    ProClass proclass = new ProClass();
    Products products = new Products();
    string strUserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools system = new SystemTools();
        strUserName = Basic.Engine.CookieDo.GetCookie("UserID", "str_key"); //解密用户名
        intID = Int32.Parse(Request["ID"]);
        if (!IsPostBack)
        {
            DelNewsClass();
        }
    }
    private void DelNewsClass()
    {

        SqlDataReader reader = proclass.GetProClassSub(intID);
        if (reader.Read())
        {
            reader.Close();
            Response.Redirect("Show_Error.aspx?message=删除失败，先删除其子栏目！&url=ProClass.aspx");
        }
        else
        {
            reader.Close();
            int intRowCount = proclass.DeleteSingleProClass(intID);
            if (intRowCount > 0)
            {
                string strClassID = "," + intID + ",";


                Log log = new Log();
                log.AddSingleLog(DateTime.Now.ToString(), Request.UserHostAddress, strUserName, "删除产品分类-Id：" + intID);
                
                int intRowCount2 = products.DeleteLikeProduct(strClassID);
                Response.Redirect("Show_Success.aspx?message=删除成功！&url=ProClass.aspx");
            }
        }
    }
}

