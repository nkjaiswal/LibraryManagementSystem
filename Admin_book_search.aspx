<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_book_search.aspx.vb" Inherits="Default2" title="Search Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <center>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
    CellPadding="3" CellSpacing="1" DataKeyNames="Book_ISDN13" 
    DataSourceID="SqlDataSource1" Width="95%">
    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Book_ISDN13" HeaderText="Book ISBN13" 
            ReadOnly="True" SortExpression="Book_ISDN13" />
        <asp:BoundField DataField="BooK_ISDN10" HeaderText="BooK ISBN10" 
            SortExpression="BooK_ISDN10" />
        <asp:BoundField DataField="Book_Title" HeaderText="Book_Title" 
            SortExpression="Book_Title" />
        <asp:BoundField DataField="Book_Author" HeaderText="Book_Author" 
            SortExpression="Book_Author" />
        <asp:BoundField DataField="Publication" HeaderText="Publication" 
            SortExpression="Publication" />
        <asp:BoundField DataField="C" HeaderText="Available Copyies" />
        <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="~/addmore.aspx?id={0}" HeaderText="Add Copies" 
            NavigateUrl="~/addmore.aspx?id={0}" Text="+" />
        <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="~/show.aspx?url={0}" HeaderText="Image" 
            NavigateUrl="~/show.aspx?url={0}" Target="_blank" Text="Show..." />
    </Columns>
    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
</asp:GridView>
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
    
        SelectCommand="SELECT *,(SELECT count(*) From bookCopy where bookCopy.id=books.id) As C  FROM Books WHERE (Book_Author LIKE @B) OR (BooK_ISDN10 LIKE @B) OR (Book_ISDN13 LIKE @B) OR (Book_Title LIKE @B) OR (Publication LIKE @B)">
    <SelectParameters>
        <asp:QueryStringParameter Name="B" QueryStringField="src" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<br />
<br />
</center>
</asp:Content>

