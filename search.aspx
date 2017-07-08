<%@ Page Language="VB" AutoEventWireup="false" CodeFile="search.aspx.vb" Inherits="search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Search</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-family: "Comic Sans MS";
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body bgcolor="#CCFFCC">
    <form id="form1" runat="server">
    <div>
    <center>
    
        <asp:Image ID="Image1" runat="server" Height="97px" 
            ImageUrl="~/images/Hitk_1.png" Width="136px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style1">HERITAGE INSTITUTE OF 
        TECHNOLOGY, KOLKATA</span><br />
        <hr style="width: 1058px" />
        <br />
        Enter Book Title/Author/Pulisher/ISBN:
        <asp:TextBox ID="Searchbox" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="Book_ISDN13" DataSourceID="SqlDataSource1" 
            style="font-weight: 700" Width="90%">
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
                <asp:CommandField SelectText="*" ShowSelectButton="True" />
                <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
                    SortExpression="Book_Title" />
                <asp:BoundField DataField="Book_Author" HeaderText="Book Author" 
                    SortExpression="Book_Author" />
                <asp:BoundField DataField="Publication" HeaderText="Publication" 
                    SortExpression="Publication" />
                <asp:BoundField DataField="Book_ISDN13" HeaderText="ISBN13" ReadOnly="True" 
                    SortExpression="Book_ISDN13" />
                <asp:BoundField DataField="BooK_ISDN10" HeaderText="ISBN10" 
                    SortExpression="BooK_ISDN10" />
                <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="booklocation.aspx?id={0}" HeaderText="Location" 
                    NavigateUrl="booklocation.aspx?id={0}" Text="Show..." />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Back 
        To Login</asp:HyperLink>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT id,Book_ISDN13, BooK_ISDN10, Book_Title, Book_Author, Publication FROM Books WHERE (Book_ISDN13 LIKE @data) OR (BooK_ISDN10 LIKE @data) OR (Book_Title LIKE @data) OR (Book_Author LIKE @data) OR (Publication LIKE @data)">
            <SelectParameters>
                <asp:QueryStringParameter Name="data" QueryStringField="src" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </center>
    </div>
    </form>
</body>
</html>
