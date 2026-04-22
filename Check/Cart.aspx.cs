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

public partial class Cart : System.Web.UI.Page
{
    BasicPage bp = new BasicPage();
    public string Action;
    public int intID;
    public string Mac;
    protected void Page_Load(object sender, EventArgs e)
    {
        intID = basic.Tools.RequestClass.GetQueryInt("Proid",0);
        Action = basic.Tools.RequestClass.GetQueryString("Action");
        Mac = basic.Tools.RequestClass.getLocalMac();//获取物理地址

        switch (Action)
        {
            case "add":
                Addcart();//加入购物车
                break;
            case "jian"://-
                jian();
                break;
            case "jia"://+
                jia();
                break;
            case "Del"://×
                Del();
                break;
            case "Change"://输入改变
                Change();
                break;
            case "Empty"://清空购物车
                Empty();
                break;
        }
    }
    //加入购物车
    private void Addcart()
    {
        if (cunzai())
        {
            if (bp.doExecute("update Shoppingcart set number=number+1 where Proid=" + intID + " and Mac='" + Mac + "'"))
            {
                Response.Write("true");
            }
        }
        else
        {
            if (bp.doExecute("insert into Shoppingcart(Proid,Mac,number) values('" + intID + "','" + Mac + "','1')"))
            {
                Response.Write("true");
            }
        }
    }

    //-
    private void jian()
    {
        if (bp.doExecute("update Shoppingcart set number=number-1 where Proid=" + intID + " and Mac='" + Mac + "'"))
        {
            Response.Write("true");
        }
    }

    //+
    private void jia()
    {
        if (bp.doExecute("update Shoppingcart set number=number+1 where Proid=" + intID + " and Mac='" + Mac + "'"))
        {
            Response.Write("true");
        }
    }

    //×
    private void Del()
    {
        if (bp.doExecute("delete Shoppingcart where Proid=" + intID + " and Mac='" + Mac + "'"))
        {
            Response.Write("true");
        }
    }

    //输入改变
    private void Change()
    {
        int number = basic.Tools.RequestClass.GetQueryInt("number", 1);
        if (bp.doExecute("update Shoppingcart set number="+ number + " where Proid=" + intID + " and Mac='" + Mac + "'"))
        {
            Response.Write("true");
        }

    }


    //清空购物车
    private void Empty()
    {
        if (bp.doExecute("delete Shoppingcart where  Mac='" + Mac + "'"))
        {
            Response.Write("true");
        }
    }

    //判断当前Proid和Mac是否存在于购物车表中
    private bool cunzai()
    {
        SqlDataReader myread = bp.getRead("select id from shoppingcart where Proid=" + intID+" and Mac='"+Mac+"'");
        if (myread.Read())
        {
            return true;
        }
        else
        {
            return false;
        }
        myread.Close();
    }
 }
