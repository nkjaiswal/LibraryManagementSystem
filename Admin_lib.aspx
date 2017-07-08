<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_lib.aspx.vb" Inherits="Default2" title="Librarian Update/Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" DataKeyNames="UserName" 
        DataSourceID="SqlDataSource1" GridLines="None" Width="90%">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
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
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <br />
    CHANGE PASSWORD<br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="username" DataSourceID="SqlDataSource2" 
        GridLines="Vertical">
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="True" 
                SortExpression="username" />
            <asp:BoundField DataField="password" HeaderText="Password" 
                SortExpression="password" />
            <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                DataNavigateUrlFormatString="Admin_lib_details.aspx?id={0}" 
                HeaderText="Details" NavigateUrl="Admin_lib_details.aspx?id={0}" 
                Text="Show..." />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#DCDCDC" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        DeleteCommand="DELETE FROM [users] WHERE [username] = @username" 
        InsertCommand="INSERT INTO [users] ([username], [password]) VALUES (@username, @password)" 
        SelectCommand="SELECT [username], [password] FROM [users] WHERE ([type] = @type)" 
        UpdateCommand="UPDATE [users] SET [password] = @password WHERE [username] = @username">
        <SelectParameters>
            <asp:Parameter DefaultValue="L" Name="type" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="username" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="username" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        DeleteCommand="DELETE FROM [UserDetails] WHERE [UserName] = @UserName" 
        InsertCommand="INSERT INTO [UserDetails] ([UserName], [FullName], [Address], [Mobile], [Email]) VALUES (@UserName, @FullName, @Address, @Mobile, @Email)" 
        SelectCommand="SELECT UserName, FullName, Address, Mobile, Email FROM UserDetails WHERE (UserName IN (SELECT username FROM users WHERE (type = 'L'))) ORDER BY FullName" 
        
            UpdateCommand="UPDATE [UserDetails] SET [FullName] = @FullName, [Address] = @Address, [Mobile] = @Mobile, [Email] = @Email WHERE [UserName] = @UserName">
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

