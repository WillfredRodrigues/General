﻿<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Sales_Home.aspx.cs" Inherits="Sales_Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
<div class="side-menu fl">
        
        <ul>
              <%if (Session["rightView"].ToString() == "1") %>
            <%{ %>
           <li><a href="Data_Entry_Home.aspx" class="active-tab dashboard-tab">Day Book</a></li>
            <%} %>
            <%if (Session["rightinsert"].ToString() == "1") %>
            <%{ %>
            <li><a href="Purchase_Home.aspx" class="purchase-tab">Purchase</a></li>
             <li><a href="Sales_Home.aspx" class="purchase-tab">Sales</a></li>
            <li><a href="Payment_Entry.aspx" class="active-tab dashboard-tab">Payment</a></li>
            <li><a href="Receipt_Entry.aspx" class="active-tab dashboard-tab">Receipt</a></li>
            <li><a href="Contra.aspx" class="active-tab dashboard-tab">Contra</a></li>
            <li><a href="Journal.aspx" class="active-tab dashboard-tab">Journal</a></li>
            <%} %>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" Runat="Server">
<%if (Session["rightview"].ToString() == "1") %>
            <%{ %>
<div class="side-content fr">
        <div class="content-module">
        <div style="margin-top:10px">
        <center><font color="#153450" size="4px" style="margin-top:10px"><b><u>Sales Information</u></b></font></center></div>
            <br />
            <!-- end content-module-heading -->
            <div class="content-module-main cf">
               <a href="Sales.aspx">Create Sales</a>
            </div>
            <table style="padding: inherit; border-spacing: inherit; caption-side: inherit; empty-cells: inherit;"
                border="solid" align="left">
                <tr>
                    <th align="left">
                        No
                    </th>
                    <th align="left">
                        Material  Name
                    </th>
                    <th align="left">
                        Quantity
                    </th>
                    <th align="left">
                        Quantity Type
                    </th>
                    <th align="left">
                        Rate
                    </th>
                    <th align="left">
                        Amount
                    </th>
                    <th align="left">
                         Buyer Name
                    </th>
                    <th align="left">
                        Buyer Mobile
                    </th>
                     <th align="left">
                        Sold By
                    </th>
                     <th align="left">
                        Type
                    </th>
                    <th align="left">
                        Date
                    </th>
                    <th align="left">
                        Update
                    </th>
                    <th align="left">
                        Delete
                    </th>
                </tr>
                <%int i = 1; %>
                <% string s = "select material_name,quantity,quantity_type,rate,amount,vendor_name,vendor_mobile,purchased_by,type_of_purchase,purchase_date,purchase_id from " + val + " order by purchase_date desc"; %>
                <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                <%SqlConnection con = new SqlConnection(strConnString); %>
                <% con.Open(); %>
                <% SqlDataReader dr;%>
                <%SqlCommand cmd = new SqlCommand(s, con);%>
                <% dr = cmd.ExecuteReader();%>
                <%while (dr.Read())%>
                <%{ %>
                <tr>
                    <td>
                        <%=i%>
                    </td>
                     <td>
                        <%Response.Write(dr.GetString(0));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(1));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(2));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(3));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetValue(4));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(5));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(6));%>
                    </td>
                   <td>
                        <%Response.Write(dr.GetString(7));%>
                    </td>
                   <td>
                        <%Response.Write(dr.GetString(8));%>
                    </td>
                    <td>
                        <%Response.Write(dr.GetString(9));%>
                    </td>
                     <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Update_Sales.aspx?id=<%=dr.GetString(10) %>" class="round blue my_button  text-upper">
                                Update</a>
                        </center>
                    </td>
                    <td>
                        <center>
                            <%--<input type="radio" onclick="abc()" value="<%=dr.GetString(11) %>" name="rd" id="rd1<%=dr.GetString(11) %>" />
                            --%>
                            <a href="Delete_Sales.aspx?id=<%=dr.GetString(10) %>" class="round blue my_button  text-upper">
                                Delete</a>
                        </center>
                    </td>
                </tr>
                <%i++; %>
                <%} %>
                <%dr.Close(); %>
                <%con.Close(); %>
                <%--<th>Edit /Delete</th>
                --%>
                <%--<th>Select</th>--%>
            </table>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>



