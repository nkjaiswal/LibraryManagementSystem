<%@ Page Language="VB" MasterPageFile="~/Lib/MasterPage.master" AutoEventWireup="false" CodeFile="all_bro_book.aspx.vb" Inherits="Lib_Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <br />
        <br />
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
        Width="746px">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
                SortExpression="Book_Title" />
            <asp:BoundField DataField="borrowedby" HeaderText="Student" 
                SortExpression="borrowedby" />
            <asp:BoundField DataField="lastBorrowed" HeaderText="Date" 
                SortExpression="lastBorrowed" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT Books.Book_Title, bookCopy.borrowedby, bookCopy.lastBorrowed FROM bookCopy INNER JOIN Books ON bookCopy.id = Books.ID WHERE (bookCopy.available = 0)">
    </asp:SqlDataSource>
    </center>
</asp:Content>

