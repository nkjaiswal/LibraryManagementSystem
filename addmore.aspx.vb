
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim db As New Database
        Dim c As Integer = db.getMaxId(Request.QueryString("id"))
        Dim i As Integer = 0
        Label2.Text = "New Book Ids are: "
        For i = 1 To TextBox1.Text
            Dim str As String = "INSERT INTO bookCopy VALUES (" & Request.QueryString("id") & "," & c + i & ",1,'','','')"
            db.Run(str)
            Label2.Text &= Request.QueryString("id") & "#" & c + i & ",   "
        Next
    End Sub
End Class
