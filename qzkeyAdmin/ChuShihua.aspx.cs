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
using System.IO;
using System.Text;

public partial class Manager_ChuShihua : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    public string strDataPath;
    protected Basic.Model.ManagerInfo admin_info;

    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strRole = admin_info.Role;
        if (strRole == "1")
        {
            button1.Attributes.Add("onclick", "return Checkbtn()");
            button2.Attributes.Add("onclick", "return Checkbtn()");
            button3.Attributes.Add("onclick", "return Checkbtn()");
            button4.Attributes.Add("onclick", "return Checkbtn()");
            button5.Attributes.Add("onclick", "return Checkbtn()");
            button6.Attributes.Add("onclick", "return Checkbtn()");
            button7.Attributes.Add("onclick", "return Checkbtn()");
            button8.Attributes.Add("onclick", "return Checkbtn()");
            button9.Attributes.Add("onclick", "return Checkbtn()");
            button10.Attributes.Add("onclick", "return Checkbtn()");
            button11.Attributes.Add("onclick", "return Checkbtn()");
            button12.Attributes.Add("onclick", "return Checkbtn()");
            button13.Attributes.Add("onclick", "return Checkbtn()");
            button14.Attributes.Add("onclick", "return Checkbtn()");
            button15.Attributes.Add("onclick", "return Checkbtn()");
        }
        else
        {
            Response.Write("<script>");
            Response.Write("alert('没有访问该文件的权限');parent.location.href='default.aspx'");
            Response.Write("</script>");
        }
    }
    //技术支持
    protected void button1_click(object s, EventArgs e)
    {
        bp.doExecute("update TbSupport set StateManage='0' where id=1");
        bp.doExecute("update TbSupport set State='1' where id=1");
        bp.doExecute("update TbSupport set SupportName='腾云网' where id=1");
        bp.doExecute("update TbSupport set Title='腾云网' where id=1");
        bp.doExecute("update TbSupport set WebSite='http://www.400301.com/' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //网站优化
    protected void button2_Click(object sender, EventArgs e)
    {
        bp.doExecute("update SEO set WebTitle='网站已开通，等待完善资料' where id=1");
        bp.doExecute("update SEO set WebDescription='这里是网站描述' where id=1");
        bp.doExecute("update SEO set WebKeywords='关键词,网站关键词' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //栏目优化
    protected void button3_Click(object sender, EventArgs e)
    {
        bp.doExecute("update ColumnList set ColumnTitle=''");
        bp.doExecute("update ColumnList set ColumnDescription=''");
        bp.doExecute("update ColumnList set ColumnKeywords=''");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //用户管理
    protected void button4_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from Admin where Role=0");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //嵌入代码
    protected void button5_Click(object sender, EventArgs e)
    {
        bp.doExecute("update TbCode set State='0' where id=1");
        bp.doExecute("update TbCode set Content='' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //客户留言
    protected void button6_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from Message");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //在线客服
    protected void button7_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbIM");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //一键初始化
    protected void button8_Click(object sender, EventArgs e)
    {
        bp.doExecute("update TbSupport set StateManage='0' where id=1");
        bp.doExecute("update TbSupport set State='1' where id=1");
        bp.doExecute("update TbSupport set SupportName='腾云网' where id=1");
        bp.doExecute("update TbSupport set Title='腾云网' where id=1");
        bp.doExecute("update TbSupport set WebSite='http://www.400301.com/' where id=1");
        bp.doExecute("update SEO set WebTitle='网站已开通，等待完善资料' where id=1");
        bp.doExecute("update SEO set WebDescription='这里是网站描述' where id=1");
        bp.doExecute("update SEO set WebKeywords='关键词,网站关键词' where id=1");
        bp.doExecute("update ColumnList set ColumnTitle=''");
        bp.doExecute("update ColumnList set ColumnDescription=''");
        bp.doExecute("update ColumnList set ColumnKeywords=''");
        bp.doExecute("delete from Admin where Role=0");
        bp.doExecute("update TbCode set State='0' where id=1");
        bp.doExecute("update TbCode set Content='' where id=1");
        bp.doExecute("delete from Message");
        bp.doExecute("delete from TbIM");
        //bp.doExecute("delete from TbLog");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }

    //操作日志
    protected void button9_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbLog");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }

    //会员账号
    protected void button10_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbUser");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }

    //订单系统
    protected void button11_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from Tborder");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }

    //评论系统
    protected void button12_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbPinlun");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }

    //在线表单
    protected void button13_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbFormContent");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //微信标识
    protected void button14_Click(object sender, EventArgs e)
    {
        bool strresult = domain.domainname.SetIndexConfigValue("openid", "");
        
        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
        
    }
    //功能控制
    protected void button15_Click(object sender, EventArgs e)
    {
        bool strresult1 = domain.domainname.SetIndexConfigValue("VIPControl", "0");
        bool strresult2 = domain.domainname.SetIndexConfigValue("PLControl", "0");
        bool strresult3 = domain.domainname.SetIndexConfigValue("domainn", "");
        bool strresult4 = domain.domainname.SetIndexConfigValue("partner", "");
        bool strresult5 = domain.domainname.SetIndexConfigValue("key", "");
        bool strresult6 = domain.domainname.SetIndexConfigValue("ProControl", "0");
        bool strresult7 = domain.domainname.SetIndexConfigValue("BUYControl", "0");
        if (strresult1 && strresult2 && strresult3 && strresult4 && strresult5 && strresult6 && strresult7)
        {
            shuaxin();
            Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
        }
    }
    //一件初始化
    protected void button16_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbLog");
        bp.doExecute("delete from TbUser");
        bp.doExecute("delete from Tborder");
        bp.doExecute("delete from TbPinlun");
        bp.doExecute("delete from TbFormContent");
        bool strresult = domain.domainname.SetIndexConfigValue("openid", "");
        bool strresult1 = domain.domainname.SetIndexConfigValue("VIPControl", "0");
        bool strresult2 = domain.domainname.SetIndexConfigValue("PLControl", "0");
        bool strresult3 = domain.domainname.SetIndexConfigValue("domainn", "");
        bool strresult4 = domain.domainname.SetIndexConfigValue("partner", "");
        bool strresult5 = domain.domainname.SetIndexConfigValue("key", "");
        bool strresult6 = domain.domainname.SetIndexConfigValue("ProControl", "0");
        bool strresult7 = domain.domainname.SetIndexConfigValue("BUYControl", "0");
        if (strresult&&strresult1 && strresult2 && strresult3 && strresult4 && strresult5 && strresult6 && strresult7)
        {
            shuaxin();
            Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
        }
    }
    public void shuaxin()
    {
        try
        {
            string path = HttpContext.Current.Server.MapPath("/App_Code/AlipayConfig.cs");
            Stream myStream = new FileStream(path, FileMode.Open);
            Encoding encode = System.Text.Encoding.Default;
            StreamReader myStreamReader = new StreamReader(myStream, encode);
            string strhtml = myStreamReader.ReadToEnd();
            string stroutput = strhtml;
            myStream.Seek(0, SeekOrigin.Begin);
            myStream.SetLength(0);
            StreamWriter sw = new StreamWriter(myStream, encode);
            sw.Write(stroutput);
            sw.Flush();
            sw.Close();
            myStream.Close();
        }
        catch (Exception ex)
        {

        }
    }
}

