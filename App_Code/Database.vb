Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Database
    Public connStr As String = ConfigurationManager.ConnectionStrings("LMSConnectionString").ConnectionString
    'Data Source=DELL\SQLEXPRESS;Initial Catalog=LMS;Integrated Security=True
    Public Function getGraceDay() As Integer
        Return 20
    End Function
    Public Function getEachDayFine() As Integer
        Return 2
    End Function
    Public Sub SendMessage(ByVal user As String, ByVal subj As String, ByVal msg As String)
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("INSERT ", con)
        cmd.ExecuteNonQuery()
    End Sub

    Public Function getName(ByVal userid As String) As String
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT FullName From UserDetails WHERE UserName='" & userid & "'", con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Return rs(0)
        Else
            Return 0
        End If
    End Function
    Public Function getFineOnBook(ByVal bookid As String) As Integer
        Dim ids() As String
        ids = bookid.Split("_")
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT DATEDIFF(day, lastBorrowed, { fn NOW() }) From bookCopy WHERE id=" & ids(0) & " and copyid=" & ids(1), con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Return rs(0)
        Else
            Return 0
        End If
    End Function
    Public Function getFine(ByVal libr As String) As String
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT SUM(PaidAmt) FROM Fine WHERE  CONVERT(VARCHAR(10),DateRec,111)=CONVERT(VARCHAR(10),{fn now()},111) AND ReceivedBy = '" & libr & "'", con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Try
                Return rs(0)
            Catch ex As Exception
                Return 0
            End Try

        Else
            Return ""
        End If
    End Function
    Public Sub IssueBook(ByVal BookID As Integer, ByVal CopyID As Integer, ByVal issuedby As String, ByVal issuedto As String)
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()

        Dim str1 As String

        str1 = "UPDATE bookCopy SET available=0, lastBorrowed={fn now()}, borrowedby='" & issuedto & "' WHERE id=" & BookID & " AND copyid=" & CopyID
        cmd = New SqlCommand(str1, con)
        rs = cmd.ExecuteReader()
        rs.Close()
        str1 = "INSERT INTO TransactionLog(Bookid,Copyid,issuedby,issuedto,issuedate) VALUES (" & BookID & "," & CopyID & ",'" & issuedby & "','" & issuedto & "',{fn now()})"
        cmd = New SqlCommand(str1, con)
        rs = cmd.ExecuteReader()
        rs.Close()

    End Sub
    Public Sub ReturnBook(ByVal BookID As Integer, ByVal CopyID As Integer, ByVal recvBy As String, ByVal fineAmt As Integer, ByVal finePaid As Integer, ByVal Remarks As String)
        'Fine/TransactionLog/bookCopy
        Dim str As String
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()

        str = "UPDATE bookCopy SET available=1, lastSubmited={fn now()} WHERE id=" & BookID & " and copyid=" & CopyID 'BookCopy
        cmd = New SqlCommand(str, con)
        rs = cmd.ExecuteReader()
        rs.Close()
        str = "INSERT INTO Fine VALUES (" & fineAmt & "," & finePaid & "," & BookID & ",'','" & recvBy & "',{fn now()},'" & Remarks & "')"
        cmd = New SqlCommand(str, con)
        rs = cmd.ExecuteReader()
        rs.Close()
        str = "UPDATE TransactionLog SET recvby='" & recvBy & "', recvDate={fn now()},fineamt=" & fineAmt & ",finePaid=" & finePaid & ",remarks='" & Remarks & "' WHERE bookid=" & BookID & " AND copyid=" & CopyID
        cmd = New SqlCommand(str, con)
        rs = cmd.ExecuteReader()
        rs.Close()
    End Sub
    Public Function BookDetail2(ByVal bookID As Integer, ByVal copyID As Integer) As String
        If BookAvailable(bookID, copyID) Then
            Return "NONE"
        End If
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT * FROM Books WHERE id=" & bookID, con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Return bookID & "t" & copyID & ":" & rs("book_title")
        Else
            Return ""
        End If
    End Function
    Public Function BookDetail(ByVal bookID As Integer, ByVal copyID As Integer) As String
        
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT * FROM Books WHERE id=" & bookID, con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Return bookID & "t" & copyID & ":" & rs("book_title")
        Else
            Return ""
        End If
    End Function
    Public Function BookAvailable(ByVal bookID As Integer, ByVal copyID As Integer) As Integer
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT available FROM bookCopy WHERE id=" & bookID & " AND copyid=" & copyID, con)
        rs = cmd.ExecuteReader()
        If rs.Read() Then
            Return rs(0)
        Else
            Return -1
        End If
    End Function
    Public Function AvailableToUse(ByVal user As String) As Boolean
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT * FROM users WHERE username='" & user & "'", con)
        rs = cmd.ExecuteReader()
        Return Not rs.Read()
    End Function
    Public Function Login(ByVal usr As String, ByVal pass As String, ByVal type As String) As Boolean
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT * FROM users WHERE username='" & usr & "' and password='" & pass & "' and type='" & type & "'", con)
        rs = cmd.ExecuteReader()
        Return rs.Read()
    End Function
    Public Function getMaxId() As Integer
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT Count(*) FROM Books", con)
        rs = cmd.ExecuteReader()
        rs.Read()
        Return rs(0)
    End Function
    Public Function getMaxId(ByVal BookId As Integer) As Integer
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT Max(copyid) FROM BookCopy WHERE id=" & BookId, con)
        rs = cmd.ExecuteReader()
        If Not rs.Read() Then
            Return 0
        End If
        Try
            Return rs(0)
        Catch ex As Exception
            Return 0
        End Try

    End Function
    Public Sub Run(ByVal cmnd As String)
        Dim con As New SqlConnection(connStr)

        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand(cmnd, con)
        cmd.ExecuteNonQuery()

    End Sub
    Public Function getImageUrl(ByVal BookId As Integer) As String
        Dim con As New SqlConnection(connStr)
        Dim rs As SqlDataReader
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("SELECT img FROM Books WHERE id=" & BookId, con)
        rs = cmd.ExecuteReader()
        If Not rs.Read() Then
            Return 0
        End If
        Try
            Return rs(0)
        Catch ex As Exception
            Return 0
        End Try

    End Function
End Class
