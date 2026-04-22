<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="Category" %>
<div class="side_product">
    <h2>
        产品列表</h2>
    <ul>
        <%if (intCount > 0)
          {
              for (int i = 0; i < intCount; i++)
              {%>
        <li class="hmain_list"><a href="/product/<%=dst.Tables[0].Rows[i]["Id"].ToString() %>"
            title="<%=dst.Tables[0].Rows[i]["Context"].ToString()%>">
            <%=dst.Tables[0].Rows[i]["Context"].ToString()%>
        </a>
            <%showContentSub(Int32.Parse(dst.Tables[0].Rows[i]["Id"].ToString()));%>
            <%if (intCountSub > 0)
              {%>
            <dl>
                <%for (int m = 0; m < intCountSub; m++)
                  {%>
                <dd>
                    <a href="/product/<%=dstSub.Tables[0].Rows[m]["Id"].ToString() %>" title="<%=dstSub.Tables[0].Rows[m]["Context"].ToString()%>">
                        <%=dstSub.Tables[0].Rows[m]["Context"].ToString()%>
                    </a>
                </dd>
                <%} %>
            </dl>
            <%} %>
        </li>
        <%}
      }%>
    </ul>
</div>
