<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Admin_Fine_details.aspx.vb" Inherits="Default2" title="Unbalanced Fain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1" Width="70%">
        <RowStyle BackColor="White" ForeColor="#003399" />
        <Columns>
            <asp:BoundField DataField="FineAmt" HeaderText="Fine Amount" 
                SortExpression="FineAmt" />
            <asp:BoundField DataField="PaidAmt" HeaderText="Paid Amount" 
                SortExpression="PaidAmt" />
            <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
                SortExpression="Book_Title" />
            <asp:BoundField DataField="DateRec" HeaderText="Received Date" 
                SortExpression="DateRec" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                SortExpression="Remarks" />
        </Columns>
        <EmptyDataTemplate>
            No Entry Available
        </EmptyDataTemplate>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
        SelectCommand="SELECT Fine.FineAmt, Fine.PaidAmt, Books.Book_Title, Fine.DateRec, Fine.Remarks FROM Fine INNER JOIN Books ON Books.ID = Fine.Bookid WHERE (Fine.FineAmt &lt;&gt; Fine.PaidAmt) AND (Fine.ReceivedBy = @rec)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec" QueryStringField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
</center>
</asp:Content>

