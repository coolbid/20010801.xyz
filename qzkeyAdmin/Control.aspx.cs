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
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using basic;

public partial class Manager_Control : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    Time time = new Time();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strRole = admin_info.Role;
        if (strRole == "1")
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            if (!IsPostBack)
            {
                showContent();
            }
        }
        else
        {
            Response.Write("<script>");
            Response.Write("alert('没有访问该文件的权限');parent.location.href='login.aspx'");
            Response.Write("</script>");
        }
    }
    protected void showContent()
    {
        VIPControl.SelectedValue = domain.domainname.GetIndexConfigValue("VIPControl");
        PLControl.SelectedValue = domain.domainname.GetIndexConfigValue("PLControl");
        txtbaiming.Text = domain.domainname.GetIndexConfigValue("domainn");
        txtpartner.Text = domain.domainname.GetIndexConfigValue("partner");
        txtkey.Text = domain.domainname.GetIndexConfigValue("key");
        ProControl.Text = domain.domainname.GetIndexConfigValue("ProControl");
        BUYControl.Text = domain.domainname.GetIndexConfigValue("BUYControl");
        LiuliangControl.Text = domain.domainname.GetIndexConfigValue("LiuliangControl");
        txtWxAppid.Text = domain.domainname.GetIndexConfigValue("WxAppid");
        txtWxAppsecret.Text = domain.domainname.GetIndexConfigValue("WxAppsecret");
        txtWxKey.Text = domain.domainname.GetIndexConfigValue("WxKey");
        txtWxMchid.Text = domain.domainname.GetIndexConfigValue("WxMchid");
        txtPayPal.Text = domain.domainname.GetIndexConfigValue("PayPal");
        txtHuiLv.Text = domain.domainname.GetIndexConfigValue("HuiLv");
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strVIPControl = VIPControl.SelectedValue;
        string strPLControl = PLControl.SelectedValue;
        string strDomainn = txtbaiming.Text;
        string strpartner = txtpartner.Text;
        string strkey = txtkey.Text;
        string strProControl = ProControl.Text;
        string strBUYControl = BUYControl.Text;
        string strLiuliangControl = LiuliangControl.Text;
        string strWxAppid = txtWxAppid.Text;
        string strWxAppsecret = txtWxAppsecret.Text;
        string strWxKey = txtWxKey.Text;
        string strWxMchid = txtWxMchid.Text;
        string strPayPa = txtPayPal.Text;
        string strHuiLv = txtHuiLv.Text;
        bool strresult1 = domain.domainname.SetIndexConfigValue("VIPControl", strVIPControl);
        bool strresult2 = domain.domainname.SetIndexConfigValue("PLControl", strPLControl);
        bool strresult3 = domain.domainname.SetIndexConfigValue("domainn", strDomainn);
        bool strresult4 = domain.domainname.SetIndexConfigValue("partner", strpartner);
        bool strresult5 = domain.domainname.SetIndexConfigValue("key", strkey);
        bool strresult6 = domain.domainname.SetIndexConfigValue("ProControl", strProControl);
        bool strresult7 = domain.domainname.SetIndexConfigValue("BUYControl", strBUYControl);
        bool strresult8 = domain.domainname.SetIndexConfigValue("LiuliangControl", strLiuliangControl);
        bool strresult9 = domain.domainname.SetIndexConfigValue("WxAppid", strWxAppid);
        bool strresult10 = domain.domainname.SetIndexConfigValue("WxAppsecret", strWxAppsecret);
        bool strresult11 = domain.domainname.SetIndexConfigValue("WxKey", strWxKey);
        bool strresult12 = domain.domainname.SetIndexConfigValue("WxMchid", strWxMchid);
        bool strresult13 = domain.domainname.SetIndexConfigValue("PayPal", strPayPa);
        bool strresult14 = domain.domainname.SetIndexConfigValue("HuiLv", strHuiLv);
        if (strresult1 && strresult2 && strresult3 && strresult4 && strresult5 && strresult6 && strresult7 && strresult8 && strresult9 && strresult10 && strresult11 && strresult12 && strresult13 && strresult14)
        {
            shuaxin();
            Response.Redirect("Show_Success.aspx?Message=网站配置成功！&Url=Control.aspx");
        }
    }

    protected void btnSaveClick1(object sender, EventArgs e)
    {
        DataSet dstMenu = bp.SelectDataBase("ColumnUrlClient", "select id,ColumnUrlClient from ColumnList");
        int intMenu = dstMenu.Tables[0].Rows.Count;

        for(int i = 0;i<intMenu;i++)
        {
            string strUrl = dstMenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString().ToLower();
            string strUrl1 = dstMenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString().ToLower();
            string id = dstMenu.Tables[0].Rows[i]["id"].ToString();
            strUrl = strUrl.Replace("default.aspx", "/home");
            strUrl = strUrl.Replace("about.aspx?classid=", "/about/");
            strUrl = strUrl.Replace("news.aspx?classid=", "/news/");
            strUrl = strUrl.Replace("newsdetail.aspx?id=", "/newsdetail/");
            strUrl = strUrl.Replace("piclist.aspx?classid=", "/piclist/");
            strUrl = strUrl.Replace("picdetail.aspx?id=", "/picdetail/");
            strUrl = strUrl.Replace("down.aspx?classid=", "/download/");
            strUrl = strUrl.Replace("downloaddetail.aspx?id=", "/downloaddetail/");
            strUrl = strUrl.Replace("picnews.aspx?classid=", "/picnews/");
            strUrl = strUrl.Replace("product.aspx", "/product");
            strUrl = strUrl.Replace("product.aspx?type=", "/product/");
            strUrl = strUrl.Replace("/product?type=", "/product/");
            strUrl = strUrl.Replace("prodetail.aspx?proid=", "/prodetail/");
            strUrl = strUrl.Replace("contact.aspx?classid=", "/contact/");
            strUrl = strUrl.Replace("photo.aspx?classid=", "/photo/");
            strUrl = strUrl.Replace("message.aspx?classid=", "/message/");
            
            bp.doExecute("update ColumnList set ColumnUrlClient='" + strUrl + "' where id='" + id+"'");
        }
        string result = "";
        string[] ppp = { "default.aspx",
            "About.aspx",
            "Contact.aspx",
            "Download.aspx",
            "DownloadDetail.aspx",
            "FillOrders.aspx",
            "login.aspx",
            "Message.aspx",
            "News.aspx",
            "NewsClass.aspx",
            "NewsDetail.aspx",
            "Pay.aspx",
            "Photo.aspx",
            "PicDetail.aspx",
            "PicList.aspx",
            "ProDetail.aspx",
            "Product.aspx",
            "ProSearch.aspx",
            "register.aspx",
            "ShoppingCart.aspx",
            "UserControls/Start.ascx",
            "UserControls/Head.ascx",
            "UserControls/Foot.ascx",
            "UserControls/BannerControl.ascx",
            "UserControls/Category.ascx",
            "UserControls/Contact.ascx",
            "UserControls/BannerControl.ascx",
            "UserControls/Left.ascx",
            "UserControls/LimitlessCategory.ascx",
            "UserControls/Link.ascx"
        };
        for (int z = 0; z < ppp.Length; z++)
        {
            try
            {
                string path = HttpContext.Current.Server.MapPath("/" + ppp[z]);
                Stream myStream = new FileStream(path, FileMode.Open);
                Encoding encode = System.Text.Encoding.Default;
                StreamReader myStreamReader = new StreamReader(myStream, encode);
                string strhtml = myStreamReader.ReadToEnd();
                //string stroutput = strhtml.Replace("&*itemId*&", "要替换的内容");

                strhtml = strhtml.Replace("src=\"js/", "src=\"/js/");
                strhtml = strhtml.Replace("href=\"css/", "href=\"/css/");
                strhtml = strhtml.Replace("href=\"CSS/", "href=\"/css/");
                strhtml = strhtml.Replace("src=\"images/", "src=\"/images/");
                strhtml = strhtml.Replace("src='images/", "src='/images/");
                strhtml = strhtml.Replace("src=\"upload/", "src=\"/upload/");
                strhtml = strhtml.Replace("src='upload/", "src='/upload/");
                strhtml = strhtml.Replace("url(images", "url(/images");
                strhtml = strhtml.Replace("url(\"images", "url(\"/images");
                strhtml = strhtml.Replace("url('images", "url('/images");
                strhtml = strhtml.Replace("src='Check", "src='/Check");
                strhtml = strhtml.Replace("src=\"Check", "src=\"/Check");
                strhtml = strhtml.Replace("url(\"upload", "url(\"/upload");
                strhtml = strhtml.Replace("url('upload", "url('/upload");
                strhtml = strhtml.Replace("url(upload", "url(/upload");
                strhtml = strhtml.Replace("\"Check/", "\"/Check/");
                strhtml = strhtml.Replace("src=\"<%=", "src=\"/<%=");
                string stroutput = "";

                Regex regex = new Regex("href=\"");//以$cjlovefl$分割
                string[] Spl = regex.Split(strhtml);
                if (Spl.Length > 0)
                {
                    stroutput = Spl[0].ToString();
                }
                for (int i = 1; i < Spl.Length; i++)
                {
                    string[] lian = Spl[i].Split('"');
                    for (int j = 0; j < lian.Length; j++)
                    {
                        if (j == 0)
                        {
                            string href = lian[j];
                            string href1 = lian[j];
                            Regex regex1 = new Regex("<%=");//以$cjlovefl$分割
                            string[] Spl1 = regex1.Split(href);
                            if (Spl1.Length > 1)
                            {
                                href = Spl1[0].ToLower() + "<%=" + Spl1[1];
                                href1 = Spl1[0].ToLower() + "<%=" + Spl1[1];
                            }
                            else
                            {
                                href = href.ToLower();
                                href1 = href1.ToLower();
                            }
                            href = href.Replace("default.aspx", "/home");
                            href = href.Replace("about.aspx?classid=", "/about/");
                            href = href.Replace("news.aspx?classid=", "/news/");
                            href = href.Replace("newsdetail.aspx?id=", "/newsdetail/");
                            href = href.Replace("piclist.aspx?classid=", "/piclist/");
                            href = href.Replace("picdetail.aspx?id=", "/picdetail/");
                            href = href.Replace("down.aspx?classid=", "/download/");
                            href = href.Replace("downloaddetail.aspx?id=", "/downloaddetail/");
                            href = href.Replace("picnews.aspx?classid=", "/picnews/");
                            href = href.Replace("product.aspx", "/product");
                            href = href.Replace("product.aspx?typeid=", "/product/");
                            href = href.Replace("/product?typeid=", "/product/");
                            href = href.Replace("prodetail.aspx?proid=", "/prodetail/");
                            href = href.Replace("contact.aspx?classid=", "/contact/");
                            href = href.Replace("photo.aspx?classid=", "/photo/");
                            href = href.Replace("message.aspx?classid=", "/message/");
                            if(href==href1)
                            {
                                href = lian[j];
                            }
                            stroutput += "href=\"";
                            stroutput += href;
                        }
                        else
                        {
                            stroutput += "\"";
                            stroutput += lian[j];
                        }
                    }
                }

                myStream.Seek(0, SeekOrigin.Begin);
                myStream.SetLength(0);


                StreamWriter sw = new StreamWriter(myStream, encode);
                sw.Write(stroutput);
                sw.Flush();
                sw.Close();
                myStream.Close();
            }
            catch(Exception ex)
            {
                result += "【"+ppp[z] + ex.Message.ToString()+"】";
            }
        }

        string[] ppp1 = { "News.aspx.cs",
            "App_Code/MyClass.cs",
            "ProDetail.aspx.cs",
            "PicList.aspx.cs"
        };
        for (int z = 0; z < ppp1.Length; z++)
        {
            try
            {
                string path = HttpContext.Current.Server.MapPath("/" + ppp1[z]);
                Stream myStream = new FileStream(path, FileMode.Open);
                Encoding encode = System.Text.Encoding.Default;
                StreamReader myStreamReader = new StreamReader(myStream, encode);
                string strhtml = myStreamReader.ReadToEnd();
                //string stroutput = strhtml.Replace("&*itemId*&", "要替换的内容");

                strhtml = strhtml.Replace("PicDetail.aspx?ID=", "/picdetail/");
                strhtml = strhtml.Replace("NewsDetail.aspx?ID=", "/newsdetail/");
                strhtml = strhtml.Replace("ProDetail.aspx?ProId=", "/prodetail/");
                strhtml = strhtml.Replace("DownloadDetail.aspx?ID=", "/downloaddetail/");

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
                result += "【" + ppp1[z] + ex.Message.ToString() + "】";
            }
        }


        if (result == "")
        {
            Response.Write("<script>alert('设置成功！');</script>");
        }
        else
        {
            Response.Write("<script>alert('"+ result + "');</script>");
        }
    }

    public void shuaxin()
    {
        try
        {
            string[] aaaa = { "/App_Code/AlipayConfig.cs",
            };
            for (int z = 0; z < aaaa.Length; z++)
            {
                string path = HttpContext.Current.Server.MapPath(aaaa[z]);
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
        }
        catch (Exception ex)
        {
            
        }
    }

}
