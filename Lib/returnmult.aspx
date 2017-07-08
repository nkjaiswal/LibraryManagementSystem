<%@ Page Language="VB" MasterPageFile="~/Lib/MasterPage.master" AutoEventWireup="false" CodeFile="returnmult.aspx.vb" Inherits="Lib_Default" title="Return Multiple Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/tick.png" 
        Visible="False" />
    <br />
    <br />
    <br />
    Enter Book ID: 
    <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>
    #<asp:TextBox ID="TextBox2" runat="server" Width="55px"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Append" />
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" 
        ForeColor="Green" Text="0"></asp:Label>
    <br />
    <asp:ListBox ID="ListBox1" runat="server" Height="71px" Width="60%">
    </asp:ListBox>
    <br />
    <br />
    Paid Amount:
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    Remarks if any:
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Pay &amp; Return" />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Lib/Home.aspx">Cancle</asp:HyperLink>
</center>
</asp:Content>

