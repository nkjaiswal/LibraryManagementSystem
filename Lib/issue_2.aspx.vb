
Partial Class Lib_Default
    Inherits System.Web.UI.Page
    Dim d As New Database
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label3.Text = ""
        Dim ava As Integer = d.BookAvailable(TextBox1.Text, TextBox2.Text)
        If ava = 1 Then
            ListBox1.Items.Add(d.BookDetail(TextBox1.Text, TextBox2.Text))
            TextBox1.Text = ""
            TextBox2.Text = ""
        ElseIf ava = 0 Then
            Label3.Text = "Sorry Book is already issued"
        Else
            Label3.Text = "Sorry Book does not exists"
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        ListBox1.Items.Remove(ListBox1.SelectedItem)
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim l As Integer
        Dim str As String = ""

        Dim item() As String
        For l = 0 To ListBox1.Items.Count - 1
            item = ListBox1.Items.Item(l).ToString.Split(":")
            str &= item(0) & ";"
        Next
        Response.Redirect("issue_3.aspx?books=" & str & "&stu_id=" & Request.QueryString("user"))
    End Sub
End Class
