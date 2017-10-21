Imports System.Data.SqlClient
Public Class Database
    Dim dbconn As New SqlConnection
    Dim dbcomm As New SqlCommand
    Dim dbread As SqlDataReader
    Dim sql As String
    Dim lastid As String
    Public Function conn()
        dbconn = New SqlConnection("Data Source=.\SQLEXPRESS;Database=ESEMKABAKERY;Integrated Security=true")
        Try
            dbconn.Open()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return dbconn
    End Function

    Public Function crud(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            dbread = dbcomm.ExecuteReader
            dbread.Read()
            Return dbread
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Function

    Public Function crudid(sql)
        Try
            dbcomm = New SqlCommand(sql, conn)
            lastid = dbcomm.ExecuteScalar
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Return lastid
    End Function

    Public Function login(email, pass)
        sql = "select Email,Password from Employee where Email='" & email & "' and Password='" & pass & "'"

        crud(sql)
        Dim b As Boolean
        If dbread.HasRows Then
            b = True
        Else
            b = False
        End If
        dbread.Close()

        Return b
    End Function

#Region "Employee"
    Public Sub insertEmployee(nm, pw, addrs, telp, stts, email)
        sql = "insert into Employee(EmployeeName,Password,EmployeeAddress,EmployeePhone,Status,Email) values('" & nm & "','" & pw & "','" & addrs & "','" & telp & "','" & stts & "','" & email & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteEmployee(id)
        sql = "delete Employee where EmployeeId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateEmployee(nm, pw, addrs, telp, stts, email, id)
        sql = "update Employee set EmployeeName='" & nm & "',Password='" & pw & "',EmployeeAddress='" & addrs & "',EmployeePhone='" & telp & "',Status='" & stts & "',Email='" & email & "' where EmployeeId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Recipe"
    Public Sub insertRecipe(id, piece, desc, employee, createddate, status)
        sql = "insert into RecipeHeader(FoodId,OutputUnitInPieces,Description,EmployeeId,CreatedDate,Status) values('" & id & "','" & piece & "','" & desc & "','" & employee & "','" & createddate & "','" & status & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateRecipe(id, piece, desc, employee, createddate, status, rid)
        sql = "update RecipeHeader set FoodId='" & id & "',OutputUnitInPieces='" & piece & "',Description='" & desc & "',EmployeeId='" & employee & "',CreatedDate='" & createddate & "',Status='" & status & "' where RecipeId='" & rid & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteRecipe(id)
        sql = "delete RecipeHeader where RecipeId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub
#Region "Detail Recipe"
    Public Sub insertDetailRecipe(id, rawid, gram)
        sql = "insert into RecipeDetail(RecipeId,RawMaterialId,WeightInGram) values('" & id & "','" & rawid & "','" & gram & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateDetailRecipe(id, rawid, gram)
        sql = "update RecipeDetail set RawMaterialId='" & rawid & "',WeightInGram='" & gram & "' where RawMaterialId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteDetailRecipe(id)
        sql = "delete RecipeDetail where RawMaterialId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

#End Region
#End Region

#Region "Incoming Raw"
    Public Function insertIncoming(incomingdate, employee, desc)
        sql = "insert into IncomingRawMaterialHeader(IncomingDate,EmployeeId,Description) output inserted.IncomingRawMaterialId values('" & incomingdate & "','" & employee & "','" & desc & "')"

        lastid = crudid(sql)
        Return lastid
    End Function

    Public Sub insertIncomingDetail(rawid, price, bestbefore, weight)
        sql = "insert into IncomingRawMaterialDetail(IncomingRawMaterialId,RawMaterialId,PricePer100Gram,BestBeforeDate,WeightGram) values('" & lastid & "','" & rawid & "','" & price & "','" & bestbefore & "','" & weight & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteIncomingDetail(id)
        sql = "delete IncomingRawMaterialDetail where IncomingRawMaterialId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteIncoming(id)
        sql = "delete IncomingRawMaterialHeader where IncomingRawMaterialId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateIncoming(incomingdate, employee, desc, id)
        sql = "update IncomingRawMaterialHeader set IncomingDate='" & incomingdate & "',EmployeeId='" & employee & "',Description='" & desc & "' where IncomingRawMaterialId=" & id & ""

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateIncomingDetail(rawid, price, bestbefore, weight, id)
        sql = "update IncomingRawMaterialDetail set RawMaterialId='" & rawid & "',PricePer100Gram='" & price & "',BestBeforeDate='" & bestbefore & "',WeightGram='" & weight & "' where IncomingRawMaterialId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Add Production"
    Public Function insertProduction(proddate, desc, id, status)
        sql = "insert into ProductionHeader(ProductionDate,Description,EmployeeId,Status) output inserted.ProductionId values('" & proddate & "','" & desc & "','" & id & "','" & status & "')"

        lastid = crudid(sql)
        Return lastid
    End Function

    Public Sub insertProductionDetail(food, exp)
        sql = "insert into ProductionDetail(ProductionId,FoodId,ExpiredDate) values('" & lastid & "','" & food & "','" & exp & "')"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateProductin(proddate, desc, id, status, pid)
        sql = "update ProductionHeader set ProductionDate='" & proddate & "',Description='" & desc & "',EmployeeId='" & id & "',Status='" & status & "' where ProductionId='" & pid & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub updateProductinDetail(food, exp, pid)
        sql = "update ProductionDetail set FoodId='" & food & "', ExpiredDate='" & exp & "' where ProductionId='" & pid & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteProductionDetail(id)
        sql = "delete ProductionDetail where ProductionId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub deleteProduction(id)
        sql = "delete ProductionHeader where ProductionId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub

    Public Sub finishProduction(id)
        sql = "update ProductionHeader set status='1' where ProductionId='" & id & "'"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

#Region "Selling"
    Public Function insertSelling(selldate, discount, employee)
        sql = "insert into SellingHeader(SellingDate,Discount,EmployeeId) output inserted.SellingId values('" & selldate & "','" & discount & "','" & employee & "')"

        lastid = crudid(sql)
        Return lastid
    End Function

    Public Sub insertSellingDetail(foodid, batchnumber, qty, price)
        sql = "insert into SellingDetail(SellingId,FoodId,BatchNumber,Qty,Price) values('" & lastid & "','" & foodid & "','" & batchnumber & "','" & qty & "','" & price & "')"

        crud(sql)
        dbread.Close()
    End Sub
#End Region

End Class
