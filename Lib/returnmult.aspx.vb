
Partial Class Lib_Default
    Inherits System.Web.UI.Page
    Dim d As New Database
    Dim fine As Integer
    Dim day As Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim bk As String = d.BookDetail2(TextBox1.Text, TextBox2.Text)
        Label2.Text = ""
        If bk = "NONE" Then
            Label2.Text = "This book is not yet issued"

            Return
        End If

        ListBox1.Items.Add(bk)
        day = d.getFineOnBook(TextBox1.Text & "_" & TextBox2.Text)
        If day > d.getGraceDay() Then
            day = (day - d.getGraceDay()) * d.getEachDayFine()
        Else
            day = 0
        End If

        Label1.Text = Label1.Text + day
        fine = Label1.Text
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Image1.Visible Then
            Response.Redirect("Home.aspx")
        End If
        If TextBox3.Text = "" Then
            TextBox3.Text = "0"
        End If
        If fine <> TextBox3.Text And TextBox4.Text = "" Then
            Label2.Text = "*"
            Return
        End If
        Label2.Text = ""

        Dim item() As String
        For l = 0 To ListBox1.Items.Count - 1
            item = ListBox1.Items.Item(l).ToString.Split(":")
            Dim ids() As String
            ids = item(0).Split("t")
            d.ReturnBook(ids(0), ids(1), Session("user"), fine, TextBox3.Text, TextBox4.Text)
        Next
        Image1.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        day = 0
        fine = 0
    End Sub
End Class
