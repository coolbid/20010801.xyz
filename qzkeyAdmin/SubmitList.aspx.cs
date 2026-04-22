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

public partial class Manager_SubmitList : Basic.ManagerPage
{
    Submit submit = new Submit();
    public int rowCount;//用来记录总记录数
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridViewFill();
        }
    }
    private void GridViewFill()
    {
        SqlDataReader dr = submit.GetSubmitList();
        DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
        dst.Tables.Add(dt);
        rowCount = dst.Tables[0].Rows.Count;
        this.gvList.DataSource = dst.Tables[0].DefaultView;
        this.gvList.DataBind();
    }
    protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int intRowCount = submit.DeleteSingleSubmit(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=信息删除成功！&url=SubmitList.aspx");
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        CreateExcel();
    }
    public void CreateExcel()
    {
        HttpResponse resp;
        resp = Page.Response;
        resp.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        resp.AppendHeader("Content-Disposition", "attachment;filename=" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ".xls");
        resp.ContentType = "application/ms-excel";
        string colHeaders = "", ls_item = "";
        basic.BasicPage bp = new basic.BasicPage();
        DataTable dt = bp.SelectDataBase("TbFormContent", "select * from TbFormContent").Tables[0];
        DataRow[] myRow = dt.Select("");
        //取得数据表各列标题，各标题之间以\t分割，最后一个列标题后加回车符 
        colHeaders = "表单内容\t提交时间\n";
        resp.Write(colHeaders);
        //逐行处理数据  
        for (int i = 0; i < myRow.Length; i++)
        {
            //当前行数据写入HTTP输出流，并且置空ls_item以便下行数据 
            //专营店名称
            ls_item += myRow[i]["FormContent"].ToString().Trim() + "\t";
            ls_item += myRow[i]["Putdate"].ToString().Trim() + "\n";
            resp.Write(ls_item);
            ls_item = " ";

        }
        resp.End();
    }

}

