<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.ascx.cs" Inherits="Link" %>
<%if (string.IsNullOrEmpty(Path))
  { 
%>
<div class="page_bg" style="background: url(/<%=mc.SelectPicByClassID(5) %>) center top no-repeat;">
</div>
<%
    }
  else
  { 
%>
<div class="page_bg" style="background: url(/<%=Path %>) center top no-repeat;">
</div>
<%
    } %>
