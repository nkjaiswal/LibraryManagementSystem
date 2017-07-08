
Partial Class Lib_Default
    Inherits System.Web.UI.Page
    Dim d As New Database
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim books As String = Request.QueryString("books")
        Dim b() As String
        If books = "" Then
            Return
        End If
        b = books.Split(";")
        Dim str As String
        For Each str In b
            If str <> "" Then
                Dim ids() As String
                ids = str.Split("t")
                d.IssueBook(ids(0), ids(1), Session("user"), Request.QueryString("stu_id"))
                Label1.Text &= d.BookDetail(ids(0), ids(1)) & "<img src='../images/tick.png'><hr width=70%>"
            End If
        Next
    End Sub
End Class
