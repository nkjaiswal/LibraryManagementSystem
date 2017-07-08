<%@ Page Language="VB" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="addmore.aspx.vb" Inherits="Default2" title="Add Book Copies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <p style="text-align: center">
        &nbsp;</p>
    <p style="text-align: center">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2" DataKeyNames="Book_ISDN13" 
            DataSourceID="SqlDataSource2" Height="50px" Width="646px">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="Book_Title" HeaderText="Book Title" 
                    SortExpression="Book_Title" />
                <asp:BoundField DataField="Book_Author" HeaderText="Book Author" 
                    SortExpression="Book_Author" />
                <asp:BoundField DataField="Publication" HeaderText="Publication" 
                    SortExpression="Publication" />
                <asp:BoundField DataField="Book_ISDN13" HeaderText="ISDN13" ReadOnly="True" 
                    SortExpression="Book_ISDN13" />
                <asp:BoundField DataField="BooK_ISDN10" HeaderText="SDN10" 
                    SortExpression="BooK_ISDN10" />
            </Fields>
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT [Book_Title], [Book_Author], [Publication], [Book_ISDN13], [BooK_ISDN10] FROM [Books] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="text-align: center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="copyid" HeaderText="Copyies" 
                    SortExpression="copyid" />
                <asp:BoundField DataField="borrowedby" HeaderText="Borrowed By" 
                    SortExpression="borrowedby" />
                <asp:BoundField DataField="lastBorrowed" HeaderText="Last Borrowed" 
                    SortExpression="lastBorrowed" />
                <asp:BoundField DataField="lastSubmited" HeaderText="Last Submited" 
                    SortExpression="lastSubmited" />
                <asp:TemplateField HeaderText="Available">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# IIf(Eval("available")=0,"Borrowed","On self") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT * FROM [bookCopy] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <hr style="height: -12px; width: 804px" />
    <p style="text-align: center">
        How Many New Copies to add:
        <asp:TextBox ID="TextBox1" runat="server" Width="48px"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Add" />
        <br />
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" ForeColor="Maroon" 
            style="font-weight: 700"></asp:Label>
    </p>
    <p>
    </p>
    </center>
</asp:Content>

