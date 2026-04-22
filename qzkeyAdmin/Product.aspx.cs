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
using System.IO;
using WebApp.Components;
using System.Text;

public partial class Manager_Product : Basic.ManagerPage
{
    public int page;//页码，跳转用
    BasicPage bp = new BasicPage();
    Products products = new Products();
    public int rowCount;//用来记录总记录数
    string strAction;
    public int intID;
    public int intClassID;
    public string strClassID = null;
    public string strClassID2 = null;
    DataSet dst = new DataSet();
    string filename;
    string strPicPath = null;
    public string strList = null;
    string strUrl;//记录返回地址
    public string strvip;
    protected void Page_Load(object sender, EventArgs e)
    {
        page = basic.Tools.RequestClass.GetQueryInt("page", 0);
        SystemTools systemtools = new SystemTools();
        btnSave.Attributes.Add("onclick", "return checkNull()");
        strvip = domain.domainname.GetIndexConfigValue("ProControl");
        if (Request["ClassID"] != null && Request["ClassID"] != "0" && systemtools.IsNumberic(Request["ClassID"]))
        {
            intClassID = Convert.ToInt16(Request["ClassID"]);
            strClassID = "," + intClassID + ",";
            strUrl = "Product.aspx?ClassId=" + intClassID + "";
        }
        else
        {
            strUrl = "Product.aspx";
        }
        if (Request["Action"] != null)
        {
            strAction = Request["Action"];
        }
        if (strAction == "Add")
        {
            if (!IsPostBack)
            {
                LoadList();//显示所有分类列表
            }
            pnlList.Visible = false;
            pnlEdit.Visible = true;
            if (Request["ID"] != null && systemtools.IsNumberic(Request["ID"]))
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
            if (!IsPostBack)
            {
                this.gvList.PageIndex = page;
            }
            pnlList.Visible = true;
            pnlEdit.Visible = false;
            GridViewFill();
        }

    }

    private void GridViewFill()
    {
        SqlDataReader dr = products.GetProducts(strClassID);
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
        int intRowCount = products.DeleteSingleProduct(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=" + strUrl + "");
        }
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
    public string Pages;
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
        SqlDataReader reader = products.GetSingleProduct(intID);
        if (reader.Read())
        {
            strClassID2 = reader["ClassId"].ToString();//分类列表
            txtPaixu.Text = reader["Paixu"].ToString();
            txtProName.Text = reader["ProName"].ToString();
            if (reader["State"].ToString() == "1") { chkState.Checked = true; }
            txtProBianhao.Text = reader["ProBianhao"].ToString();
            txtProChandi.Text = reader["ProChandi"].ToString();
            txtProPrice.Text = reader["ProPrice"].ToString();
            txtKeywords.Text = reader["Keywords"].ToString();
            txt_path.Text = reader["ProPath"].ToString();
            fckProDescription.Value = reader["ProDescription"].ToString();
            fckProKeyDescription.Text = reader["ProKeyDescription"].ToString();
            Textarea1.Value = reader["Paths"].ToString();
            Textarea2.Value = reader["ProDescription1"].ToString();
            Textarea3.Value = reader["ProDescription2"].ToString();
        }
        reader.Close();
    }

    protected void btnSaveClick(object s, EventArgs e)
    {
        strPicPath = txt_path.Text;
     
            string strClassIdList = null;
            strClassIdList = fenlei.Value;
            int intPaixu = Int32.Parse(txtPaixu.Text);
            string strProName = txtProName.Text;
            string strProBianhao = txtProBianhao.Text;
            string strProChandi = txtProChandi.Text;
            string strProPrice = txtProPrice.Text;
            string strKeywords = txtKeywords.Text;
            string strProKeyDescription = fckProKeyDescription.Text;
            string strProDescription = fckProDescription.Value;
            string strPutdate = DateTime.Now.ToString();
            string strPaths = Textarea1.Value;
            string strProDescription1 = Textarea2.Value;
            string strProDescription2 = Textarea3.Value;
            int intState = 0;
            if (chkState.Checked) { intState = 1; }

            if (intID == 0)
            {
                int intIdentity = products.AddSingleProduct(strClassIdList, intPaixu, strProName, strProBianhao, strProChandi, strProPrice, strPicPath, strProKeyDescription, strProDescription, strKeywords, strPutdate, intState, strPaths, strProDescription1, strProDescription2);
                if (intIdentity > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=添加成功！&url=" + strUrl + "&page="+ page);
                }
            }
            else
            {
                int intRowCount = products.UpdateSingleProduct(intID, strClassIdList, intPaixu, strProName, strProBianhao, strProChandi, strProPrice, strPicPath, strProKeyDescription, strProDescription, strKeywords, intState, strPaths, strProDescription1, strProDescription2);
                if (intRowCount > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=修改成功！&url=" + strUrl + "&page=" + page);
                }
            }
      
    }
   
    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        int MTcount = 0;//执行遍历的次数
        //开始迭代加载
        MakeTr("0", MTcount);
        StringBuilder strCss = new System.Text.StringBuilder();
        strCss.Append("<style>" + "\n");
        strCss.Append(".listTable td{padding:0;line-height:20px;}" + "\n");
        strCss.Append("</style>" + "\n");

        strList = strList + strCss.ToString();
    }
    /// <summary>
    /// 装配每一行
    /// </summary>
    /// <param name="id">上级ID</param>
    /// <param name="count">迭代次数</param>
    private void MakeTr(string id, int count)
    {
        DataSet ds = bp.SelectDataBase("ProClass", "select * from ProClass where parentid=" + id + " order by id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["context"].ToString(), drv["id"].ToString());
            strList = strList + "" + MakeFelgefu(count) + "</td><td><input class='ckbox' type='checkbox' style=\"cursor: pointer;\" name='box' id='box" + drv["id"].ToString() + "' value='" + drv["id"].ToString() + "'></td><td>" + drv["context"].ToString() + "</td></tr></table></div>\n";
            //再次遍历
            MakeTr(drv["id"].ToString(), count + 1);
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
            Returnwords = "<div class='layer l_1'><table class='listTable t_1' name='1'><tr><td>";
        }
        else
        {
            Returnwords = ("<div class='layer l_" + (count + 1) + "'><table class='listTable t_" + (count + 1) + "' name='" + (count + 1) + "'><tr><td><img src=images/t" + (count + 1) + ".gif align=absmiddle />").PadLeft(count, ' ');
        }
        return Returnwords;
    }
    public string chkIstop(string state)
    {
        string strstate = null;
        if (state == "0") { strstate = "普通"; }
        else if (state == "1") { strstate = "<font color='red'>置顶</font>"; }
        return strstate;
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
}

