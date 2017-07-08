
Partial Class Stu_MasterPage
    Inherits System.Web.UI.MasterPage
    Dim db As New Database
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("type") <> "S" Or Session("user") = "" Then
            Response.Redirect("../Default.aspx")
        Else
            Label1.Text = "Hello " & db.getName(Session("user")) & "(" & Session("user") & ")!!!"
        End If
    End Sub
End Class

