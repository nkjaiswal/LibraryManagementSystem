<%@ Page Language="VB" MasterPageFile="~/Stu/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Stu_Default" Title="Student Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1" 
        EmptyDataText="No Book issued in your Account" Width="60%">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:BoundField DataField="book_title" HeaderText="Book Title" 
                SortExpression="book_title" />
            <asp:BoundField DataField="lastborrowed" HeaderText="Date of issue" 
                SortExpression="lastborrowed" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT book_title,lastborrowed FROM books,bookCopy WHERE books.id=bookCopy.id AND available = 0 AND borrowedby = @b">
        <SelectParameters>
            <asp:SessionParameter Name="b" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</center>
</asp:Content>

