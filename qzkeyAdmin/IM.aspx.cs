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

public partial class Manager_IM : Basic.ManagerPage
{
    QQ qq = new QQ();
    public int rowCount = 0;//用来记录总记录数
    string strAction = null;
    int intID;
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        strAction = Request.QueryString["Action"];
        if (strAction == null)
        {
            if (!IsPostBack)
            {
                pnlList.Visible = true;
                pnlEdit.Visible = false;
                //绑定数据
                GridViewFill();
            }
        }
        else if (strAction == "View")
        {
            pnlList.Visible = false;
            pnlEdit.Visible = true;
            if (Request["ID"] != null)
            {
                intID = Convert.ToInt16(Request["ID"]);
                if (!IsPostBack)
                {
                    if (intID > 0)
                    {
                        showContent();
                    }
                }
            }
        }
    }
    private void GridViewFill()
    {
        SqlDataReader dr = qq.GetQQ();
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
        int intRowCount = qq.DeleteSingleQQ(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=IM.aspx");
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
                lblCount.Text = this.gvList.PageCount.ToString();
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
        SqlDataReader reader = qq.GetSingleQQ(intID);
        if (reader.Read())
        {
            txtQQ.Text = reader["qq"].ToString();
            txtName.Text = reader["name"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strQQ = txtQQ.Text.Trim();
        string strName = txtName.Text.Trim();
        if (intID == 0)
        {
            int intIdentity = qq.AddSingleQQ(strQQ, strName);
            if (intIdentity > 0)
            {
                Response.Redirect("Show_Success.aspx?message=添加成功！&url=IM.aspx");
            }
        }
        else
        {
            int intRowCount = qq.UpdateSingleQQ(intID, strQQ, strName);
            if (intRowCount > 0)
            {
                Response.Redirect("Show_Success.aspx?message=修改成功！&url=IM.aspx");
            }
        }
    }
    protected string ChangeState(string State)
    {
        string strState = null;
        if (State == "0")
        {
            strState = "<font color='red'>使用中</font>";
        }
        else if (State == "1")
        {
            strState = "已停止";
        }
        return strState;
    }
    protected string SetState(string State)
    {
        string strState = null;
        if (State == "0")
        {
            strState = "<font color='red'>关闭</font>";
        }
        else if (State == "1")
        {
            strState = "开启";
        }
        return strState;
    }
    protected void LinkButton3_Command(object sender, CommandEventArgs e)
    {
        int intRowCount = qq.SetQQ(Convert.ToInt16(e.CommandArgument));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=设置成功！&url=IM.aspx");
        }
    }
}

