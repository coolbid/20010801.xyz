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

public partial class shopev_admin_products_print : Basic.ManagerPage
{
    basic.BasicPage bp = new basic.BasicPage();
    int intID;
    protected void Page_Load(object sender, EventArgs e)
    {
        intID = basic.Tools.RequestClass.GetQueryInt("id",0);
        showContent();
    }

    //显示信息
    protected void showContent()
    {
        SqlDataReader reader = bp.getRead("select * from tborder where id=" + intID);
        if (reader.Read())
        {
            Bianhao.Text = reader["bianhao"].ToString();
            txtName.Text = reader["Name"].ToString();
            txtdizhi.Text = reader["dizhi"].ToString();
            txtPhone.Text = reader["Phone"].ToString();
            txt_proprice.Text = "￥"+reader["jiage"].ToString();
            txt_message.Text = reader["Content"].ToString();
            txt_zhifutype.Text = reader["zhuangtai"].ToString();
            showPro(reader["bianhao"].ToString());
        }
        reader.Close();
    }

    //显示订单具体信息
    public DataTable dtPro = new DataTable();
    public int intPro;
    public void showPro(string id)
    {
        dtPro = bp.SelectDataBase("orderdetail", "select * from orderdetail where orderid='" + id + "'").Tables[0];
        intPro = dtPro.Rows.Count;
    }
    public bool IsNumberic(string oText)//判断是否是数字(包含小数)
    {
        try
        {
            Double var1 = System.Convert.ToDouble(oText);
            return true;
        }
        catch
        {
            return false;
        }
    }
}
