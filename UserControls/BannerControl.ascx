<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BannerControl.ascx.cs"
    Inherits="BannerControl" %>
<!-- bxslider -->
<div class="flash">
    <ul class="bxslider">
        <%for (int i = 0; i < intPicListRowCount; i++)
          {
              string Url = dstPicList.Tables[0].Rows[i]["Url"].ToString();
              string Beizhu = dstPicList.Tables[0].Rows[i]["Beizhu"].ToString();
              string Path = dstPicList.Tables[0].Rows[i]["Path"].ToString();
        %>
        <li><a href="<%=Url %>">
            <img src="/<%=Path %>"></a></li>
        <%
            } %>
    </ul>
</div>
<script type="text/javascript">
    $('.bxslider').bxSlider({
        adaptiveHeight: true,
        infiniteLoop: true,
        hideControlOnEnd: true,
        auto: true
    });
</script>
