
Partial Class Librarian_MasterPage
    Inherits System.Web.UI.MasterPage
    Dim d As New Database
    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("type") <> "L" Or Session("user") = "" Then
            Response.Redirect("../default.aspx")

        End If
        Menu1.Items.Item(3).Text = "Fine: Rs." & d.getFine(Session("user"))
    End Sub
End Class

