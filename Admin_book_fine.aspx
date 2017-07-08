<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_book_fine.aspx.vb" Inherits="Default2" title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p title="View Books on Fine">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" Width="95%" 
            EmptyDataText="Currently, no book is on fine">
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <Columns>
            <asp:BoundField DataField="book_title" HeaderText="Title" 
                SortExpression="book_title" />
            <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" 
                SortExpression="BookID" />
            <asp:BoundField DataField="lastBorrowed" HeaderText="Issued Date" 
                SortExpression="lastBorrowed" />
            <asp:BoundField DataField="Fullname" HeaderText="Issued To" 
                SortExpression="Fullname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" 
                DataFormatString="&lt;a href=mailto:{0}?subject=Fine&gt;{0}&lt;/a&gt;" 
                HtmlEncode="False" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <AlternatingRowStyle BackColor="#F7F7F7" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT books.book_title,{fn CONCAT( {fn Concat(CONVERT(varchar(10),books.id),'#')},CONVERT(varchar(10),copyid))} AS BookID,  lastBorrowed, Fullname,email FROM bookCopy,userdetails,Books WHERE (DATEDIFF(day, lastBorrowed, { fn NOW() }) &gt; 20) AND (available = 0) AND bookCopy.borrowedby = userdetails.username AND books.id=bookCopy.id">
    </asp:SqlDataSource>
</p>
</center>
</asp:Content>

