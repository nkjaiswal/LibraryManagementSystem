Imports Microsoft.VisualBasic

Public Class Book
    Public author, Title, ISBN10, ISBN13, LargeImageUrl, publisher As String
    Public Function Show() As String
        Return "Title:" & Title & ", Author:" & author & ", Publisher:" & publisher & ", ISBN10:" & ISBN10 & ", ISBN13:" & ISBN13
    End Function
    Public Sub Load(ByVal isb As String)
        Dim sr As IO.StreamReader = New System.IO.StreamReader(System.Net.HttpWebRequest.Create("https://www.googleapis.com/books/v1/volumes?q=isbn:" & isb).GetResponse().GetResponseStream)
        Dim s As String = ""
        While (Not s.Contains("""isEbook"":")) And (Not s.Contains("""totalItems"": 0"))
            s = sr.ReadLine
            If s.Contains("""title"":") Then
                Title = s.Replace("""title"": ", "").Replace(""",", "")
            ElseIf s.Contains("""authors"":") Then
                s = sr.ReadLine
                author = ""
                While Not s.Contains("],")
                    author &= s.Replace("""", "")
                    s = sr.ReadLine
                End While
            ElseIf s.Contains("""publisher"":") Then
                publisher = s.Replace("""publisher"":", "").Replace(""",", "")
            ElseIf s.Contains("""type"": ""ISBN_10"",") Then
                s = sr.ReadLine
                ISBN10 = s.Replace("""identifier"": """, "").Replace(""",", "")
            ElseIf s.Contains("""type"": ""ISBN_13"",") Then
                s = sr.ReadLine
                ISBN13 = s.Replace("""identifier"": """, "").Replace(""",", "")
            ElseIf s.Contains("""thumbnail"":") Then
                LargeImageUrl = s
                LargeImageUrl = Trim(LargeImageUrl.Replace("""thumbnail"": """, "").Replace("""", ""))
            End If
        End While
    End Sub
End Class

