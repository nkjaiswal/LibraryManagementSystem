
Partial Class Default2
    Inherits System.Web.UI.Page
    Dim d As New Database
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If TextBox2.Text = "" Or TextBox3.Text = "" Then
            Label1.Visible = True
            Label2.Visible = True
            Return
        Else
            Label1.Visible = False
            Label2.Visible = False
            Dim fn As String = ""
            If FileUpload1.FileName <> "" Then
                Dim idx As Integer = d.getMaxId()
                FileUpload1.SaveAs(Server.MapPath("") & "\images\img" & idx + 1 & ".jpg")
                fn = "\images\img" & idx + 1 & ".jpg"
            Else
                fn = TextBox7.Text
            End If
            If fn = "" Then
                fn = "\images\noimg.jpg"
            End If
            Dim str As String = "INSERT INTO [Books]([Book_ISDN13],[BooK_ISDN10],[Book_Title],[Book_Author],[Publication],[img])VALUES"
            str &= "('" & TextBox6.Text & "',"
            str &= "'" & TextBox5.Text & "',"
            str &= "'" & TextBox2.Text & "',"
            str &= "'" & TextBox3.Text & "',"
            str &= "'" & TextBox4.Text & "',"
            str &= "'" & fn & "')"
            SqlDataSource1.InsertCommand = str
            Try
                SqlDataSource1.Insert()
                Label3.Text = ""
            Catch ex As Exception
                Label3.Text = ex.Message
            End Try

            TextBox1.Text = ""
            TextBox2.Text = ""
            TextBox3.Text = ""
            TextBox4.Text = ""
            TextBox5.Text = ""
            TextBox6.Text = ""
            TextBox7.Text = ""
        End If

    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim b As New Book
        b.Load(TextBox1.Text)
        TextBox6.Text = Trim(b.ISBN13).Replace("""", "")
        TextBox5.Text = Trim(b.ISBN10).Replace("""", "")
        TextBox2.Text = Trim(b.Title).Replace("""", "")
        TextBox3.Text = Trim(b.author).Replace("""", "")
        TextBox4.Text = Trim(b.publisher).Replace("""", "")
        TextBox7.Text = Trim(b.LargeImageUrl).Replace("""", "")
        Image1.ImageUrl = Trim(b.LargeImageUrl).Replace("""", "")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
