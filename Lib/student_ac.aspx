<%@ Page Language="VB" MasterPageFile="~/Lib/MasterPage.master" AutoEventWireup="false" CodeFile="student_ac.aspx.vb" Inherits="Lib_Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Enter Student ID"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Height="16px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" style="height: 26px" Text="Show" />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
        Width="879px">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
                SortExpression="Book_Title" />
            <asp:BoundField DataField="lastBorrowed" HeaderText="Borrowed Date" 
                SortExpression="lastBorrowed" />
            <asp:BoundField DataField="id" HeaderText="BOOK ID" SortExpression="id" />
            <asp:BoundField DataField="copyid" HeaderText="COPY ID" 
                SortExpression="copyid" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        
            SelectCommand="SELECT Books.Book_Title, bookCopy.lastBorrowed, bookCopy.id, bookCopy.copyid FROM bookCopy INNER JOIN Books ON bookCopy.id = Books.ID WHERE (bookCopy.available = 0) AND (bookCopy.borrowedby = @Param1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Param1" QueryStringField="std" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</center>
</asp:Content>

