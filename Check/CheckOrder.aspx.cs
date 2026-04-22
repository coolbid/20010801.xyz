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

public partial class CheckOrder : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    public string strUserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserName = Basic.Engine.CookieDo.GetCookie("webUserName", "str_key");
        if(strUserName==""|| strUserName==null)
        {
            strUserName = "游客";
        }
        string name = basic.Tools.RequestClass.GetQueryString("name");
        string Phone = basic.Tools.RequestClass.GetQueryString("Tel");
        string Address = basic.Tools.RequestClass.GetQueryString("Address");
        string Price = basic.Tools.RequestClass.GetQueryString("Price");
        string Content = basic.Tools.RequestClass.GetQueryString("Content");
        string OrderId = "TY" + DateTime.Now.ToString("yyyyMMddHHmmss")+ getRandrom(3);
        string Mac = basic.Tools.RequestClass.getLocalMac();//获取本机物理地址
        if (bp.doExecute("insert into tborder(bianhao,jiage,Name,Phone,dizhi,Content,usename,putdate,zhuangtai) values('" + OrderId + "','" + Price + "','" + name + "','" + Phone + "','" + Address + "','" + Content + "','" + strUserName + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + "未付款" + "')"))
        {

            if (bp.doExecute("insert into OrderDetail(Orderid,Proid,ProName,ProPrice,ProPath,ProNumber) select '" + OrderId + "' as Orderid,shoppingcart.Proid,ProName,ProPrice,ProPath,number from Shoppingcart full join Product on Shoppingcart.Proid=Product.Proid where Mac='" + Mac + "'"))
            {
                bp.doExecute("delete Shoppingcart where Mac ='" + Mac + "'");
                Response.Write(OrderId);
            }
            else
            {
                Response.Write("error");
            }
        }
        else
        {
            Response.Write("error");
        }
    }

    protected string getRandrom(int num)
    {

        string chars = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ";


        Random randrom = new Random((int)DateTime.Now.Ticks);

        string str = "";
        for (int i = 0; i < num; i++)
        {
            str += chars[randrom.Next(chars.Length)];
        }

        return str;

    }
}
