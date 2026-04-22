<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Check_Search" %>

<%if (intNews == 0)
  {
%>
<p style="text-align: center;">
    暂无记录...
</p>
<%
    }%>
<div class="NewList img_list_301">
    <ul>
        <asp:repeater id="DataList2" runat="server">
                            <ItemTemplate>
                            <%if (IsIndex)
                              {
                                  //生成静态情况下
                              %>
                               <li>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" class="show_img">
                                                <a href="/html/product/productdetail-<%#Eval("ProId") %>.html" title="<%#Eval("ProName") %>"
                                                    target="_blank">
                                                    <img src="/<%#Eval("ProPath") %>" alt="<%#Eval("ProName") %>" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="height: 30px; line-height: 30px;" class="show_img_title">
                                              <a href="/html/product/productdetail-<%#Eval("ProId") %>.html" title="<%#Eval("ProName") %>"
                                                    target="_blank">
                                                    <%#Eval("ProName")%>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </li>
                              <%
                                  }
                              else
                              { 
                              %>
                                   <li>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" class="show_img">
                                                <a href="ProDetail.aspx?ProId=<%#Eval("ProId") %>" title="<%#Eval("ProName") %>"
                                                    target="_blank">
                                                    <img src="/<%#Eval("ProPath") %>" alt="<%#Eval("ProName") %>" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="height: 30px; line-height: 30px;" class="show_img_title">
                                                <a href="ProDetail.aspx?ProId=<%#Eval("ProId") %>" title="<%#Eval("ProName") %>"
                                                    target="_blank">
                                                    <%#Eval("ProName")%>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </li>
                                  <%
                                      }%>
                            </ItemTemplate>
                        </asp:repeater>
    </ul>
    <div class="clear">
    </div>
    <div class="page_box" style="width: 100%; padding-top: 5px; padding-bottom: 8px;">
        <%if (IsIndex)
          {
              //静态下分页链接替换
              string PageCon = Basic.Engine.Get.PagiNation.GetPageHtml(intTotalCount, page);
              PageCon = PageCon.ToLower().Replace("&page=null", null);
              PageCon = PageCon.ToLower().Replace("check/search.aspx?keyname=", "html/search/?q=");
              Response.Write(PageCon);
          }
          else
          {
              string PageCon = Basic.Engine.Get.PagiNation.GetPageHtml(intTotalCount, page);
              PageCon = PageCon.ToLower().Replace("&page=null", null);
              PageCon = PageCon.ToLower().Replace("check/search.aspx?keyname=", "ProSearch.aspx?q=");
              Response.Write(PageCon);
          } %>
    </div>
</div>

