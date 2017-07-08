<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_fine.aspx.vb" Inherits="Default2" title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p title="Select Student/Librarian">
        <br />
        
        Select Student/Borrower
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="FullName" 
            DataValueField="UserName">
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Show" />
    </p>
    <hr style="width: 722px" />
    <p>
        Select Librarian:
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="fullname" DataValueField="username">
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Show" />
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT users.username,userdetails.fullname from users,userdetails WHERE users.username = userdetails.username AND type='L'">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT users.UserName,FullName FROM users,userdetails WHERE users.username = userdetails.username AND type='S'">
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
    </center>
</asp:Content>

