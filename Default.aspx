<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            color: #0066FF;
            font-weight: bold;
            font-size: x-large;
        }
        .style3
        {
            text-decoration: underline;
            font-size: small;
        }
        .style4
        {
            width: 645px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFCC" Height="600px" 
            style="text-align: center" Width="100%">
            <br />
            <center>
            <span class="style2">Library Management System</span><br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <span class="style3">LOGIN FORM<br />
            </span>
            <br />
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Admin" GroupName="G1" />
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Librarian" GroupName="G1" />
            <asp:RadioButton ID="RadioButton3" runat="server" Checked="True" 
                Text="Student/Borrower" GroupName="G1" />
            <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="style4">
                            <asp:Image ID="Image1" runat="server" Height="109px" 
                                ImageUrl="~/images/login.jpg" Width="124px" />
                        </td>
                        <td style="text-align: left">
                            <table style="width: 38%;">
                                <tr>
                                    <td style="text-align: left">
                                        User Name</td>
                                    <td class="style1">
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        Password</td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            <br />
            <asp:Button ID="Button1" runat="server" BorderColor="#3366FF" 
                BorderStyle="Solid" style="text-align: right" Text="Login" />
            <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/search.aspx">Search 
                Books</asp:HyperLink>
            </center>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
