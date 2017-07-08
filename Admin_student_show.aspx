<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_student_show.aspx.vb" Inherits="Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    Enter User Name/Name/Mobile No/Email of Student(Borrower):
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Show" />
&nbsp;<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
    DataKeyNames="UserName" DataSourceID="SqlDataSource1" Width="70%">
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" 
            SortExpression="UserName" />
        <asp:BoundField DataField="FullName" HeaderText="FullName" 
            SortExpression="FullName" />
        <asp:BoundField DataField="Address" HeaderText="Address" 
            SortExpression="Address" />
        <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
            SortExpression="Mobile" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:HyperLinkField DataNavigateUrlFields="UserName" 
            DataNavigateUrlFormatString="Admin_student_details.aspx?user={0}" 
            HeaderText="Details" NavigateUrl="Admin_student_details.aspx?user={0}" 
            Text="Show..." />
    </Columns>
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
</asp:GridView>
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
    DeleteCommand="DELETE FROM [UserDetails] WHERE [UserName] = @UserName" 
    InsertCommand="INSERT INTO [UserDetails] ([UserName], [FullName], [Address], [Mobile], [Email]) VALUES (@UserName, @FullName, @Address, @Mobile, @Email)" 
    SelectCommand="SELECT UserName, FullName, Address, Mobile, Email FROM UserDetails WHERE (UserName IN (SELECT username FROM users WHERE (type = 'S'))) AND (UserName LIKE { fn CONCAT({ fn CONCAT('%', @src) }, '%') }) OR (UserName IN (SELECT username FROM users AS users_3 WHERE (type = 'S'))) AND (FullName LIKE { fn CONCAT({ fn CONCAT('%', @src) }, '%') }) OR (UserName IN (SELECT username FROM users AS users_2 WHERE (type = 'S'))) AND (Mobile LIKE { fn CONCAT({ fn CONCAT('%', @src) }, '%') }) OR (UserName IN (SELECT username FROM users AS users_1 WHERE (type = 'S'))) AND (Email LIKE { fn CONCAT({ fn CONCAT('%', @src) }, '%') })" 
    
        UpdateCommand="UPDATE [UserDetails] SET [FullName] = @FullName, [Address] = @Address, [Mobile] = @Mobile, [Email] = @Email WHERE [UserName] = @UserName">
    <SelectParameters>
        <asp:QueryStringParameter Name="src" QueryStringField="src" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="UserName" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="FullName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="UserName" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="FullName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
</center>
</asp:Content>

