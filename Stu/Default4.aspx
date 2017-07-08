<%@ Page Title="" Language="VB" MasterPageFile="~/Stu/MasterPage.master" AutoEventWireup="false" CodeFile="Default4.aspx.vb" Inherits="Stu_Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <table style="width: 62%;">
        <tr>
            <td>
                Subject</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox1" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                Message</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox2" runat="server" Height="81px" TextMode="MultiLine" 
                    Width="265px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="Button1" runat="server" Text="Send" />
            </td>
        </tr>
    </table>
    <asp:Label ID="err" runat="server"></asp:Label>
    </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        DeleteCommand="DELETE FROM [msg] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [msg] ([userid], [subject], [body]) VALUES (@userid, @subject, @body)" 
        SelectCommand="SELECT * FROM [msg]" 
        UpdateCommand="UPDATE [msg] SET [userid] = @userid, [subject] = @subject, [body] = @body WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userid" Type="String" />
            <asp:Parameter Name="subject" Type="String" />
            <asp:Parameter Name="body" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="userid" Type="String" />
            <asp:Parameter Name="subject" Type="String" />
            <asp:Parameter Name="body" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

