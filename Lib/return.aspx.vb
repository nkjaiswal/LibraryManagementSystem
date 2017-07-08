
Partial Class Lib_Default
    Inherits System.Web.UI.Page
    Dim D As New Database
    Dim fine As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim book As String = Request.QueryString("bookid")
        If book = "" Then
            Return
        End If
        Dim day As Integer = D.getFineOnBook(book)

        If day > D.getGraceDay() Then
            fine = (day - D.getGraceDay()) * D.getEachDayFine()
        Else
            fine = 0
        End If
        Label1.Text = "Fine on this book (" & book & ") is: Rs. " & fine

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Image1.Visible = True Then
            Response.Redirect("issue.aspx")
        End If
        If TextBox1.Text = "" Then
            TextBox1.Text = "0"
        End If
        If fine <> TextBox1.Text And TextBox2.Text = "" Then
            Label2.Text = "*"
            Return
        End If
        Label2.Text = ""
        Dim ids() As String
        ids = Request.QueryString("bookid").Split("_")
        D.ReturnBook(ids(0), ids(1), Session("user"), fine, TextBox1.Text, TextBox2.Text)
        Image1.Visible = True
    End Sub
End Class
