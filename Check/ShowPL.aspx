<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPL.aspx.cs" Inherits="ShowPL" %>
 <%for(int i = 0;i<intNews;i++)
                        {
                            string content = dsNews.Tables[0].Rows[i]["content"].ToString();
                            string putdate = dsNews.Tables[0].Rows[i]["putdate"].ToString();
                            string Name = dsNews.Tables[0].Rows[i]["Name"].ToString();
                            if(Name!="游客")
                            {
                                Name = "用户名：" + Name;
                            }
                            %>
                    <li>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                 <td><span><%=Name %></span> <i>时间：<%=putdate %></i></td>
                            </tr>
                            <tr>
                                <td><%=content %></td>
                            </tr>
                        </table>
                    </li>
                    <%} %>

