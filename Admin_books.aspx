<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_books.aspx.vb" Inherits="Default2" title="Show All Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<center>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add Books" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
    CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        AllowPaging="True" AllowSorting="True" PageSize="15" Width="99%">
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="BookID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Book_ISDN13" HeaderText="ISDN(13)" 
            SortExpression="Book_ISDN13" />
        <asp:BoundField DataField="BooK_ISDN10" HeaderText="ISDN(10)" 
            SortExpression="BooK_ISDN10" />
        <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
            SortExpression="Book_Title" />
        <asp:BoundField DataField="Book_Author" HeaderText="Author" 
            SortExpression="Book_Author" />
        <asp:BoundField DataField="Publication" HeaderText="Publication" 
            SortExpression="Publication" />
        <asp:BoundField DataField="C" HeaderText="Copys" />
        <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="addmore.aspx?id={0}" DataTextFormatString="id" 
            HeaderText="Add Copyies" NavigateUrl="addmore.aspx?id={0}" Text="+" />
        <asp:HyperLinkField HeaderText="View Image" Text="Show..." Target ="_blank" 
            DataNavigateUrlFields="id" DataNavigateUrlFormatString="show.aspx?url={0}" 
            DataTextFormatString="img" NavigateUrl="show.aspx?url={0}"/>
    </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <AlternatingRowStyle BackColor="#F7F7F7" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
    DeleteCommand="DELETE FROM [Books] WHERE [ID] = @original_ID AND (([Book_ISDN13] = @original_Book_ISDN13) OR ([Book_ISDN13] IS NULL AND @original_Book_ISDN13 IS NULL)) AND (([BooK_ISDN10] = @original_BooK_ISDN10) OR ([BooK_ISDN10] IS NULL AND @original_BooK_ISDN10 IS NULL)) AND [Book_Title] = @original_Book_Title AND (([Book_Author] = @original_Book_Author) OR ([Book_Author] IS NULL AND @original_Book_Author IS NULL)) AND (([Publication] = @original_Publication) OR ([Publication] IS NULL AND @original_Publication IS NULL)) AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL))" 
    InsertCommand="INSERT INTO [Books] ([Book_ISDN13], [BooK_ISDN10], [Book_Title], [Book_Author], [Publication], [img]) VALUES (@Book_ISDN13, @BooK_ISDN10, @Book_Title, @Book_Author, @Publication, @img)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT *,(SELECT count(*) From bookCopy where bookCopy.id=books.id) As C  FROM Books order by id" 
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

    <br />
    <br />

</center>
</asp:Content>

