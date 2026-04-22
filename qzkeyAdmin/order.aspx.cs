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

public partial class order : Basic.ManagerPage
{
    public int page;//页码，跳转用
    Links links = new Links();
    public int rowCount;//用来记录总记录数
    string strAction = null;
    public int intID;
    int intTypeID;
    DataSet dst = new DataSet();
    basic.BasicPage bp = new basic.BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        page = basic.Tools.RequestClass.GetQueryInt("page", 0);
        btnSave.Attributes.Add("onclick", "return BackWait()");
        strAction = Request["Action"];
        if (strAction == "Add")
        {
            pnlList.Visible = false;
            pnlEdit.Visible = true;
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
        dst = new DataSet();
        dst = bp.SelectDataBase("tborder", "select * from tborder order by id desc");
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
        bp.doExecute("delete from tborder where id=" + gvList.DataKeys[e.RowIndex].Value.ToString());
        Response.Redirect("Show_Success.aspx?message=删除成功！&url=order.aspx");
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
                Pages = this.gvList.PageCount.ToString();
                lblCount.Text = this.gvList.PageCount.ToString();
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
    public string strBianhao;
    public string strzj;
    public string strUsername;
    protected void showContent()
    {
        SqlDataReader reader = bp.getRead("select * from tborder where id=" + intID);
        if (reader.Read())
        {
            strBianhao = reader["bianhao"].ToString();
            txtName.Text = reader["Name"].ToString();
            txtdizhi.Text = reader["dizhi"].ToString();
            txtPhone.Text = reader["Phone"].ToString();
            strzj = reader["jiage"].ToString();
            strUsername = reader["Usename"].ToString();
            radlIndexStatus.Text = reader["zhuangtai"].ToString();
            showPro(reader["bianhao"].ToString());
            fckKeyContent.Text = reader["Content"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        string zhuangtai = radlIndexStatus.Text;
        string strName = txtName.Text;
        string strdizhi = txtdizhi.Text;
        string strPhone = txtPhone.Text;
        if (bp.doExecute("update tborder set zhuangtai = '" + zhuangtai+ "',Name='"+strName+ "',dizhi='" + strdizhi + "',Phone='" + strPhone + "' where id='" + intID + "'"))
        {
            Response.Redirect("Show_Success.aspx?message=修改成功！&url=order.aspx&page=" + page);

        }


    }
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

