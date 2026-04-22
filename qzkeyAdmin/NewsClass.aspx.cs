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
using System.IO;
using WebApp.Components;
using basic;

public partial class Manager_NewsClass : Basic.ManagerPage
{
    protected Basic.Model.ManagerInfo admin_info;

    BasicPage bp = new BasicPage();
    public string strFormState = null;
    public string strRole = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strRole = admin_info.Role;
            LoadList();
        }
    }
    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        ListItem li = new ListItem("顶级分类", "0");
        litlist.Text = "";

        int MTcount = 0;//执行遍历的次数
        //开始迭代加载
        MakeTr("0", MTcount);
    }
    /// <summary>
    /// 装配每一行
    /// </summary>
    /// <param name="id">上级ID</param>
    /// <param name="count">迭代次数</param>
    private void MakeTr(string id, int count)
    {
        string strLink = null;
        DataSet ds = bp.SelectDataBase("ColumnList", "select ColumnType,id,Role,IndexStatus,path,ColumnNo,ColumnUrlClient,ColumnName from ColumnList where parentid=" + id + " order by ColumnNo desc,id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            if (drv["ColumnType"].ToString() == "最终页面")
            {
                strLink = "<a href='About.aspx?Classid=" + drv["id"].ToString() + "'>点击发布内容</a>";
            }
            else if (drv["ColumnType"].ToString() == "联系方式")
            {
                strLink = "<a href='WebSiteSet.aspx'>点击发布内容</a>";
            }
            else if (drv["ColumnType"].ToString() == "图片新闻" || drv["ColumnType"].ToString() == "新闻列表" || drv["ColumnType"].ToString() == "图片列表" || drv["ColumnType"].ToString() == "图片相册" || drv["ColumnType"].ToString() == "下载中心")
            {
                strLink = "<a href='News.aspx?Classid=" + drv["id"].ToString() + "&ColumnType=" + drv["ColumnType"].ToString() + "'>点击进入管理</a>";
            }
            else if (drv["ColumnType"].ToString() == "产品列表")
            {
                strLink = "<a href='ProClass.aspx'>点击进入管理</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线留言")
            {
                strLink = "<a href='Message.aspx'>点击查看留言</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线表单")
            {
                strLink = "<a href='SubmitList.aspx'>点击查看信息</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线支付")
            {
                strLink = "<a href='PayMentInterface.aspx'>设置支付接口</a>";
            }
            else
            {
                strLink = "";
            }
            //形成表格
            litlist.Text += "<tr>";
            litlist.Text += "<td width='40'><input type='checkbox' id='chk_" + drv["id"].ToString() + "' name='chk_" + drv["id"].ToString() + "' value='" + drv["id"].ToString() + "' /></td>";
            litlist.Text += "<td width='40'>" + drv["id"].ToString() + "</td>";
            litlist.Text += "<td width='70'>" + ChangeRole(Int32.Parse(drv["Role"].ToString())) + "</td>";
            litlist.Text += "<td width='40'>" + ChangeIndexStatus(Int32.Parse(drv["IndexStatus"].ToString())) + "</td>";
            litlist.Text += "<td width='40'>" + ChangePic(drv["path"].ToString()) + "</td>";
            litlist.Text += "<td width='60'><input type='text' name='paixu_" + drv["id"].ToString() + "' value='" + drv["ColumnNo"].ToString() + "' id='paixu_" + drv["id"].ToString() + "' style='width:30px;'/></td>";
            litlist.Text += "<td width='100'>" + strLink + "</td>";
            litlist.Text += "<td width='140'><select name='select_" + drv["id"].ToString() + "' id='select_" + drv["id"].ToString() + "'>";
            litlist.Text += "<option value='--选择栏目类别--'>--选择栏目类别--</option>";
            litlist.Text += "<option value='网站首页'>网站首页</option>";
            litlist.Text += "<option value='一级分类'>一级分类</option>";
            litlist.Text += "<option value='二级分类'>二级分类</option>";
            litlist.Text += "<option value='联系方式'>联系方式</option>";
            litlist.Text += "<option value='最终页面'>最终页面</option>";
            litlist.Text += "<option value='新闻列表'>新闻列表</option>";
            litlist.Text += "<option value='下载中心'>下载中心</option>";
            litlist.Text += "<option value='图片相册'>图片相册</option>";
            litlist.Text += "<option value='图片列表'>图片列表</option>";
            litlist.Text += "<option value='产品列表'>产品列表</option>";
            litlist.Text += "<option value='在线留言'>在线留言</option>";
            litlist.Text += "<option value='图片新闻'>图片新闻</option>";
            if (strFormState == "1")
            {
                litlist.Text += "<option value='在线表单'>在线表单</option>";
            }
            litlist.Text += "</select><input type='hidden' name='hidden_" + drv["id"].ToString() + "' id='hidden_" + drv["id"].ToString() + "' value='" + drv["ColumnType"].ToString() + "' /></td>";
            litlist.Text += "<td width='210'>" + MakeFelgefu(count) + "<input type='text' id='txt_" + drv["id"].ToString() + "' name='txt_" + drv["id"].ToString() + "' value='" + drv["ColumnName"].ToString() + "' style='width:140px;' />" + "</td>";
            litlist.Text += "<td width='230'><input type='text' id='txturl_" + drv["id"].ToString() + "' name='txturl_" + drv["id"].ToString() + "' value='" + drv["ColumnUrlClient"].ToString() + "' style='width:220px;' /></td>";
            litlist.Text += "<td><a href='NewsClassEdit.aspx?id=" + drv["id"].ToString() + "'>[修改</a> | <a href='NewsClassNameDel.aspx?id=" + drv["id"].ToString() + "' onclick='javascript:return winconfirm();'>删除]</a></td>";
            litlist.Text += "</tr>";

            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["ColumnName"].ToString(), drv["id"].ToString());

            //再次遍历
            MakeTr(drv["id"].ToString(), count + 2);
        }
    }
    /// <summary>
    /// Make分隔符
    /// </summary>
    /// <param name="count"></param>
    /// <returns></returns>
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "";
        }
        else
        {
            Returnwords = ("├ ").PadLeft(count, '　');
        }
        return Returnwords;
    }
    protected string ChangeRole(int Role)
    {
        string strResult = null;
        if (Role == 0) { strResult = "管理员级"; }
        else if (Role == 1) { strResult = "<font color='red'>系统默认</font>"; }
        return strResult;
    }
    protected string ChangePic(string path)
    {
        string strPath = null;

        if (string.IsNullOrEmpty(path))
        {
            strPath = "<a href='../upload/default.jpg' target='_blank'><img src='../upload/nopiclan.png' alt='无缩略图' style='height:18px;width:18px;'  /></a>";
        }
        else
        {
            if (!File.Exists(Server.MapPath("../" + path)))
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/nopiclan.png' alt='无缩略图' style='height:18px;width:18px;'  /></a>";

            }
            else
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../" + path + "' alt='有缩略图' style='height:18px;width:18px;'  /></a>";
            }
        }
        return strPath;
    }
    protected string ChangeIndexStatus(int IndexStatus)
    {
        string strResult = null;
        if (IndexStatus == 0) { strResult = "<font color='red'>是</font>"; }
        else if (IndexStatus == 1) { strResult = "否"; }
        return strResult;
    }
}

