<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_lib_fine_src.aspx.vb" Inherits="Default2" Title="Search Librarian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <br />
    <br />
    <br />
    Enter Librarian ID:
    <asp:TextBox ID="libuser" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Load" />
</center>
</asp:Content>

