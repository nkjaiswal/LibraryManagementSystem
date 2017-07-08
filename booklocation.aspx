<%@ Page Language="VB" AutoEventWireup="false" CodeFile="booklocation.aspx.vb" Inherits="booklocation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-family: "Comic Sans MS";
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body bgcolor="#CCFFFF">
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:Image ID="Image1" runat="server" Height="97px" 
            ImageUrl="~/images/Hitk_1.png" Width="136px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style1">HERITAGE INSTITUTE OF 
        TECHNOLOGY, KOLKATA</span><br />
        <hr style="width: 1058px" />
        
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/search.aspx">Back</asp:HyperLink>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" Width="60%" 
            EmptyDataText="No Copyies of this book is available">
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
                <asp:BoundField DataField="copyid" HeaderText="Copy No" 
                    SortExpression="copyid" />
                <asp:TemplateField HeaderText="Book Location">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# IIf(Eval("available")=0,"Borrowed","On self") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT [copyid], [available] FROM [bookCopy] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </center>
    </div>
    </form>
</body>
</html>
