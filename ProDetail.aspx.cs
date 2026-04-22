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
using System.Text.RegularExpressions;

public partial class ProDetail : System.Web.UI.Page
{
    public int intID;
    public string strParentColumnName = "";
    public string strColumnName = "Product";
    public MyClass mc = new MyClass();
    public string strProName;
    public string strProBianhao;
    public string strProChandi;
    public string strKeywords;
    public string strPutdate;
    public int intHits;
    public string strProPath;
    public string strProDescription;
    public string strProDescription1;
    public string strProDescription2;
    public BasicPage bp = new BasicPage();
    public string strPhone;
    public string strVipControl;
    public string strProKey="";
    public int intPrevious;
    public int intNext;
    public string strPrevious = "period";
    public string strNext = "period";
    public string strPreviousUrl = "#";
    public string strNextUrl = "#";
    public string strvip;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        if (systemtools.IsNumberic(Request["ProId"]))
        {
            intID = Int32.Parse(Request["ProId"]);
            strvip = domain.domainname.GetIndexConfigValue("ProControl");
            //根据ID显示内容
            showContent();
            //上一个产品，下一个产品
            showPreviousAndNext(intID);
            //调用类
            Common common = new Common();
            strVipControl = domain.domainname.GetIndexConfigValue("BUYControl");
            //读取整站SEO的设置信息
            ClientSEO clientseo = common.showSEO();
            this.Title = clientseo.WebTitle;
            description.Attributes["content"] = clientseo.WebDescription;
            keywords.Attributes["content"] = clientseo.WebKeywords;
            //联系方式
            Contact contact = new Contact();
            contact = common.showContact();
            strPhone = contact.Phone;

            showPro();
        }
        else
        {
            Response.Write("您的请求带有不合法的参数，谢谢合作！");
            Response.End();
        }
    }
    public string strPaths;
    public string[] ConImg = { "" };
    public string strProPrice = "";
    protected void showContent()
    {
        Products products = new Products();

        SqlDataReader reader = products.GetSingleProduct(intID);
        if (reader.Read())
        {
            strProName = reader["ProName"].ToString();
            strProBianhao = reader["ProBianhao"].ToString();
            strProChandi = reader["ProChandi"].ToString();
            strKeywords = reader["Keywords"].ToString();
            strPutdate = Convert.ToDateTime(reader["Putdate"].ToString()).ToString("yyyy-MM-dd");
            strProPath = reader["ProPath"].ToString();
            strProDescription = reader["ProDescription"].ToString();
            strProDescription1 = reader["ProDescription1"].ToString();
            strProDescription2 = reader["ProDescription2"].ToString();
            strProPrice = reader["ProPrice"].ToString();
            strPaths = reader["Paths"].ToString();
            strProKey = reader["prokeydescription"].ToString();
        }
        reader.Close();

        Regex regex = new Regex(" src=\"");//以$cjlovefl$分割
        string[] Spl = regex.Split(strPaths);
        int m = 0;
        for (int i = 0; i < Spl.Length; i++)
        {
            if (bp.SubString(Spl[i].ToString(), 1) == "/")
            {
                m++;
            }
        }
        ConImg = new string[m];
        m = 0;

        for (int i = 0; i < Spl.Length; i++)
        {
            if (bp.SubString(Spl[i].ToString(), 1) == "/")
            {
                ConImg[m] = Spl[i].Split('"')[0].ToString();
                m++;
            }
        }


        this.Title = strProName;
        if (strKeywords != "")
        {
            keywords.Attributes["content"] = strKeywords;
        }
    }

    public DataTable dtPro = new DataTable();
    public int intPro;
    private void showPro()
    {
        dtPro = bp.SelectDataBase("product", "select top 6 * from product order by paixu desc,proid desc").Tables[0];
        intPro = dtPro.Rows.Count;
    }

    public void showPreviousAndNext(int ID)
    {
        MyClass mc = new MyClass();
        Products products = new Products();
        SqlDataReader reader = products.GetAllProducts();
        DataTable dtbl = SystemTools.ConvertDataReaderToDataTable(reader);
        DataSet dstProducts = new DataSet();
        dstProducts.Tables.Add(dtbl);

        intPrevious = ID;
        intNext = ID;
        for (int i = 0; i < dstProducts.Tables[0].Rows.Count; i++)
        {
            if (intID == Int32.Parse(dstProducts.Tables[0].Rows[i]["ProId"].ToString()))
            {
                if (i >= 1)
                {
                    intNext = Int32.Parse(dstProducts.Tables[0].Rows[i - 1]["ProId"].ToString());
                    //strNext = dstProducts.Tables[0].Rows[i - 1]["ProName"].ToString();
                    strNext = "Previous product";
                    strNextUrl = "/prodetail/" + intNext;
                }
                if (i < dstProducts.Tables[0].Rows.Count - 1)
                {
                    intPrevious = Int32.Parse(dstProducts.Tables[0].Rows[i + 1]["ProId"].ToString());
                    //strPrevious = dstProducts.Tables[0].Rows[i + 1]["ProName"].ToString();
                    strPrevious = "Next product";
                    strPreviousUrl = "/prodetail/" + intPrevious;
                }
            }
        }
    }
    public bool IsNumberic(string oText)//判断是否是数字(包含小数)
    {
        try
        {
            Double var1 = System.Convert.ToDouble(oText);
            if (var1 > 0)
            {
                return true;
            }
            else {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
}
