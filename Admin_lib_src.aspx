<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_lib_src.aspx.vb" Inherits="Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p>
    Enter ID:
    <asp:TextBox ID="Uname" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Show..." />
</p>
</center>
</asp:Content>

