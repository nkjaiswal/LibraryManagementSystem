<%@ Page Language="VB" MasterPageFile="~/Lib/MasterPage.master" AutoEventWireup="false" CodeFile="return.aspx.vb" Inherits="Lib_Default" title="Return Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <br />
    <br />
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/tick.png" 
        Visible="False" />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" 
        ForeColor="Green" Text="Fine is"></asp:Label>
    <br />
    <br />
    Paid Amount:&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="66px"></asp:TextBox>
    <br />
    Remarks if any:
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Pay Now &amp; Return" />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Lib/issue.aspx">Cancle</asp:HyperLink>
    <br />
    </center>
</asp:Content>

