<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_total_fine.aspx.vb" Inherits="Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <table style="width: 90%;">
        <tr>
            <td>
                Today</td>
            <td>
                This Month</td>
            <td>
                Total</td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Height="50px" 
                    Width="267px">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Total Fine" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Paid Fine" ReadOnly="True" 
                            SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DetailsView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" 
                    Height="50px" Width="265px">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Total Fine" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Paid Fine" ReadOnly="True" 
                            SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:DetailsView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource3" Height="50px" 
                    Width="265px">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Total Fine" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Paid Fine" ReadOnly="True" 
                            SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT SUM(FineAmt), SUM(PaidAmt) FROM Fine">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT SUM(FineAmt), SUM(PaidAmt) FROM Fine WHERE
DateRec Between
DATEADD(DAY, (-1 * DATEPART(DAY,GetDate()) + 1), GetDate())
AND
dateadd(year,year(GETDATE())-1900,dateadd(month,MONTH(GETDATE()),0)-1)

"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT SUM(FineAmt),SUM(PaidAmt) FROM Fine WHERE CONVERT(VARCHAR(10),DateRec,111)=CONVERT(VARCHAR(10),{fn now()},111);">
    </asp:SqlDataSource>
    </center>
</asp:Content>

