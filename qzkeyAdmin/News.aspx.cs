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

public partial class Manager_News : Basic.ManagerPage
{
    public int page;//页码，跳转用
    public int rowCount;//用来记录总记录数
    string strAction;
    public int intID;
    public int intClassID;
    DataSet dst = new DataSet();
    public String strColumnName = null;
    string strPicPath = null;
    string strPicPath2 = "";
    News news = new News();
    public string strImg = null;
    public string strFujian = null;
    public string strColumnType = null;
    string ColumnType = "";
    string strUserName = "";
    public string Pages;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        page = basic.Tools.RequestClass.GetQueryInt("page", 0);
        if (systemtools.IsNumberic(Request["ClassID"]))
        {
            btnSave.Attributes.Add("onclick", "return checkNull()");
            intClassID = Convert.ToInt16(Request["ClassID"]);
            ColumnType = Basic.Engine.Get.Table.ColumnList.ColumnType(intClassID);

            strColumnType = Request["ColumnType"];
            showColumnName();
            strAction = Request["Action"];

            if (strAction == "Add")
            {
                pnlList.Visible = false;
                pnlEdit.Visible = true;
                if (!IsPostBack)
                {
                    txtPutdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                }
                if (Request["ID"] != null)
                {
                    intID = Convert.ToInt16(Request["ID"]);
                    if (intID > 0)
                    {
                        if (!IsPostBack)
                        {
                            showContent();
                        }
                    }
                }
            }
            else
            {
                pnlList.Visible = true;
                pnlEdit.Visible = false;
                if (!IsPostBack)
                {
                    this.gvList.PageIndex = page;
                }
                GridViewFill();
            }
        }
    }
    protected void showColumnName()
    {
        NewsClass newsclass = new NewsClass();
        SqlDataReader reader = newsclass.GetSingleColumnList(intClassID);
        if (reader.Read())
        {
            strColumnName = reader["ColumnName"].ToString();
        }
        reader.Close();
    }
    private void GridViewFill()
    {
        SqlDataReader dr = news.GetNews(intClassID);
        DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
        dst.Tables.Add(dt);
        rowCount = dst.Tables[0].Rows.Count;
        if (rowCount > 0)
        {
            this.gvList.DataSource = dst.Tables[0].DefaultView;
            this.gvList.DataBind();
        }
        else
        {
            pnlList.Visible = false;
            pnlShow.Visible = true;
        }
    }
    protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        news.DeleteSingleNews(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        Response.Redirect("Show_Success.aspx?message=删除成功！&url=" + Server.UrlEncode("News.aspx?ClassId=" + intClassID + "&ColumnType=" + strColumnType));
    }
    protected void NavigateToPage(object sender, CommandEventArgs e)
    {
        //控制转页
        switch (e.CommandArgument.ToString())
        {
            case "First":
                this.gvList.PageIndex = 0;
                break;
            case "Prev":
                if (this.gvList.PageIndex > 0)
                    this.gvList.PageIndex -= 1;
                break;
            case "Next":
                if (this.gvList.PageIndex < (this.gvList.PageCount - 1))
                    this.gvList.PageIndex += 1;
                break;
            case "Last":
                this.gvList.PageIndex = this.gvList.PageCount - 1;
                break;
        }
        page = this.gvList.PageIndex;
        GridViewFill();
    }

    protected void GridView_DataBind(object sender, EventArgs e)
    {
        if (dst.Tables[0].Rows.Count > 0)
        {
            GridViewRow pagerRow = gvList.BottomPagerRow;
            //获取Label实例，显示页次信息
            Label lblCurrent = (Label)pagerRow.Cells[0].FindControl("lblPageCurrent");
            Label lblCount = (Label)pagerRow.Cells[0].FindControl("lblPageCount");
            Label lblRow = (Label)pagerRow.Cells[0].FindControl("lblPageRow");
            //获取按钮实例，为了控制其是否可用
            LinkButton btnFirstTem = (LinkButton)pagerRow.Cells[0].FindControl("btnFirst");
            LinkButton btnPrevTem = (LinkButton)pagerRow.Cells[0].FindControl("btnPrev");
            LinkButton btnNextTem = (LinkButton)pagerRow.Cells[0].FindControl("btnNext");
            LinkButton btnLastTem = (LinkButton)pagerRow.Cells[0].FindControl("btnLast");

            if (lblCurrent != null)
                lblCurrent.Text = (this.gvList.PageIndex + 1).ToString();
            if (lblCount != null)
            {
                lblCount.Text = this.gvList.PageCount.ToString();
                Pages = this.gvList.PageCount.ToString();
            }
            if (lblRow != null)
                lblRow.Text = rowCount.ToString();

            if (this.gvList.PageIndex == 0)
            {
                btnFirstTem.Enabled = false;
                btnPrevTem.Enabled = false;
                //只有一页，所有分页按钮不可用
                if (this.gvList.PageCount == 1)
                {
                    btnNextTem.Enabled = false;
                    btnLastTem.Enabled = false;
                }
            }
            else if (this.gvList.PageIndex == (this.gvList.PageCount - 1))
            {
                btnNextTem.Enabled = false;
                btnLastTem.Enabled = false;
            }
        }
    }
    protected void showContent()
    {
        SqlDataReader reader = news.GetSingleNews(intID);
        if (reader.Read())
        {
            if (reader["Istop"].ToString() == "1") { ckbIstop.Checked = true; }
            txtPaixu.Text = reader["Paixu"].ToString();
            txtTitle.Text = reader["title"].ToString();
            txtKeywords.Text = reader["Keywords"].ToString();
            txtPutdate.Text = reader["putdate"].ToString();
            fckKeyContent.Text = reader["KeyContent"].ToString();
            content.Value = reader["content"].ToString();
            txt_path.Text = reader["path"].ToString();
            txt_path1.Text = reader["fujian"].ToString();
            strFujian = reader["fujian"].ToString();
            strImg = reader["path"].ToString();
            txtUrl.Text = reader["url"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        int intPaixu = Int32.Parse(txtPaixu.Text);
        string strTitle = txtTitle.Text.Trim();
        string strPutdate = txtPutdate.Text.Trim();
        string strKeyContent = fckKeyContent.Text.Trim();
        string strContent = content.Value;
        string strKeywords = txtKeywords.Text;
        strPicPath = txt_path.Text;
    

        strPicPath2 = txt_path1.Text;


        string strUrl = txtUrl.Text;
      
            int intIstop = 0;
            if (ckbIstop.Checked) { intIstop = 1; }
            if (intID == 0)
            {
                int intIdentity = news.AddSingleNews(intClassID, intPaixu, strTitle, strUrl, strPicPath, strPicPath2, strKeyContent, strContent, strKeywords, strPutdate, intIstop);
                if (intIdentity > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=添加成功！&url=" + Server.UrlEncode("News.aspx?ClassId=" + intClassID + "&ColumnType=" + strColumnType)+ "&page=" + page);
                }
            }
            else
            {
                int intRowCount = news.UpdateSingleNews(intID, intPaixu, strTitle, strUrl, strPicPath, strPicPath2, strKeyContent, strContent, strKeywords, strPutdate, intIstop);
                if (intRowCount > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=修改成功！&url=" + Server.UrlEncode("News.aspx?ClassId=" + intClassID + "&ColumnType=" + strColumnType)+ "&page=" + page);
                }
            }
    
    }

    

    public string chkPic(string path)
    {
        string strPath = null;

        if (string.IsNullOrEmpty(path))
        {
            strPath = "<a href='../upload/default.jpg' target='_blank'><img src='../upload/default.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
        }
        else
        {
            if (!File.Exists(Server.MapPath("../" + path)))
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/zanwu.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";

            }
            else
            {
                if (path.ToLower().Contains(".jpg") || path.ToLower().Contains(".png") || path.ToLower().Contains(".gif"))
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../" + path + "' alt='有缩略图' style='height:28px;width:31px;border:1px solid #dadada;'  /></a>";
                }
                else
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/fujian.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
                }
            }
        }
        return strPath;
    }
    public string chkIstop(string Istop)
    {
        string strIstop = null;
        if (Istop == "0") { strIstop = "普通"; }
        else if (Istop == "1") { strIstop = "<font color='red'>置顶</font>"; }
        return strIstop;
    }
    public string changeUrl(string strColumnType, string ID)
    {
        string ReturnUrl = null;
        if (strColumnType == "新闻列表")
        {
            ReturnUrl = "NewsDetail.aspx?ID=" + ID + "";
        }
        else if (strColumnType == "图片列表")
        {
            ReturnUrl = "PicDetail.aspx?ID=" + ID + "";
        }
        else if (strColumnType == "下载中心")
        {
            ReturnUrl = "DownloadDetail.aspx?ID=" + ID + "";
        }
        return ReturnUrl;
    }
}

