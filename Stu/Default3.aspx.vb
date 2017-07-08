
Partial Class Stu_Default3
    Inherits System.Web.UI.Page
    Dim db As New Database
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        err.Text = ""
        err.ForeColor = Drawing.Color.Red
        If TextBox2.Text.Length < 3 Then
            err.Text = "Password is too small"
            Return
        End If
        If TextBox2.Text <> TextBox3.Text Then
            err.Text = "New Password and re enter password should match"
            Return
        End If
        If db.Login(Session("user"), TextBox1.Text, "S") Then
            db.Run("UPDATE users SET password='" & TextBox2.Text & "' WHERE username = '" & Session("user") & "'")
            err.Text = "Password Changed"
            err.ForeColor = Drawing.Color.Green
        Else
            err.Text = "Wrong Password"
        End If
    End Sub
End Class
