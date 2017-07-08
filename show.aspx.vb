
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("url") = "") Then
            Return
        End If
        Image1.ImageUrl = New Database().getImageUrl(Request.QueryString("url"))
        If Image1.ImageUrl = "" Then
            Image1.ImageUrl = "~/images/noimg.jpg"
        End If
    End Sub
End Class
