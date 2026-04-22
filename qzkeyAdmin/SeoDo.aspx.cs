using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using basic;

public partial class Manager_SeoDo : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    string title = "";
    string description = "";
    string keywords = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {

        bp.doExecute("update ColumnList set ColumnTitle=''");
        bp.doExecute("update ColumnList set ColumnDescription=''");
        bp.doExecute("update ColumnList set ColumnKeywords=''");

        bp.doExecute("update ColumnList set ColumnTitle=ColumnName+'-" + txtBiaoti.Text.ToString() + "'");
        bp.doExecute("update ColumnList set ColumnDescription='" + txtMiaoshu.Text.ToString() + "'");
        bp.doExecute("update ColumnList set ColumnKeywords='" + txtGuanjianci.Text.ToString() + "'");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=Mianban.aspx");
    }
}
