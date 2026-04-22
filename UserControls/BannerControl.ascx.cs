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

public partial class BannerControl : System.Web.UI.UserControl
{
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        showPicList();//轮显图片
    }
    public DataSet dstPicList = new DataSet();
    public int intPicListRowCount;
    protected void showPicList()
    {
        dstPicList = bp.SelectDataBase("TbPic", "select * from TbPic where ClassID=3 order by paixu desc,putdate desc,id desc");
        intPicListRowCount = dstPicList.Tables[0].Rows.Count;
    }
}
