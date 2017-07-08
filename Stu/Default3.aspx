<%@ Page Title="" Language="VB" MasterPageFile="~/Stu/MasterPage.master" AutoEventWireup="false" CodeFile="Default3.aspx.vb" Inherits="Stu_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br />
    <table style="width:100%;">
    <tr>
        <td>
            Old Password</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            New Password</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Re enter Password</td>
        <td style="text-align: left">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: left">
            <asp:Button ID="Button1" runat="server" Text="Submit" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: left">
            <asp:Label ID="err" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

