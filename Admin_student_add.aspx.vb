
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim d As New Database

        If d.AvailableToUse(TextBox1.Text) And TextBox1.Text <> "" Then
            Image1.ImageUrl = "images/tick.png"
        Else
            Image1.ImageUrl = "images/no.png"
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox3.Text = Now.Millisecond & IIf(Now.Second Mod 2 = 0, "$", "#") & Now.DayOfWeek & IIf(Now.Millisecond Mod 2 = 0, "$", "#") & New Random(Now.Second).Next() Mod 100
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim d As New Database
        Dim bool As Boolean = False
        If d.AvailableToUse(TextBox1.Text) And TextBox1.Text <> "" Then
            If TextBox2.Text <> "" And TextBox3.Text <> "" Then
                If TextBox5.Text <> "" Then
                    If TextBox5.Text.Contains("@") Then
                        Label1.Text = ""
                        bool = True
                    Else
                        Label1.Text = "Enter Valid email id"
                    End If
                Else
                    Label1.Text = ""
                    bool = True
                End If
            Else
                Label1.Text = "Enter Valid Name and Password"
            End If
        Else
            Label1.Text = "Enter Valid User Name"
        End If
        If bool = True Then
            Dim str As String = "INSERT INTO userDetails VALUES('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox4.Text & "','" & TextBox6.Text & "','" & TextBox5.Text & "')"
            d.Run(str)
            str = "INSERT INTO users VALUES('" & TextBox1.Text & "','" & TextBox3.Text & "','S')"
            d.Run(str)
            TextBox1.Text = ""
            TextBox2.Text = ""
            TextBox3.Text = ""
            TextBox4.Text = ""
            TextBox5.Text = ""
            TextBox6.Text = ""
            Label1.Text = ""
        End If

    End Sub
End Class
