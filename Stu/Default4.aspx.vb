
Partial Class Stu_Default4
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        err.Text = ""
        Try
            SqlDataSource1.InsertCommand = "INSERT INTO msg (userid,subject,body) VALUES ('" & Session("user") & "','" & TextBox1.Text & "','" & TextBox2.Text & "')"
            SqlDataSource1.Insert()
            err.Text = "Message Sent"
            err.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            err.Text = ex.Message
            err.ForeColor = Drawing.Color.Red
        End Try

    End Sub
End Class
