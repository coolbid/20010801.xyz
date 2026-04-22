<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintPage.aspx.cs" Inherits="shopev_admin_products_print"
    ValidateRequest="false" %>

<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单信息</title>

    <style type="text/css">
        .tttt
        {
            border-left: #ddd solid 1px;
            border-bottom: #ddd solid 1px;
        }
        .tttt td
        {
            background: #fff;
            border-top: #ddd solid 1px;
            border-right: #ddd solid 1px;
            text-align: center;
            padding: 5px;
        }
        .required
        {
        }
        .form_table th{background:#fff;}
        .msgtable, .form_table{border:none;}
        .form_table th
        {
            font-size:16px;
        }
        .form_table td
        {
            font-size:16px;
        }
        .form_table tr
        {
           line-height: 40px;
        }
        .form_table th span    
        {
            float:right;
        }
        .tab_con{ display:none; position:relative; }
        .mainbody{ padding:10px; padding-bottom:40px; font-family:微软雅黑;}
    </style>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <div id="contentTab">
        <div class="tab_con" style="display: block;">
            <!--startprint-->
            <table class="form_table">
                <col width="150px">
                <col>
                <tbody>
                    <tr <%if(Bianhao.Text==""){%>style="display:none;"<%} %>>
                        <th>
                            <span>订单编号：</span>
                        </th>
                        <td>
                            <asp:Label ID="Bianhao" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr <%if(txtName.Text==""){%>style="display:none;"<%} %>>
                        <th>
                            <span>收货人姓名：</span>
                        </th>
                        <td>
                            <asp:Label ID="txtName" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr <%if(txtPhone.Text==""){%>style="display:none;"<%} %>>
                        <th>
                            <span>手机：</span>
                        </th>
                        <td>
                            <asp:Label ID="txtPhone" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr <%if(txtdizhi.Text==""){%>style="display:none;"<%} %>>
                        <th>
                            <span>详细地址：</span>
                        </th>
                        <td>
                            <asp:Label ID="txtdizhi" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span>支付方式：</span>
                        </th>
                        <td>
                            <asp:Label ID="txt_zhifutype" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span>商品清单：</span>
                        </th>
                        <td>
                            <table cellspacing="1" cellpadding="0" style="background: #ddd;" class="tttt">
                                <tr>
                                    <td width="80px" style="text-align: center;">
                                        产品图片
                                    </td>
                                    <td width="180px" style="text-align: center;">
                                        产品名称
                                    </td>
                                    <td width="80px" style="text-align: center;">
                                        单价
                                    </td>
                                    <td width="80px" style="text-align: center;">
                                        数量
                                    </td>
                                    
                                </tr>
                                <%
                                    for (int i = 0; i < intPro; i++)
                                    {
                                                string proname = dtPro.Rows[i]["ProName"].ToString();
                                                string ProPath = dtPro.Rows[i]["ProPath"].ToString();
                                                string ProPrice = dtPro.Rows[i]["ProPrice"].ToString();
                                                string ProNumber = dtPro.Rows[i]["ProNumber"].ToString();
                                                if (!IsNumberic(ProPrice))
                                                {
                                                    ProPrice = "0.0";
                                                }
                                %>
                                <tr>
                                    <td>
                                        <img width="50" height="50" src="../../<%=ProPath %>">
                                    </td>
                                    <td> 
                                            <%=dtPro.Rows[i]["proname"].ToString()%> 
                                    </td>
                                    <td>
                                        ￥<%=dtPro.Rows[i]["ProPrice"].ToString() %>
                                    </td>
                                    <td>
                                        <%=dtPro.Rows[i]["ProNumber"].ToString()%>
                                    </td>
                                   
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                        </td>
                    </tr>
               
                    


                     <tr <%if(txt_proprice.Text==""){%>style="display:none;"<%} %>>
                        <th>
                            <span>总金额：</span>
                        </th>
                        <td>
                             <asp:Label ID="txt_proprice" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>

                    <tr <%if(txt_message.Text==""){%>style="display:none;"<%} %> >
                        <th>
                           <span> 订单备注：</span>
                        </th>
                        <td>
                            <asp:Label ID="txt_message" runat="server" Text=""  ></asp:Label>
                   
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            <!--endprint-->
            <div id="dayin" style="margin: 15px 17px 8px 68px;"><input onclick="doPrint()" type="button" value="打印"/></div>
        </div>
    </div>
 <script>

     bdhtml = window.document.body.innerHTML;
     sprnstr = "<!--startprint-->"; //开始打印标识字符串有17个字符
     eprnstr = "<!--endprint-->"; //结束打印标识字符串
     prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17); //从开始打印标识之后的内容
     prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
     window.document.body.innerHTML = prnhtml; //把需要打印的指定内容赋给body.innerHTML
     window.print(); //调用浏览器的打印功能打印指定区域

     setTimeout(function () { window.document.body.innerHTML = bdhtml; }, 1500);//重新给页面内容赋值；




     function doPrint() {
         bdhtml = window.document.body.innerHTML;
         sprnstr = "<!--startprint-->"; //开始打印标识字符串有17个字符
         eprnstr = "<!--endprint-->"; //结束打印标识字符串
         prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17); //从开始打印标识之后的内容
         prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
         window.document.body.innerHTML = prnhtml; //把需要打印的指定内容赋给body.innerHTML
         window.print(); //调用浏览器的打印功能打印指定区域
        
         window.document.body.innerHTML = bdhtml;//重新给页面内容赋值；
     }
    
 </script>
    </form>
</body>
</html>
