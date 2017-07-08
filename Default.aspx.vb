
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim d As New Database
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim type As String = ""
        If RadioButton1.Checked = True Then
            type = "A"
        ElseIf RadioButton2.Checked = True Then
            type = "L"
        Else
            type = "S"
        End If
        If d.Login(TextBox1.Text, TextBox2.Text, type) Then
            Session("type") = type
            Session("user") = TextBox1.Text
            Label1.Text = ""
            If type = "A" Then
                Response.Redirect("Admin_welcome.aspx")
            ElseIf type = "L" Then
                Response.Redirect("Lib/Home.aspx")
            Else
                Response.Redirect("Stu/Default.aspx")
            End If


        Else
            Label1.Text = "Wrong UserName And/Or Password"
        End If

    End Sub
End Class
