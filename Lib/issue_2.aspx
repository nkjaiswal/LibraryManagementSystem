<%@ Page Language="VB" MasterPageFile="~/Lib/MasterPage.master" AutoEventWireup="false" CodeFile="issue_2.aspx.vb" Inherits="Lib_Default" title="Library Elect Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>



    <br />
    <br />



    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" 
        ShowHeader="False" Width="70%">
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <Columns>
            <asp:BoundField DataField="FullName" HeaderText="FullName" 
                SortExpression="FullName" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT [FullName], [Address], [Mobile], [Email] FROM [UserDetails] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserName" QueryStringField="user" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Panel ID="Panel1" runat="server" BackColor="#FFFF99" Height="284px" 
        Width="80%">
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Book ID: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" 
    Width="48px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="#" BackColor="White" 
            BorderColor="#666699" BorderStyle="Solid" BorderWidth="2px"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="49px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Add" />
        <br />
        <table style="width: 707px;">
            <tr>
                <td style="text-align: left">
                    YOUR CART</td>
                <td style="text-align: right">
                    <asp:Button ID="Button2" runat="server" Text="Remove Selected" />
                </td>
            </tr>
        </table>
        <asp:ListBox ID="ListBox1" runat="server" Width="70%"></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Height="38px" Text="Issue" 
            Width="93px" />
    </asp:Panel>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource2" 
        ShowHeader="False" Width="70%">
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <Columns>
            <asp:BoundField DataField="Book_Title" HeaderText="Book_Title" 
                SortExpression="Book_Title" />
            <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" 
                SortExpression="BookID" />
            <asp:BoundField DataField="lastBorrowed" HeaderText="Borrow Date" 
                SortExpression="lastBorrowed" />
            <asp:HyperLinkField DataNavigateUrlFields="BookID" 
                DataNavigateUrlFormatString="return.aspx?bookid={0}" HeaderText="Return" 
                NavigateUrl="return.aspx?bookid={0}" Text="Return" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        
            SelectCommand="SELECT Books.Book_Title, { fn CONCAT({ fn CONCAT(CONVERT (varchar(10), bookCopy.id), '_') }, CONVERT (varchar(10), bookCopy.copyid)) } AS BookID, bookCopy.lastBorrowed FROM bookCopy INNER JOIN Books ON bookCopy.id = Books.ID WHERE (bookCopy.borrowedby = @borrowedby) AND available=0">
        <SelectParameters>
            <asp:QueryStringParameter Name="borrowedby" QueryStringField="user" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



</center>
</asp:Content>

