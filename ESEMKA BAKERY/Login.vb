Public Class Login
    Dim db As New Database
    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        db.conn()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If db.login(TextBox1.Text, TextBox2.Text) = True Then
            Main_Frm.Show()
            Me.Close()
        ElseIf db.login(TextBox1.Text, TextBox2.Text) = False Then
            MsgBox("Login failed, check your Email and Password", MsgBoxStyle.Exclamation)
        End If
    End Sub
End Class
