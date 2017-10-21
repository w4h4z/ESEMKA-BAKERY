Imports System.Net.Mail
Imports System.Data.SqlClient
Public Class Main_Frm
    Dim db As New Database
    Dim MailAddress As MailAddress
    Dim dbcomm As New SqlCommand
    Dim dbread As SqlDataReader
    Dim sql As String
    Private Sub Main_Frm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet3.Food' table. You can move, or remove it, as needed.
        Me.FoodTableAdapter1.Fill(Me.ESEMKABAKERYDataSet3.Food)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet3.Employee' table. You can move, or remove it, as needed.
        Me.EmployeeTableAdapter2.Fill(Me.ESEMKABAKERYDataSet3.Employee)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet6.IncomingRawView' table. You can move, or remove it, as needed.
        Me.IncomingRawViewTableAdapter2.Fill(Me.ESEMKABAKERYDataSet6.IncomingRawView)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet5.IncomingRawView' table. You can move, or remove it, as needed.
        Me.IncomingRawViewTableAdapter1.Fill(Me.ESEMKABAKERYDataSet5.IncomingRawView)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet4.IncomingRawView' table. You can move, or remove it, as needed.
        Me.IncomingRawViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet4.IncomingRawView)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet3.RawMaterial' table. You can move, or remove it, as needed.
        Me.RawMaterialTableAdapter1.Fill(Me.ESEMKABAKERYDataSet3.RawMaterial)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet2.RecipeHeaderView' table. You can move, or remove it, as needed.
        Me.RecipeHeaderViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet2.RecipeHeaderView)
        'TODO: This line of code loads data into the 'ESEMKABAKERYDataSet1.Food' table. You can move, or remove it, as needed.
        Me.FoodTableAdapter.Fill(Me.ESEMKABAKERYDataSet1.Food)

        TabControl1.ItemSize = New Size(0, 1)
        TabControl1.SizeMode = TabSizeMode.Fixed

        db.conn()
        dataEmployee()
        dataProduction()
        dataViewProduction()
        checkedListProduct()
    End Sub

#Region "Side Bar"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        TabControl1.SelectTab(0)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        TabControl1.SelectTab(1)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        TabControl1.SelectTab(2)
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        TabControl1.SelectTab(3)
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        TabControl1.SelectTab(4)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        TabControl1.SelectTab(5)
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        TabControl1.SelectTab(6)
    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        TabControl1.SelectTab(7)
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        Login.Show()
        Me.Close()
    End Sub
#End Region

#Region "Employee"
    Private Sub resetEmployee()
        txtIdEmployee.Text = ""
        txtNameEmployee.Text = ""
        txtPassEmployee.Text = ""
        txtAddressEmployee.Text = ""
        txtPhoneEmployee.Text = ""
        txtEmailEmployee.Text = ""
    End Sub

    Private Sub dataEmployee()
        DataGridViewEmployee.Rows.Clear()
        sql = "select * from Employee"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                DataGridViewEmployee.Rows.Add(dbread("EmployeeId"), dbread("EmployeeName"), dbread("Password"), dbread("EmployeeAddress"), dbread("EmployeePhone"), dbread("Email"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub txtPhoneEmployee_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txtPhoneEmployee.KeyPress
        If Asc(e.KeyChar) <> 8 Then
            If Asc(e.KeyChar) < 48 Or Asc(e.KeyChar) > 57 Then
                e.Handled = True
            End If
        End If
    End Sub

    Private Sub btnAddEmployee_Click(sender As Object, e As EventArgs) Handles btnAddEmployee.Click
        If txtNameEmployee.Text = "" Or txtPassEmployee.Text = "" Or txtAddressEmployee.Text = "" Or txtPhoneEmployee.Text = "" Or txtEmailEmployee.Text = "" Then
            MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        Try
            MailAddress = New MailAddress(txtEmailEmployee.Text)
        Catch ex As Exception
            MsgBox("Email yang anda masukkan tidak valid", MsgBoxStyle.Exclamation)
            Exit Sub
        End Try

        db.insertEmployee(txtNameEmployee.Text, txtPassEmployee.Text, txtAddressEmployee.Text, txtPhoneEmployee.Text, "1", txtEmailEmployee.Text)

        MsgBox("Insert data success", MsgBoxStyle.Information)
        dataEmployee()
        resetEmployee()
    End Sub

    Private Sub btnDeleteEmployee_Click(sender As Object, e As EventArgs) Handles btnDeleteEmployee.Click
        If txtIdEmployee.Text = "" Then
            MsgBox("Select data first!", MsgBoxStyle.Exclamation)
            Exit Sub
        End If
        db.deleteEmployee(txtIdEmployee.Text)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        dataEmployee()
        resetEmployee()
    End Sub

    Private Sub btnEditEmployee_Click(sender As Object, e As EventArgs) Handles btnEditEmployee.Click
        If txtNameEmployee.Text = "" Or txtPassEmployee.Text = "" Or txtAddressEmployee.Text = "" Or txtPhoneEmployee.Text = "" Or txtEmailEmployee.Text = "" Then
            MsgBox("All data must be fill", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        Try
            MailAddress = New MailAddress(txtEmailEmployee.Text)
        Catch ex As Exception
            MsgBox("Email yang anda masukkan tidak valid", MsgBoxStyle.Exclamation)
            Exit Sub
        End Try

        db.updateEmployee(txtNameEmployee.Text, txtPassEmployee.Text, txtAddressEmployee.Text, txtPhoneEmployee.Text, "1", txtEmailEmployee.Text, txtIdEmployee.Text)

        MsgBox("Update data success", MsgBoxStyle.Information)
        dataEmployee()
        resetEmployee()
    End Sub

    Private Sub DataGridViewEmployee_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewEmployee.CellMouseClick
        Dim i As Integer = DataGridViewEmployee.CurrentRow.Index

        txtIdEmployee.Text = DataGridViewEmployee.Item(0, i).Value
        txtNameEmployee.Text = DataGridViewEmployee.Item(1, i).Value
        txtPassEmployee.Text = DataGridViewEmployee.Item(2, i).Value
        txtAddressEmployee.Text = DataGridViewEmployee.Item(3, i).Value
        txtPhoneEmployee.Text = DataGridViewEmployee.Item(4, i).Value
        txtEmailEmployee.Text = DataGridViewEmployee.Item(5, i).Value
    End Sub

    Private Sub btnCancelEmployee_Click(sender As Object, e As EventArgs) Handles btnCancelEmployee.Click
        resetEmployee()
        dataEmployee()
    End Sub

    Private Sub btnSearchEmployee_Click(sender As Object, e As EventArgs) Handles btnSearchEmployee.Click
        DataGridViewEmployee.Rows.Clear()
        sql = "select * from Employee where EmployeeName like '%" & txtSearchEmployee.Text & "%' or Email like '%" & txtSearchEmployee.Text & "%' or EmployeeAddress like '%" & txtSearchEmployee.Text & "%' or EmployeePhone like '%" & txtSearchEmployee.Text & "%'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                DataGridViewEmployee.Rows.Add(dbread("EmployeeId"), dbread("EmployeeName"), dbread("Password"), dbread("EmployeeAddress"), dbread("EmployeePhone"), dbread("Email"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

#End Region

#Region "Recipe"
    Private Sub btnAddRecipe_Click(sender As Object, e As EventArgs) Handles btnAddRecipe.Click
        db.insertRecipe(cbFoodRecipe.SelectedValue, txtPieceRecipe.Text, txtDescRecipe.Text, "1", DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss"), "1")
        MsgBox("Insert data success", MsgBoxStyle.Information)
        Me.RecipeHeaderViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet2.RecipeHeaderView)
        resetRecipe()
    End Sub

    Private Sub btnEditRecipe_Click(sender As Object, e As EventArgs) Handles btnEditRecipe.Click
        db.updateRecipe(cbFoodRecipe.SelectedValue, txtPieceRecipe.Text, txtDescRecipe.Text, "1", DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss"), "1", txtIdRecipe.Text)
        MsgBox("Update data success", MsgBoxStyle.Information)
        Me.RecipeHeaderViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet2.RecipeHeaderView)
        resetRecipe()
    End Sub

    Private Sub btnDeleteRecipe_Click(sender As Object, e As EventArgs) Handles btnDeleteRecipe.Click
        db.deleteRecipe(txtIdRecipe.Text)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        Me.RecipeHeaderViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet2.RecipeHeaderView)
        resetRecipe()
    End Sub

    Private Sub DataGridViewRecipe_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewRecipe.CellMouseClick
        Dim i As Integer = DataGridViewRecipe.CurrentRow.Index
        txtIdRecipe.Text = DataGridViewRecipe.Item(5, i).Value
        cbFoodRecipe.SelectedValue = DataGridViewRecipe.Item(1, i).Value
        txtPieceRecipe.Text = DataGridViewRecipe.Item(6, i).Value
        txtDescRecipe.Text = DataGridViewRecipe.Item(7, i).Value
    End Sub

    Private Sub resetRecipe()
        txtIdRecipe.Text = ""
        cbFoodRecipe.SelectedValue = 1
        txtPieceRecipe.Text = ""
        txtDescRecipe.Text = ""
    End Sub

    Private Sub btnResetRecipe_Click(sender As Object, e As EventArgs) Handles btnResetRecipe.Click
        Me.RecipeHeaderViewTableAdapter.Fill(Me.ESEMKABAKERYDataSet2.RecipeHeaderView)
        resetRecipe()
    End Sub

#Region "Detail Recipe"
    Public Sub dataDetailRecipe(id)
        DataGridViewDetailRecipe.Rows.Clear()
        sql = "select * from RecipeDetail as rd join RawMaterial as rm on rd.RawMaterialId=rm.RawMaterialId join RecipeHeader as rh on rd.RecipeId=rh.RecipeId where rd.RecipeId='" & id & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read()
                DataGridViewDetailRecipe.Rows.Add(dbread("RecipeId"), dbread("RawMaterialId"), dbread("RawMaterialName"), dbread("WeightInGram"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub DataGridViewRecipe_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridViewRecipe.CellClick
        If e.ColumnIndex = 0 Then
            Dim i As Integer = DataGridViewRecipe.CurrentRow.Index
            dataDetailRecipe(DataGridViewRecipe.Item(5, i).Value)
        End If
    End Sub

    Private Sub btnAddRecipe2_Click(sender As Object, e As EventArgs) Handles btnAddRecipe2.Click
        Dim i As Integer = DataGridViewRecipe.CurrentRow.Index
        Try
            db.insertDetailRecipe(DataGridViewRecipe.Item(5, i).Value, cbRawRecipe.SelectedValue, txtWeightRecipe.Text)
            MsgBox("Insert data success", MsgBoxStyle.Information)
        Catch ex As Exception
            MsgBox("Bahan baku sudah ada", MsgBoxStyle.Exclamation)
        End Try
        resetDetailRecipe()
        dataDetailRecipe(DataGridViewRecipe.Item(5, i).Value)
    End Sub

    Private Sub resetDetailRecipe()
        cbRawRecipe.SelectedIndex = 0
        txtWeightRecipe.Text = ""
    End Sub

    Private Sub btnEditRecipe2_Click(sender As Object, e As EventArgs) Handles btnEditRecipe2.Click
        Dim i As Integer = DataGridViewRecipe.CurrentRow.Index
        db.updateDetailRecipe(DataGridViewDetailRecipe.Item(1, i).Value, cbRawRecipe.SelectedValue, txtWeightRecipe.Text)
        MsgBox("Update data success", MsgBoxStyle.Information)
        resetDetailRecipe()
        dataDetailRecipe(DataGridViewRecipe.Item(5, i).Value)
    End Sub

    Private Sub DataGridViewDetailRecipe_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewDetailRecipe.CellMouseClick
        Dim i As Integer = DataGridViewDetailRecipe.CurrentRow.Index

        cbRawRecipe.SelectedValue = DataGridViewDetailRecipe.Item(1, i).Value
        txtWeightRecipe.Text = DataGridViewDetailRecipe.Item(3, i).Value
    End Sub

    Private Sub btnResetRecipe2_Click(sender As Object, e As EventArgs) Handles btnResetRecipe2.Click
        resetDetailRecipe()
    End Sub

    Private Sub btnDeleteRecipe2_Click(sender As Object, e As EventArgs) Handles btnDeleteRecipe2.Click
        Dim i As Integer = DataGridViewDetailRecipe.CurrentRow.Index
        db.deleteDetailRecipe(DataGridViewDetailRecipe.Item(1, i).Value)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        resetDetailRecipe()
        dataDetailRecipe(DataGridViewRecipe.Item(5, i).Value)
    End Sub
#End Region

#End Region

#Region "Incoming Raw Material"
    Private Sub btnAddIncome_Click(sender As Object, e As EventArgs) Handles btnAddIncome.Click
        db.insertIncoming(DateTimePickerIncomingDate.Value.ToString("yyyy/MM/dd"), cbEmployeeIncome.SelectedValue, txtDescIncome.Text)
        db.insertIncomingDetail(cbRawIncome.SelectedValue, txtPriceIncome.Text, DateTimePickerBestBeforeIncome.Value.ToString("yyyy/MM/dd"), txtWeightIncome.Text)
        MsgBox("Insert data success", MsgBoxStyle.Information)
        Me.IncomingRawViewTableAdapter2.Fill(Me.ESEMKABAKERYDataSet6.IncomingRawView)
        resetIncoming()
    End Sub

    Private Sub DataGridViewIncome_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridViewIncome.CellClick
        If e.ColumnIndex = 9 Then
            Dim i As Integer = DataGridViewIncome.CurrentRow.Index
            db.deleteIncomingDetail(DataGridViewIncome.Item(0, i).Value)
            db.deleteIncoming(DataGridViewIncome.Item(0, i).Value)
            MsgBox("Delete data success", MsgBoxStyle.Information)
            Me.IncomingRawViewTableAdapter2.Fill(Me.ESEMKABAKERYDataSet6.IncomingRawView)
            resetIncoming()
        End If
    End Sub

    Private Sub btnEditIncome_Click(sender As Object, e As EventArgs) Handles btnEditIncome.Click
        Dim i As Integer = DataGridViewIncome.CurrentRow.Index
        db.updateIncoming(DateTimePickerIncomingDate.Value.ToString("yyyy/MM/dd"), cbEmployeeIncome.SelectedValue, txtDescIncome.Text, DataGridViewIncome.Item(0, i).Value)
        db.updateIncomingDetail(cbRawIncome.SelectedValue, txtPriceIncome.Text, DateTimePickerBestBeforeIncome.Value.ToString("yyyy/MM/dd"), txtWeightIncome.Text, DataGridViewIncome.Item(0, i).Value)
        MsgBox("Update data success", MsgBoxStyle.Information)
        Me.IncomingRawViewTableAdapter2.Fill(Me.ESEMKABAKERYDataSet6.IncomingRawView)
        resetIncoming()
    End Sub

    Private Sub DataGridViewIncome_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewIncome.CellMouseClick
        Dim i As Integer = DataGridViewIncome.CurrentRow.Index

        cbRawIncome.SelectedValue = DataGridViewIncome.Item(1, i).Value
        DateTimePickerBestBeforeIncome.Value = DataGridViewIncome.Item(3, i).Value
        txtWeightIncome.Text = DataGridViewIncome.Item(4, i).Value
        DateTimePickerIncomingDate.Value = DataGridViewIncome.Item(6, i).Value
        cbEmployeeIncome.SelectedValue = DataGridViewIncome.Item(8, i).Value
        txtPriceIncome.Text = DataGridViewIncome.Item(5, i).Value
        txtDescIncome.Text = DataGridViewIncome.Item(7, i).Value
    End Sub

    Private Sub btnDeleteIncome_Click(sender As Object, e As EventArgs) Handles btnDeleteIncome.Click
        resetIncoming()
    End Sub

    Private Sub resetIncoming()
        cbRawIncome.SelectedIndex = 0
        DateTimePickerBestBeforeIncome.Value = Date.Now
        txtWeightIncome.Text = ""
        DateTimePickerIncomingDate.Value = Date.Now
        cbEmployeeIncome.SelectedIndex = 0
        txtPriceIncome.Text = ""
        txtDescIncome.Text = ""
    End Sub

#End Region

#Region "Add Production"
    Private Sub dataProduction()
        DataGridViewProduction.Rows.Clear()
        sql = "select * from ProductionHeader as ph join ProductionDetail as pd on ph.ProductionId=pd.ProductionId join food as f on pd.FoodId=f.FoodId join Employee as e on ph.EmployeeId=e.EmployeeId"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                DataGridViewProduction.Rows.Add(dbread("ProductionId"), dbread("FoodId"), dbread("FoodName"), dbread("ProductionDate").toshortdatestring, dbread("Description"), dbread("EmployeeId"), dbread("EmployeeName"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub btnAddProduction_Click(sender As Object, e As EventArgs) Handles btnAddProduction.Click
        db.insertProduction(DateTimePickerProduction.Value.ToString("yyyy/MM/dd"), txtDescProduction.Text, cbEmployeeProduction.SelectedValue, "0")
        db.insertProductionDetail(cbFoodProduction.SelectedValue, Date.Now.AddDays(7).ToString("yyyy/MM/dd"))
        MsgBox("Insert data success", MsgBoxStyle.Information)
        dataProduction()
        resetProduction()
    End Sub

    Private Sub btnEditProduction_Click(sender As Object, e As EventArgs) Handles btnEditProduction.Click
        Dim i As Integer = DataGridViewProduction.CurrentRow.Index
        db.updateProductin(DateTimePickerProduction.Value.ToString("yyyy/MM/dd"), txtDescProduction.Text, cbEmployeeProduction.SelectedValue, "0", DataGridViewProduction.Item(0, i).Value)
        db.updateProductinDetail(cbFoodProduction.SelectedValue, Date.Now.AddDays(7).ToString("yyyy/MM/dd"), DataGridViewProduction.Item(0, i).Value)
        MsgBox("Update data success", MsgBoxStyle.Information)
        dataProduction()
        resetProduction()
    End Sub

    Private Sub btnDeleteProduction_Click(sender As Object, e As EventArgs) Handles btnDeleteProduction.Click
        Dim i As Integer = DataGridViewProduction.CurrentRow.Index
        db.deleteProductionDetail(DataGridViewProduction.Item(0, i).Value)
        db.deleteProduction(DataGridViewProduction.Item(0, i).Value)
        MsgBox("Delete data success", MsgBoxStyle.Information)
        dataProduction()
        resetProduction()
    End Sub

    Private Sub btnCancelProduction_Click(sender As Object, e As EventArgs) Handles btnCancelProduction.Click
        resetProduction()
    End Sub

    Private Sub resetProduction()
        cbFoodProduction.SelectedValue = 0
        DateTimePickerProduction.Value = Date.Now
        cbEmployeeProduction.SelectedValue = 0
        txtDescProduction.Text = ""
    End Sub

    Private Sub DataGridViewProduction_CellMouseClick(sender As Object, e As DataGridViewCellMouseEventArgs) Handles DataGridViewProduction.CellMouseClick
        Dim i As Integer = DataGridViewProduction.CurrentRow.Index

        cbFoodProduction.SelectedValue = DataGridViewProduction.Item(1, i).Value
        DateTimePickerProduction.Value = DataGridViewProduction.Item(3, i).Value
        cbEmployeeProduction.SelectedValue = DataGridViewProduction.Item(5, i).Value
        txtDescProduction.Text = DataGridViewProduction.Item(4, i).Value
    End Sub
#End Region

#Region "View Production"
    Private Sub dataViewProduction()
        DataGridViewViewProduction.Rows.Clear()
        sql = "select * from ProductionHeader as ph join ProductionDetail as pd on ph.ProductionId=pd.ProductionId join food as f on pd.FoodId=f.FoodId join Employee as e on ph.EmployeeId=e.EmployeeId"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                Dim status As String
                If dbread("Status") = "0" Then
                    status = "Proses"
                ElseIf dbread("Status") = "1"
                    status = "Finish"
                End If
                DataGridViewViewProduction.Rows.Add(dbread("ProductionId"), dbread("ProductionDate").toshortdatestring, dbread("Description"), dbread("EmployeeName"), status)
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub dataViewDetailProduction(id)
        DataGridViewDetailProduction.Rows.Clear()
        sql = "select * from ProductionHeader as ph join ProductionDetail as pd on ph.ProductionId=pd.ProductionId join food as f on pd.FoodId=f.FoodId join Employee as e on ph.EmployeeId=e.EmployeeId join RecipeHeader as rh on f.FoodId=rh.FoodId where ph.ProductionId='" & id & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read
                DataGridViewDetailProduction.Rows.Add(dbread("BatchNumber"), dbread("FoodName"), dbread("ExpiredDate").toshortdatestring, dbread("OutputUnitInPieces"))
            End While
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub DataGridViewViewProduction_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridViewViewProduction.CellClick
        Dim i As Integer = DataGridViewViewProduction.CurrentRow.Index
        If e.ColumnIndex = 5 Then
            db.finishProduction(DataGridViewViewProduction.Item(0, i).Value)
            dataViewProduction()
        ElseIf e.ColumnIndex = 6
            dataViewDetailProduction(DataGridViewViewProduction.Item(0, i).Value)
        End If
    End Sub

#End Region

#Region "Selling"
    Dim price As String
    Dim batchNumber As String
    Private Function dataSelling(id)
        sql = "select * from Food as f join ProductionDetail as pd on f.FoodId=pd.FoodId where f.FoodId='" & id & "'"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            price = dbread("Price")
            batchNumber = dbread("BatchNumber")
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return price
    End Function

    Private Sub btnAddSelling_Click(sender As Object, e As EventArgs) Handles btnAddSelling.Click
        dataSelling(cbFoodSelling.SelectedValue)
        DataGridViewSelling.Rows.Add(cbFoodSelling.SelectedValue, cbFoodSelling.Text, price, txtQtySelling.Text, price * txtQtySelling.Text, batchNumber)
        totalPrice()
        discount()
        cbFoodSelling.SelectedIndex = 0
        txtQtySelling.Text = ""
    End Sub

    Private Sub DataGridViewSelling_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridViewSelling.CellClick
        If e.ColumnIndex = 6 Then
            DataGridViewSelling.Rows.RemoveAt(DataGridViewSelling.CurrentRow.Index)
            totalPrice()
            discount()
        End If
    End Sub

    Private Sub totalPrice()
        If DataGridViewSelling.RowCount = 0 Then
            txtPriceSelling.Text = ""
        End If
        Dim total As Integer = 0
        For i As Integer = 0 To DataGridViewSelling.RowCount - 1
            Dim price As Integer = DataGridViewSelling.Item(4, i).Value
            total += price
            txtPriceSelling.Text = total
        Next
    End Sub

    Private Sub discount()
        If txtPriceSelling.Text = "" Then
            txtTotalSelling.Text = ""
        End If
        Try
            Dim discountTotal As String = txtPriceSelling.Text * txtDiscountSelling.Text / 100
            txtTotalSelling.Text = txtPriceSelling.Text - discountTotal
        Catch ex As Exception

        End Try
    End Sub

    Private Sub txtDiscountSelling_TextChanged(sender As Object, e As EventArgs) Handles txtDiscountSelling.TextChanged
        discount()
    End Sub

    Private Sub btnSubmitSelling_Click(sender As Object, e As EventArgs) Handles btnSubmitSelling.Click
        db.insertSelling(DateTimePickerSelling.Value.ToString("yyyy/MM/dd"), txtDiscountSelling.Text, "1")
        For i As Integer = 0 To DataGridViewSelling.RowCount - 1
            db.insertSellingDetail(DataGridViewSelling.Item(0, i).Value, DataGridViewSelling.Item(5, i).Value, DataGridViewSelling.Item(3, i).Value, DataGridViewSelling.Item(3, i).Value * DataGridViewSelling.Item(2, i).Value)
        Next
        MsgBox("Insert data success", MsgBoxStyle.Information)
        resetSelling()
    End Sub

    Private Sub resetSelling()
        cbFoodSelling.SelectedIndex = 0
        txtQtySelling.Text = ""
        txtTotalSelling.Text = ""
        txtPriceSelling.Text = ""
        txtDiscountSelling.Text = ""
        DataGridViewSelling.Rows.Clear()
    End Sub
#End Region

#Region "Cash Flow"
    Private Sub checkedListProduct()
        sql = "select * from Food"

        Try
            dbcomm = New SqlCommand(sql, db.conn)
            dbread = dbcomm.ExecuteReader
            While dbread.Read()
                CheckedListBox1.Items.Add(dbread("FoodName"))
            End While
            CheckedListBox1.Items.Add("All Product")
            dbread.Close()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub chart()
        Dim itemChecked As Object
        Dim a As String()
        For Each itemChecked In CheckedListBox1.CheckedItems
            a = {itemChecked.ToString}
        Next

        'Chart1.Series.Clear()
        'Chart1.Series.Add("Income").ChartType = DataVisualization.Charting.SeriesChartType.Column
        'Chart1.Series.Add("Outcome").ChartType = DataVisualization.Charting.SeriesChartType.Column

        'sql = "select * from SellingHeader as sh join SellingDetail as sd on sh.SellingId=sd.SellingId where SellingDate between '" & DateTimePickerStartReport.Value.AddDays(-1).ToString("yyyy/MM/dd hh:mm:ss") & "' and '" & DateTimePickerEndReport.Value.ToString("yyyy/MM/dd hh:mm:ss") & "' and FoodName='" &  & "' or FoodName='" &  & "'"

        'Try
        '    dbcomm = New SqlCommand(sql, db.conn)
        '    dbread = dbcomm.ExecuteReader
        '    While dbread.Read
        '        Chart1.Series("Income").Points.AddXY(dbread("SellingDate"), dbread("Price"))
        '    End While
        '    dbread.Close()
        'Catch ex As Exception
        '    MsgBox(ex.Message, MsgBoxStyle.Critical)
        'End Try
    End Sub

    Private Sub btnLoadReport_Click(sender As Object, e As EventArgs) Handles btnLoadReport.Click
        chart()
    End Sub
#End Region
End Class