﻿<%@ Page Title="" Language="C#" MasterPageFile="Interface.master" AutoEventWireup="true" CodeFile="Balance_Sheet.aspx.cs" Inherits="Balance_Sheet" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Scripting" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="Server">
    <%if (Session["menu"].ToString() != "3") %>
    <%{ %>
    <% string s = "select proj_name from project_registration where proj_regi_id='" + proj + "'"; %>
    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con = new SqlConnection(strConnString); %>
    <% con.Open(); %>
    <% SqlDataReader dr;%>
    <%SqlCommand cmd = new SqlCommand(s, con);%>
    <% dr = cmd.ExecuteReader();%>
    <%while (dr.Read())%>
    <%{ %>
    <%name = dr.GetString(0); %>
    <%} %>
    <%dr.Close(); %>

    <% string s1 = "select coalesce(sum(balance),'') from "+val78+""; %>
    <%String strConnString1 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con1 = new SqlConnection(strConnString); %>
    <% con1.Open(); %>
    <% SqlDataReader dr1;%>
    <%SqlCommand cmd1 = new SqlCommand(s1, con1);%>
    <% dr1 = cmd1.ExecuteReader();%>
    <%while (dr1.Read())%>
    <%{ %>
    <%name1 =Convert.ToDouble( dr1.GetValue(0)); %>
    <%} %>
    <%dr1.Close(); %>
     <% string s2 = "select coalesce(sum(balance),'') from "+val79+""; %>
    <%String strConnString2 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con2 = new SqlConnection(strConnString); %>
    <% con2.Open(); %>
    <% SqlDataReader dr2;%>
    <%SqlCommand cmd2 = new SqlCommand(s2, con2);%>
    <% dr2 = cmd2.ExecuteReader();%>
    <%while (dr2.Read())%>
    <%{ %>
    <%name2 =Convert.ToDouble( dr2.GetValue(0)); %>
    <%} %>
    <%dr2.Close(); %>
     <% string s3 = "select coalesce(sum(balance),'') from "+val80+""; %>
    <%String strConnString3 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con3 = new SqlConnection(strConnString); %>
    <% con3.Open(); %>
    <% SqlDataReader dr3;%>
    <%SqlCommand cmd3 = new SqlCommand(s3, con3);%>
    <% dr3 = cmd3.ExecuteReader();%>
    <%while (dr3.Read())%>
    <%{ %>
    <%name3 =Convert.ToDouble( dr3.GetValue(0)); %>
    <%} %>
    <%dr3.Close(); %>
     <% string s4 = "select coalesce(sum(balance),'') from "+val81+""; %>
    <%String strConnString4 = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
    <%SqlConnection con4 = new SqlConnection(strConnString); %>
    <% con4.Open(); %>
    <% SqlDataReader dr4;%>
    <%SqlCommand cmd4 = new SqlCommand(s4, con4);%>
    <% dr4 = cmd4.ExecuteReader();%>
    <%while (dr4.Read())%>
    <%{ %>
    <%name5 =Convert.ToDouble( dr4.GetValue(0)); %>
    <%} %>
    <%dr4.Close(); %>
    <div class="side-content fr" style="width: 1300px; float: left; margin-right: 50px">
        <div class="content-module">
            <div class="content-module-main cf">
                <table width="1260px" style="border: 1px solid black">
                    <tr>
                        <th colspan="2">
                            <font size="3px">Balance Sheet</font> <font style="margin-left: 470px" size="3px">
                                <%=name %></font><font style="float:right;">
                                <a href="BS_P_L.aspx">Back</a></font>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Particulars
                        </td>
                        <td>
                            Particulars
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pan1" Height="240px" Width="600px" Style="float: left; border-right: 1px solid black"
                                runat="server" ScrollBars="Auto">
                                <table>
                                    <% string s = "select ledger.name,coalesce((select SUM(" + val1 + ".balance)),'0.0000') from ledger left join " + val1 + " on " + val1 + ".main_name=ledger.name where ledger.Display='Liability' group by ledger.name"; %>
                                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                                    <%SqlConnection con = new SqlConnection(strConnString); %>
                                    <% con.Open(); %>
                                    <% SqlDataReader dr;%>
                                    <%SqlCommand cmd = new SqlCommand(s, con);%>
                                    <% dr = cmd.ExecuteReader();%>
                                    <%while (dr.Read())%>
                                    <%{ %>
                                    <tr>
                                        <td style="width: 300px; text-align: left">
                                            <a href="Group_View.aspx?id=<%Response.Write(dr.GetString(0)); %>"> <%Response.Write(dr.GetString(0)); %></a>
                                        </td>
                                        <td style="width: 250px; text-align: right; margin-right: 25px">
                                                                                   <%if (dr.GetValue(1).ToString() == "0.0000") %>
                                            <%{ %>
                                            <%} %>
                                            <%else
                                                { %>
                                            <%Response.Write(dr.GetValue(1)); %>
                                            <%r = r + Convert.ToDouble(dr.GetValue(1)); %>
                                            <%} %>
                                          
                                        </td>
                                    </tr>
                                    <%} %>
                                    <%dr.Close(); %>
                                    
                                    
                                </table>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="Panel1" Height="240px" Width="600px" Style="float: right" runat="server"
                                ScrollBars="Auto">
                                <table>
                                    <% string s = "select ledger.name,coalesce((select SUM(" + val1 + ".balance)),'0.0000') from ledger left join " + val1 + " on " + val1 + ".main_name=ledger.name where ledger.Display='Assets' group by ledger.name"; %>
                                    <%String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString; %>
                                    <%SqlConnection con = new SqlConnection(strConnString); %>
                                    <% con.Open(); %>
                                    <% SqlDataReader dr;%>
                                    <%SqlCommand cmd = new SqlCommand(s, con);%>
                                    <% dr = cmd.ExecuteReader();%>
                                    <%while (dr.Read())%>
                                    <%{ %>
                                  <tr>
                                        <td style="width: 300px; text-align: left">
                                            <a href="Group_View.aspx?id=<%Response.Write(dr.GetString(0)); %>"> <%Response.Write(dr.GetString(0)); %></a>
                                        </td>
                                        <td style="width: 250px; text-align: right; margin-right: 25px">
                                             <%if (dr.GetString(0) == "Current Assests") %>
                                             <%{ %>
                                             <%if (name1 == 0) %>
                                             <%{ %>
                                            <%if (dr.GetValue(1).ToString() == "0.0000") %>
                                            <%{ %>
                                            <%} %>
                                            <%else %>
                                            <%{ %>
                                            <%Response.Write(dr.GetValue(1).ToString()); %>
                                            <%r1 = r1 +Convert.ToDouble(dr.GetValue(1)); %>
                                            <%} %>
                                            <%} %>
                                            <%else %>
                                             <%{ %>
                                             <%Response.Write(name1 + Convert.ToDouble(dr.GetValue(1).ToString())); %>
                                             <%r1 = r1 + name1 + Convert.ToDouble(dr.GetValue(1).ToString()); %>
                                            <%} %>
                                            <%} %>
                                            <%else
                                                 { %>
                                                 <%if (dr.GetValue(1).ToString() == "0.0000") %>
                                            <%{ %>
                                            <%} %>
                                            <% else
                                                 { %>
                                            <%Response.Write(dr.GetValue(1)); %>
                                            <%r1 = r1 + Convert.ToDouble(dr.GetValue(1)); %>
                                            <%} %>
                                            <%} %>
                                          
                                        </td>
                                    </tr>
                                    <%} %>
                                    <%dr.Close(); %>
                                    
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                    <td> <%if(r1>r) %>
                                            <%{ %>
                                            <%name8=(r1)-(r); %>
                                           <font style="float:left; margin-left:15px">Profit & Loss Account :</font><font style="float:right; margin-right:70px"><%=name8 %></font>
                                           <%name6 = name8; %>
                                            <%} %></td>
                                            <td> <%if(r1<r) %>
                                            <%{ %>
                                            <%name8 = (r ) - (r1 ); %>
                                            <%name7 = name8; %>
                                          <font style="float:left; margin-left:25px">Profit & Loss Account :</font><font style="float:right; margin-right:25px"><%=name8 %></font>
                                            <%} %></td></tr>
                                           
                    <tr>
                        <td colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                       <%if (name6!=0) %>
                    <%{ %>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r == 0) %>
                                        <%{%>
                                                                         <%=name6%>
                                         <%} %>
                                        <%else
                                            { %>
                                           
                                           
                                           <%=r+name6%>
                                          
                                            <%} %></font>
                        </td>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r1 == 0) %>
                                        <%{ } %>
                                        <%else
                                            { %>
                                           
                                            <%=r1%>
                                           
                                            <%} %></font>
                                           
                                          
                        </td>
                        <%} %>
                         <%else if(name7!=0) %>
                         <%{ %>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r == 0) %>
                                        <%{ } %>
                                        <%else
                                            { %>
                                           
                                           
                                           <%=r %>
                                          
                                            <%} %></font>
                        </td>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r1 == 0) %>
                                        <%{%> <%=name7 %><%} %>
                                        <%else
                                            { %>
                                           
                                            <%=r1 +name7%>
                                           
                                            <%} %></font>
                                           
                                          
                        </td>
                        <%} %>
                        <%else if(name7==0 && name6==0) %>
                         <%{ %>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r == 0) %>
                                        <%{ } %>
                                        <%else
                                            { %>
                                           
                                           
                                           <%=r%>
                                          
                                            <%} %></font>
                        </td>
                        <td>
                            Total<font style="margin-left: 400px"> <%if (r1 == 0) %>
                                        <%{%> <%} %>
                                        <%else
                                            { %>
                                           
                                            <%=r1 %>
                                           
                                            <%} %></font>
                                           
                                          
                        </td>
                        <%} %>
                    </tr>
                </table>
            </div>
            <div style="margin-left: 20px;">
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
