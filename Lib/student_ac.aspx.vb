
Partial Class Lib_Default2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("student_ac.aspx?std=" & TextBox1.Text)
    End Sub
End Class
