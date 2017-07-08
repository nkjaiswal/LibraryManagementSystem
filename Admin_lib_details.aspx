<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_lib_details.aspx.vb" Inherits="Default2" title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center title="Librarian">
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="UserName" 
        DataSourceID="SqlDataSource1" Height="50px" Width="459px">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
                SortExpression="UserName" />
            <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                SortExpression="FullName" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Fields>
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT * FROM [UserDetails] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserName" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT SUM(FineAmt),SUM(PaidAmt) FROM Fine WHERE ReceivedBy = @rec AND CONVERT(VARCHAR(10),DateRec,111)=CONVERT(VARCHAR(10),{fn now()},111);">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT SUM(FineAmt), SUM(PaidAmt) FROM Fine WHERE
DateRec Between
DATEADD(DAY, (-1 * DATEPART(DAY,GetDate()) + 1), GetDate())
AND
dateadd(year,year(GETDATE())-1900,dateadd(month,MONTH(GETDATE()),0)-1)
AND ReceivedBy=@rec
">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT SUM(FineAmt), SUM(PaidAmt) FROM Fine WHERE ReceivedBy = @r">
        <SelectParameters>
            <asp:QueryStringParameter Name="r" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <table style="width: 96%;">
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
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" 
                    Height="50px" Width="208px">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Fine Amount" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Received Amount" 
                            ReadOnly="True" SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:DetailsView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Horizontal" 
                    Height="50px" Width="239px">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Fine Amount" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Received Amount" 
                            ReadOnly="True" SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:DetailsView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataSource4" GridLines="Horizontal" 
                    Height="50px" Width="239px">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <Fields>
                        <asp:BoundField DataField="Column1" HeaderText="Fine Amount" ReadOnly="True" 
                            SortExpression="Column1" />
                        <asp:BoundField DataField="Column2" HeaderText="Received Amount" 
                            ReadOnly="True" SortExpression="Column2" />
                    </Fields>
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
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
    </center>
</asp:Content>

