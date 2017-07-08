<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_student_add.aspx.vb" Inherits="Default2" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <table style="width: 41%;">
            <tr>
                <td style="text-align: left">
                    User Name</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" Height="20px" Width="20px" />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Check Availability" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Full Name</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Password</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Generate" />
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Address</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox4" runat="server" Width="331px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Email</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    Mobile</td>
                <td style="text-align: left">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Button ID="Button3" runat="server" Text="Save" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>

