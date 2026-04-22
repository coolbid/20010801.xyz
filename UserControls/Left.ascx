<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="Left" %>
<div class="col-xs-12 col-sm-4 col-md-3">
    <div class="left_nav" id="categories">
        <%   
            if (Request.Url.ToString().ToLower().IndexOf("pro") != (-1))
            {
                    
        %>
        <h2 class="left_h">
            Product</h2>
        <div class="tree">
            <%
                    
            //显示产品分类
            for (int i = 0; i < intCount; i++)
            {
                string Context = dst.Tables[0].Rows[i]["Context"].ToString();
                string Id = dst.Tables[0].Rows[i]["Id"].ToString();
                showContentSub(Convert.ToInt32(Id));
            %>
            <div class="tree_box">
                <h3 style="background-color: #3b52a2;">
                    <span></span><a href="#">
                        <%=Context%></a></h3>
                <ul class="tree_one" style="display: none;">
                    <%for (int m = 0; m < intCountSub; m++)
                      {
                          string Id2 = dstSub.Tables[0].Rows[m]["Id"].ToString();
                          string Context2 = dstSub.Tables[0].Rows[m]["Context"].ToString();

                          showContentSub2(Convert.ToInt32(Id2));
                    %>
                    <li>
                        <h4>
                            <span></span><a href="/product?typeid=<%=Id2 %>&j=1">
                                <%=Context2%></a></h4>
                        <%if (intCountSub2 > 0)
                          {   
                        %>
                        <ul class="tree_two">
                            <%for (int n = 0; n < intCountSub2; n++)
                              {
                                  string Id3 = dstSub2.Tables[0].Rows[n]["Id"].ToString();
                                  string Context3 = dstSub2.Tables[0].Rows[n]["Context"].ToString(); 
                            %>
                            <li><a href="/product.aspx?typeid=<%=Id3 %>&j=1">
                                <%=Context3%></a></li>
                            <% 
            } %>
                        </ul>
                        <%} %>
                    </li>
                    <%  
            } %>
                </ul>
            </div> 
        <%
            }
                %>
                </div>
                <%
            }
            else
            {
                ShowSubmenu(intClassID);
                if (intColumnList == 0)
                {
                     %>
                        <h2 class="left_h">
            <%=mc.ShowColumnName(intClassID)%></h2>
                     <%
}
                else
                {
        %>
        <h2 class="left_h">
            <%=strColumnName%></h2>
        <div class="tree">
            <%for (int i = 0; i < intColumnList; i++)
              {
                  string ColumnUrlClient = dsSubmenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
                  string ColumnName = dsSubmenu.Tables[0].Rows[i]["ColumnName"].ToString();
                  string Id = dsSubmenu.Tables[0].Rows[i]["Id"].ToString();
                  showCol(Convert.ToInt32(Id));
            %>
            <div class="tree_box">
                <h3 style="background-color: #3b52a2;">
                    <span></span><a href="<%=ColumnUrlClient%>">
                        <%=ColumnName%></a></h3>
                <%if (intCol > 0)
                  { %>
                <ul class="tree_one" style="display: none;">
                    <%for (int m = 0; m < intCol; m++)
                      {
                          string ColumnUrlClient2 = dstCol.Rows[m]["ColumnUrlClient"].ToString();
                          string ColumnName2 = dstCol.Rows[m]["ColumnName"].ToString();
                          string Id2 = dstCol.Rows[m]["Id"].ToString();
                          showCol2(Convert.ToInt32(Id2));
                    %>
                    <li>
                        <h4>
                            <span></span><a href="<%=ColumnUrlClient2 %>">
                                <%=ColumnName2%></a></h4>
                        <%if (intCol2 > 0)
                          {   
                        %>
                        <ul class="tree_two">
                            <%for (int n = 0; n < intCol2; n++)
                              {
                                  string ColumnUrlClient3 = dstCol2.Rows[n]["ColumnUrlClient"].ToString();
                                  string ColumnName3 = dstCol2.Rows[n]["ColumnName"].ToString(); 
                            %>
                            <li><a href="<%=ColumnUrlClient3 %>">
                                <%=ColumnName3%></a></li>
                            <% 
} %>
                        </ul>
                        <%} %>
                    </li>
                    <% 
}  %>
                </ul>
                <%} %>
            </div>
            <%} %>
        </div>
        <%
}
            } %>
        <script type="text/javascript">
            $(function () {
                var h3 = $(".tree_box").find("h3");
                var tree_one = $(".tree_box").find(".tree_one");
                var h4 = $(".tree_one").find("h4 span");
                var tree_two = $(".tree_one").find(".tree_two");
                h3.each(function (i) {
                    $(this).click(function () {
                        tree_one.eq(i).slideToggle();
                        tree_one.eq(i).parent().siblings().find(".tree_one").slideUp();
                    })
                })
                h4.each(function (i) {
                    $(this).click(function () {
                        tree_two.eq(i).slideToggle();
                        tree_two.eq(i).parent().siblings().find(".tree_two").slideUp();
                    })
                })
            })
        </script>
        <%--<ul class="left_nav_ul" id="firstpane">
            <%   
        //显示产品分类
        for (int i = 0; i < intCount; i++)
        {
            string Context = dst.Tables[0].Rows[i]["Context"].ToString();
            string Id = dst.Tables[0].Rows[i]["Id"].ToString();
            %>
            <li class="hmain_list"><a href="/product/<%=Id %>" title="<%=Context%>">
                <%=Context%></a> </li>
             <li><a class="biglink" href="/product/<%=Id %>">
                <%=Context%></a><span class="menu_head">+</span><ul class="left_snav_ul menu_body">
                </ul>
            </li>
            <%
        }%>
        </ul>--%>
    </div>
    <div class="left_news">
        <h2 class="left_h">
            <%=mc.ShowColumnName(2) %></h2>
        <ul class="left_news">
            <%showNews(2, 5); %>
            <% for (int i = 0; i < intNews; i++)
               {
                   string title = dtblNews.Rows[i]["title"].ToString();
                   string url = dtblNews.Rows[i]["url"].ToString();

                   string id = dtblNews.Rows[i]["id"].ToString();
                   if (url == "") { url = "/newsdetail/" + id; }
            %>
            <li><a href="<%=url %>">
                <%=bp.SubString(title,30)%></a></li>
            <%} %>
        </ul>
    </div>
    <div class="index_contact">
        <h2 class="left_h">
            CONTACT US</h2>
        Add：Pingfang District Auto parts Zone B，Haerbin，China<br>
        <br>
        Contacts：Mr. Eric Duan<br>
        <br>
        Phone：+86 13798362158<br>
        <br>
    </div>
</div>
