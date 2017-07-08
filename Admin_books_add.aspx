<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_books_add.aspx.vb" Inherits="Default2" title="Add New Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        text-align: left;
    }
        .style2
        {
            width: 374px;
        }
        .style3
        {
            text-align: left;
            width: 33px;
        }
        .style4
        {
            width: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="text-align: center">
    <br />
    <center>
    Enter ISBN:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Load" />
        <table style="width: 54%;">
            <tr>
                <td class="style2">
    <table style="width: 100%;">
        <tr>
            <td style="text-align: left">
                Title</td>
            <td class="style1">
                <asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="*" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                Author</td>
            <td class="style1">
                <asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text="*" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                Publisher</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox4" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                ISBN(10)</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox5" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                ISBN(13)</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox6" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                Google Image</td>
            <td style="text-align: left">
                <asp:TextBox ID="TextBox7" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                Select Image</td>
            <td style="text-align: left">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td style="text-align: left" class="style4">
                &nbsp;</td>
        </tr>
    </table>
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="180px" Width="213px" />
                </td>
            </tr>
        </table>
</p>
<p style="text-align: center">
    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
</p>
<p style="text-align: center">
    <asp:Button ID="Button2" runat="server" Text="Save" />
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        DeleteCommand="DELETE FROM [Books] WHERE [ID] = @original_ID AND (([Book_ISDN13] = @original_Book_ISDN13) OR ([Book_ISDN13] IS NULL AND @original_Book_ISDN13 IS NULL)) AND (([BooK_ISDN10] = @original_BooK_ISDN10) OR ([BooK_ISDN10] IS NULL AND @original_BooK_ISDN10 IS NULL)) AND [Book_Title] = @original_Book_Title AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND (([Publication] = @original_Publication) OR ([Publication] IS NULL AND @original_Publication IS NULL)) AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL))" 
        InsertCommand="INSERT INTO [Books] ([Book_ISDN13], [BooK_ISDN10], [Book_Title], [Book_Author], [Publication], [img]) VALUES (@Book_ISDN13, @BooK_ISDN10, @Book_Title, @Book_Author, @Publication, @img)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Books]" 
        UpdateCommand="UPDATE [Books] SET [Book_ISDN13] = @Book_ISDN13, [BooK_ISDN10] = @BooK_ISDN10, [Book_Title] = @Book_Title, [Book_Author] = @Book_Author, [Publication] = @Publication, [img] = @img WHERE [ID] = @original_ID AND (([Book_ISDN13] = @original_Book_ISDN13) OR ([Book_ISDN13] IS NULL AND @original_Book_ISDN13 IS NULL)) AND (([BooK_ISDN10] = @original_BooK_ISDN10) OR ([BooK_ISDN10] IS NULL AND @original_BooK_ISDN10 IS NULL)) AND [Book_Title] = @original_Book_Title AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND (([Publication] = @original_Publication) OR ([Publication] IS NULL AND @original_Publication IS NULL)) AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Book_ISDN13" Type="String" />
            <asp:Parameter Name="original_BooK_ISDN10" Type="String" />
            <asp:Parameter Name="original_Book_Title" Type="String" />
            <asp:Parameter Name="original_Book_Author" Type="String" />
            <asp:Parameter Name="original_Publication" Type="String" />
            <asp:Parameter Name="original_img" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Book_ISDN13" Type="String" />
            <asp:Parameter Name="BooK_ISDN10" Type="String" />
            <asp:Parameter Name="Book_Title" Type="String" />
            <asp:Parameter Name="Book_Author" Type="String" />
            <asp:Parameter Name="Publication" Type="String" />
            <asp:Parameter Name="img" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Book_ISDN13" Type="String" />
            <asp:Parameter Name="original_BooK_ISDN10" Type="String" />
            <asp:Parameter Name="original_Book_Title" Type="String" />
            <asp:Parameter Name="original_Book_Author" Type="String" />
            <asp:Parameter Name="original_Publication" Type="String" />
            <asp:Parameter Name="original_img" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Book_ISDN13" Type="String" />
            <asp:Parameter Name="BooK_ISDN10" Type="String" />
            <asp:Parameter Name="Book_Title" Type="String" />
            <asp:Parameter Name="Book_Author" Type="String" />
            <asp:Parameter Name="Publication" Type="String" />
            <asp:Parameter Name="img" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    </center>
</p>
</asp:Content>

