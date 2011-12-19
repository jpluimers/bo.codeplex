object MastData: TMastData
  OldCreateOrder = True
  OnCreate = MastDataCreate
  Left = 575
  Top = 383
  Height = 479
  Width = 741
  object Database: TIBDatabase
    DatabaseName = 'C:\Program Files\Common Files\CodeGear Shared\Data\MASTSQL.GDB'
    Params.Strings = (
      'USER_NAME=sysdba'
      'PASSWORD=masterkey')
    LoginPrompt = False
    DefaultTransaction = Transaction
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 420
    Top = 10
  end
  object NextCust: TIBTable
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'NEXTCUST'
    Left = 160
    Top = 60
    object NextCustNewCust: TFloatField
      FieldName = 'NewCust'
    end
  end
  object Parts: TIBTable
    Database = Database
    Transaction = Transaction
    BeforeOpen = PartsBeforeOpen
    OnCalcFields = PartsCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'PARTNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VENDORNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'DESCRIPTION'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ONHAND'
        DataType = ftFloat
      end
      item
        Name = 'ONORDER'
        DataType = ftFloat
      end
      item
        Name = 'COST'
        DataType = ftFloat
      end
      item
        Name = 'LISTPRICE'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'PARTNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN35'
        Fields = 'VENDORNO'
      end
      item
        Name = 'VENDORNO'
        Fields = 'VENDORNO'
      end
      item
        Name = 'DESCRIPTION'
        Fields = 'DESCRIPTION'
      end>
    StoreDefs = True
    TableName = 'PARTS'
    Left = 20
    Top = 160
    object PartsPartNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 8
      FieldName = 'PartNo'
      Required = True
    end
    object PartsDescription: TIBStringField
      DisplayWidth = 21
      FieldName = 'Description'
      Required = True
      Size = 30
    end
    object PartsVendorNo: TFloatField
      DisplayWidth = 9
      FieldName = 'VendorNo'
    end
    object PartsOnHand: TFloatField
      DisplayWidth = 9
      FieldName = 'OnHand'
    end
    object PartsOnOrder: TFloatField
      DisplayWidth = 10
      FieldName = 'OnOrder'
    end
    object PartsBackOrd: TBooleanField
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'BackOrd'
      DisplayValues = 'Yes;No'
      Calculated = True
    end
    object PartsCost: TCurrencyField
      DisplayWidth = 12
      FieldName = 'Cost'
    end
    object PartsListPrice: TCurrencyField
      DisplayWidth = 12
      FieldName = 'ListPrice'
    end
  end
  object PartsQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    OnCalcFields = PartsQueryCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from parts'
      ' where (parts.OnOrder > parts.OnHand)'
      '')
    Left = 160
    Top = 160
    object PartsQueryPartNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 8
      FieldName = 'PartNo'
    end
    object PartsQueryDescription: TIBStringField
      DisplayWidth = 21
      FieldName = 'Description'
      Size = 30
    end
    object PartsQueryVendorNo: TFloatField
      FieldName = 'VendorNo'
    end
    object PartsQueryOnHand: TFloatField
      DisplayWidth = 9
      FieldName = 'OnHand'
    end
    object PartsQueryOnOrder: TFloatField
      DisplayWidth = 10
      FieldName = 'OnOrder'
    end
    object PartsQueryBackOrd: TBooleanField
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'BackOrd'
      DisplayValues = 'Yes;No'
      Calculated = True
    end
    object PartsQueryCost: TCurrencyField
      FieldName = 'Cost'
    end
    object PartsQueryListPrice: TCurrencyField
      FieldName = 'ListPrice'
    end
  end
  object Vendors: TIBTable
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'VENDORNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VENDORNAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDRESS1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDRESS2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PREFERRED'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'VENDORNO'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'VENDORS'
    Left = 20
    Top = 260
  end
  object Orders: TIBTable
    Database = Database
    Transaction = Transaction
    AfterCancel = OrdersAfterCancel
    AfterDelete = OrdersAfterDelete
    AfterPost = OrdersAfterPost
    BeforeCancel = OrdersBeforeCancel
    BeforeClose = OrdersBeforeClose
    BeforeDelete = OrdersBeforeDelete
    BeforeEdit = OrdersBeforeEdit
    BeforeInsert = OrdersBeforeInsert
    BeforeOpen = OrdersBeforeOpen
    OnCalcFields = OrdersCalcFields
    OnNewRecord = OrdersNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'ORDERNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'CUSTNO'
        DataType = ftFloat
      end
      item
        Name = 'SALEDATE'
        DataType = ftDateTime
      end
      item
        Name = 'SHIPDATE'
        DataType = ftDateTime
      end
      item
        Name = 'EMPNO'
        DataType = ftInteger
      end
      item
        Name = 'SHIPTOCONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SHIPTOADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SHIPTOCITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SHIPTOSTATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SHIPTOCOUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOPHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SHIPVIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'PO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TERMS'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PAYMENTMETHOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ITEMSTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
      end
      item
        Name = 'FREIGHT'
        DataType = ftFloat
      end
      item
        Name = 'AMOUNTPAID'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'ORDERNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN30'
        Fields = 'CUSTNO'
      end>
    IndexFieldNames = 'OrderNo'
    StoreDefs = True
    TableName = 'ORDERS'
    Left = 20
    Top = 12
    object OrdersOrderNo: TFloatField
      Alignment = taLeftJustify
      FieldName = 'OrderNo'
    end
    object OrdersCustNo: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CustNo'
      Required = True
      OnChange = OrdersCustNoChange
    end
    object OrdersSaleDate: TDateTimeField
      FieldName = 'SaleDate'
      OnValidate = OrdersSaleDateValidate
    end
    object OrdersShipDate: TDateTimeField
      FieldName = 'ShipDate'
    end
    object OrdersShipToContact: TIBStringField
      FieldName = 'ShipToContact'
    end
    object OrdersShipToAddr1: TIBStringField
      FieldName = 'ShipToAddr1'
      Size = 30
    end
    object OrdersShipToAddr2: TIBStringField
      FieldName = 'ShipToAddr2'
      Size = 30
    end
    object OrdersShipToCity: TIBStringField
      FieldName = 'ShipToCity'
      Size = 15
    end
    object OrdersShipToState: TIBStringField
      FieldName = 'ShipToState'
    end
    object OrdersShipToZip: TIBStringField
      FieldName = 'ShipToZip'
      Size = 10
    end
    object OrdersShipToCountry: TIBStringField
      FieldName = 'ShipToCountry'
    end
    object OrdersShipToPhone: TIBStringField
      FieldName = 'ShipToPhone'
      Size = 15
    end
    object OrdersShipVIA: TIBStringField
      FieldName = 'ShipVIA'
      Size = 7
    end
    object OrdersPO: TIBStringField
      FieldName = 'PO'
      Size = 15
    end
    object OrdersEmpNo: TIntegerField
      FieldName = 'EmpNo'
      Required = True
    end
    object OrdersTerms: TIBStringField
      FieldName = 'Terms'
      Size = 6
    end
    object OrdersPaymentMethod: TIBStringField
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object OrdersItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object OrdersTaxRate: TFloatField
      FieldName = 'TaxRate'
      DisplayFormat = '0.00%;(0.00%);0%'
      MaxValue = 100
    end
    object OrdersTaxTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TaxTotal'
      Calculated = True
    end
    object OrdersFreight: TCurrencyField
      FieldName = 'Freight'
      OnValidate = OrdersFreightValidate
    end
    object OrdersAmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
    object OrdersAmountDue: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AmountDue'
      Calculated = True
    end
    object OrdersSalesPerson: TIBStringField
      FieldKind = fkLookup
      FieldName = 'SalesPerson'
      LookupDataSet = Emps
      LookupKeyFields = 'EmpNo'
      LookupResultField = 'FullName'
      KeyFields = 'EmpNo'
      Size = 40
      Lookup = True
    end
  end
  object CustByOrd: TIBTable
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CUSTNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'COMPANY'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
      end
      item
        Name = 'CONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LASTINVOICEDATE'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY28'
        Fields = 'CUSTNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'COMPANY'
        Fields = 'COMPANY'
      end>
    IndexFieldNames = 'CustNo'
    MasterFields = 'CustNo'
    MasterSource = OrdersSource
    ReadOnly = True
    StoreDefs = True
    TableName = 'CUSTOMER'
    Left = 20
    Top = 60
    object CustByOrdCustNo: TFloatField
      FieldName = 'CustNo'
    end
    object CustByOrdCompany: TIBStringField
      FieldName = 'Company'
      Size = 30
    end
    object CustByOrdAddr1: TIBStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object CustByOrdAddr2: TIBStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object CustByOrdCity: TIBStringField
      FieldName = 'City'
      Size = 15
    end
    object CustByOrdState: TIBStringField
      FieldName = 'State'
    end
    object CustByOrdZip: TIBStringField
      FieldName = 'Zip'
      Size = 10
    end
    object CustByOrdCountry: TIBStringField
      FieldName = 'Country'
    end
    object CustByOrdPhone: TIBStringField
      FieldName = 'Phone'
      Size = 15
    end
    object CustByOrdFAX: TIBStringField
      FieldName = 'FAX'
      Size = 15
    end
    object CustByOrdTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object CustByOrdContact: TIBStringField
      FieldName = 'Contact'
    end
    object CustByOrdLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
  object Items: TIBTable
    Database = Database
    Transaction = Transaction
    AfterDelete = ItemsAfterDelete
    AfterPost = ItemsAfterPost
    BeforeDelete = EnsureOrdersEdit
    BeforeEdit = ItemsBeforeEdit
    BeforeInsert = EnsureOrdersEdit
    BeforeOpen = ItemsBeforeOpen
    BeforePost = ItemsBeforePost
    OnCalcFields = ItemsCalcFields
    OnNewRecord = ItemsNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'ITEMNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ORDERNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'PARTNO'
        DataType = ftFloat
      end
      item
        Name = 'QTY'
        DataType = ftInteger
      end
      item
        Name = 'DISCOUNT'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN41'
        Fields = 'ORDERNO'
      end
      item
        Name = 'RDB$PRIMARY40'
        Fields = 'ORDERNO;ITEMNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN36'
        Fields = 'PARTNO'
      end>
    IndexFieldNames = 'OrderNo'
    MasterFields = 'OrderNo'
    MasterSource = OrdersSource
    StoreDefs = True
    TableName = 'ITEMS'
    Left = 20
    Top = 110
    object ItemsItemNo: TFloatField
      FieldName = 'ItemNo'
      Visible = False
    end
    object ItemsOrderNo: TFloatField
      FieldName = 'OrderNo'
      Visible = False
    end
    object ItemsPartNo: TFloatField
      FieldName = 'PartNo'
      OnValidate = ItemsPartNoValidate
    end
    object ItemsDescription: TIBStringField
      DisplayWidth = 28
      FieldKind = fkLookup
      FieldName = 'Description'
      LookupDataSet = Parts
      LookupKeyFields = 'PartNo'
      LookupResultField = 'Description'
      KeyFields = 'PartNo'
      ReadOnly = True
      Size = 30
      Lookup = True
    end
    object ItemsSellPrice: TCurrencyField
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'SellPrice'
      LookupDataSet = Parts
      LookupKeyFields = 'PartNo'
      LookupResultField = 'ListPrice'
      KeyFields = 'PartNo'
      Lookup = True
    end
    object ItemsQty: TIntegerField
      DisplayWidth = 5
      FieldName = 'Qty'
      OnValidate = ItemsQtyValidate
    end
    object ItemsDiscount: TFloatField
      DisplayWidth = 7
      FieldName = 'Discount'
      DisplayFormat = '0.00%'
      MaxValue = 100
    end
    object ItemsExtPrice: TCurrencyField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ExtPrice'
      Calculated = True
    end
  end
  object NextOrd: TIBTable
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'NEXTORD'
    Left = 160
    Top = 10
    object NextOrdNewKey: TFloatField
      FieldName = 'NewKey'
    end
  end
  object Emps: TIBTable
    Database = Database
    Transaction = Transaction
    OnCalcFields = EmpsCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'EMPNO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LASTNAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FIRSTNAME'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PHONEEXT'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'HIREDATE'
        DataType = ftDateTime
      end
      item
        Name = 'SALARY'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'EMPNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'LASTNAME'
        Fields = 'LASTNAME;FIRSTNAME'
      end>
    IndexFieldNames = 'EmpNo'
    ReadOnly = True
    StoreDefs = True
    TableName = 'EMPLOYEE'
    Left = 20
    Top = 210
    object EmpsEmpNo: TIntegerField
      FieldName = 'EmpNo'
    end
    object EmpsFullName: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'FullName'
      Calculated = True
    end
    object EmpsLastName: TIBStringField
      FieldName = 'LastName'
    end
    object EmpsFirstName: TIBStringField
      FieldName = 'FirstName'
      Size = 15
    end
    object EmpsPhoneExt: TIBStringField
      FieldName = 'PhoneExt'
      Size = 4
    end
    object EmpsHireDate: TDateTimeField
      FieldName = 'HireDate'
    end
    object EmpsSalary: TFloatField
      FieldName = 'Salary'
    end
  end
  object LastItemQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = OrdersSource
    SQL.Strings = (
      'select max(ItemNo)  from Items'
      '  where OrderNo = :OrderNo')
    Left = 160
    Top = 110
    ParamData = <
      item
        DataType = ftFloat
        Name = 'OrderNo'
        ParamType = ptUnknown
      end>
  end
  object Cust: TIBTable
    Database = Database
    Transaction = Transaction
    BeforeOpen = CustBeforeOpen
    BeforePost = CustBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'CUSTNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'COMPANY'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
      end
      item
        Name = 'CONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LASTINVOICEDATE'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY28'
        Fields = 'CUSTNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'COMPANY'
        Fields = 'COMPANY'
      end>
    StoreDefs = True
    TableName = 'CUSTOMER'
    Left = 240
    Top = 10
    object CustCustNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 6
      FieldName = 'CustNo'
    end
    object CustCompany: TIBStringField
      DisplayWidth = 26
      FieldName = 'Company'
      Required = True
      Size = 30
    end
    object CustPhone: TIBStringField
      DisplayWidth = 15
      FieldName = 'Phone'
      Size = 15
    end
    object CustLastInvoiceDate: TDateTimeField
      DisplayLabel = 'LastInvoice'
      DisplayWidth = 10
      FieldName = 'LastInvoiceDate'
      DisplayFormat = 'DDDDD'
    end
    object CustAddr1: TIBStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object CustAddr2: TIBStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object CustCity: TIBStringField
      FieldName = 'City'
      Size = 15
    end
    object CustState: TIBStringField
      FieldName = 'State'
    end
    object CustZip: TIBStringField
      FieldName = 'Zip'
      Size = 10
    end
    object CustCountry: TIBStringField
      FieldName = 'Country'
    end
    object CustFAX: TIBStringField
      FieldName = 'FAX'
      Size = 15
    end
    object CustTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object CustContact: TIBStringField
      FieldName = 'Contact'
    end
  end
  object CustQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select Customer.CustNo, Customer.Company, '
      '         Customer.LastInvoiceDate, Customer.Phone '
      '  from customer'
      '  where '
      '    (customer.LastInvoiceDate >= :FromDate) and'
      '    (customer.LastInvoiceDate <= :ToDate)')
    Left = 240
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object CustQueryCustNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 6
      FieldName = 'CustNo'
    end
    object CustQueryCompany: TIBStringField
      DisplayWidth = 26
      FieldName = 'Company'
      Size = 30
    end
    object CustQueryPhone: TIBStringField
      DisplayWidth = 15
      FieldName = 'Phone'
      Size = 15
    end
    object CustQueryLastInvoiceDate: TDateTimeField
      DisplayLabel = 'LastInvoice'
      DisplayWidth = 10
      FieldName = 'LastInvoiceDate'
      DisplayFormat = 'DDDDD'
    end
  end
  object OrdByCust: TIBTable
    Database = Database
    Transaction = Transaction
    OnCalcFields = OrdByCustCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ORDERNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'CUSTNO'
        DataType = ftFloat
      end
      item
        Name = 'SALEDATE'
        DataType = ftDateTime
      end
      item
        Name = 'SHIPDATE'
        DataType = ftDateTime
      end
      item
        Name = 'EMPNO'
        DataType = ftInteger
      end
      item
        Name = 'SHIPTOCONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SHIPTOADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SHIPTOCITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SHIPTOSTATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SHIPTOCOUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHIPTOPHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SHIPVIA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'PO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TERMS'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PAYMENTMETHOD'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'ITEMSTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
      end
      item
        Name = 'FREIGHT'
        DataType = ftFloat
      end
      item
        Name = 'AMOUNTPAID'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'ORDERNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN30'
        Fields = 'CUSTNO'
      end>
    IndexFieldNames = 'CUSTNO'
    MasterFields = 'CustNo'
    MasterSource = CustMasterSrc
    ReadOnly = True
    StoreDefs = True
    TableName = 'ORDERS'
    Left = 240
    Top = 110
    object OrdByCustOrderNo: TFloatField
      Alignment = taLeftJustify
      DisplayWidth = 10
      FieldName = 'OrderNo'
    end
    object OrdByCustCustNo: TFloatField
      FieldName = 'CustNo'
      Visible = False
    end
    object OrdByCustSaleDate: TDateTimeField
      DisplayWidth = 9
      FieldName = 'SaleDate'
      DisplayFormat = 'DDDDD'
    end
    object OrdByCustShipDate: TDateTimeField
      DisplayWidth = 9
      FieldName = 'ShipDate'
      DisplayFormat = 'DDDDD'
    end
    object OrdByCustItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
      Visible = False
    end
    object OrdByCustTaxRate: TFloatField
      FieldName = 'TaxRate'
      Visible = False
    end
    object OrdByCustFreight: TCurrencyField
      FieldName = 'Freight'
      Visible = False
    end
    object OrdByCustAmountPaid: TCurrencyField
      DisplayWidth = 14
      FieldName = 'AmountPaid'
    end
    object OrdByCustAmountDue: TCurrencyField
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'AmountDue'
      Calculated = True
    end
  end
  object CustByComp: TIBTable
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CUSTNO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'COMPANY'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
      end
      item
        Name = 'CONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LASTINVOICEDATE'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY28'
        Fields = 'CUSTNO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'COMPANY'
        Fields = 'COMPANY'
      end>
    IndexFieldNames = 'Company'
    StoreDefs = True
    TableName = 'CUSTOMER'
    Left = 240
    Top = 160
  end
  object CustByLastInvQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from customer'
      'order by'
      'LastInvoiceDate descending')
    Left = 240
    Top = 208
    object CustByLastInvQueryCustNo: TFloatField
      FieldName = 'CustNo'
      Origin = '"CUSTOMER.DB".CustNo'
    end
    object CustByLastInvQueryCompany: TIBStringField
      FieldName = 'Company'
      Origin = '"CUSTOMER.DB".Company'
      Size = 30
    end
    object CustByLastInvQueryAddr1: TIBStringField
      FieldName = 'Addr1'
      Origin = '"CUSTOMER.DB".Addr1'
      Size = 30
    end
    object CustByLastInvQueryAddr2: TIBStringField
      FieldName = 'Addr2'
      Origin = '"CUSTOMER.DB".Addr2'
      Size = 30
    end
    object CustByLastInvQueryCity: TIBStringField
      FieldName = 'City'
      Origin = '"CUSTOMER.DB".City'
      Size = 15
    end
    object CustByLastInvQueryState: TIBStringField
      FieldName = 'State'
      Origin = '"CUSTOMER.DB".State'
    end
    object CustByLastInvQueryZip: TIBStringField
      FieldName = 'Zip'
      Origin = '"CUSTOMER.DB".Zip'
      Size = 10
    end
    object CustByLastInvQueryCountry: TIBStringField
      FieldName = 'Country'
      Origin = '"CUSTOMER.DB".Country'
    end
    object CustByLastInvQueryPhone: TIBStringField
      FieldName = 'Phone'
      Origin = '"CUSTOMER.DB".Phone'
      Size = 15
    end
    object CustByLastInvQueryFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CUSTOMER.DB".FAX'
      Size = 15
    end
    object CustByLastInvQueryTaxRate: TFloatField
      FieldName = 'TaxRate'
      Origin = '"CUSTOMER.DB".TaxRate'
    end
    object CustByLastInvQueryContact: TIBStringField
      FieldName = 'Contact'
      Origin = '"CUSTOMER.DB".Contact'
    end
    object CustByLastInvQueryLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
      Origin = '"CUSTOMER.DB".LastInvoiceDate'
    end
  end
  object OrdersByDateQuery: TIBQuery
    Database = Database
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from orders'
      'where '
      '    (SaleDate >= :FromDate) and'
      '    (SaleDate <= :ToDate)'
      'order by '
      '  SaleDate')
    Left = 240
    Top = 256
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FromDate'
        ParamType = ptUnknown
        Value = 34700d
      end
      item
        DataType = ftDateTime
        Name = 'ToDate'
        ParamType = ptUnknown
        Value = 35488d
      end>
    object OrdersByDateQueryOrderNo: TFloatField
      FieldName = 'OrderNo'
      Origin = '"ORDERS.DB".OrderNo'
    end
    object OrdersByDateQueryCustNo: TFloatField
      FieldName = 'CustNo'
      Origin = '"ORDERS.DB".CustNo'
    end
    object OrdersByDateQuerySaleDate: TDateTimeField
      FieldName = 'SaleDate'
      Origin = '"ORDERS.DB".SaleDate'
    end
    object OrdersByDateQueryShipDate: TDateTimeField
      FieldName = 'ShipDate'
      Origin = '"ORDERS.DB".ShipDate'
    end
    object OrdersByDateQueryEmpNo: TIntegerField
      FieldName = 'EmpNo'
      Origin = '"ORDERS.DB".EmpNo'
    end
    object OrdersByDateQueryShipToContact: TIBStringField
      FieldName = 'ShipToContact'
      Origin = '"ORDERS.DB".ShipToContact'
    end
    object OrdersByDateQueryShipToAddr1: TIBStringField
      FieldName = 'ShipToAddr1'
      Origin = '"ORDERS.DB".ShipToAddr1'
      Size = 30
    end
    object OrdersByDateQueryShipToAddr2: TIBStringField
      FieldName = 'ShipToAddr2'
      Origin = '"ORDERS.DB".ShipToAddr2'
      Size = 30
    end
    object OrdersByDateQueryShipToCity: TIBStringField
      FieldName = 'ShipToCity'
      Origin = '"ORDERS.DB".ShipToCity'
      Size = 15
    end
    object OrdersByDateQueryShipToState: TIBStringField
      FieldName = 'ShipToState'
      Origin = '"ORDERS.DB".ShipToState'
    end
    object OrdersByDateQueryShipToZip: TIBStringField
      FieldName = 'ShipToZip'
      Origin = '"ORDERS.DB".ShipToZip'
      Size = 10
    end
    object OrdersByDateQueryShipToCountry: TIBStringField
      FieldName = 'ShipToCountry'
      Origin = '"ORDERS.DB".ShipToCountry'
    end
    object OrdersByDateQueryShipToPhone: TIBStringField
      FieldName = 'ShipToPhone'
      Origin = '"ORDERS.DB".ShipToPhone'
      Size = 15
    end
    object OrdersByDateQueryShipVIA: TIBStringField
      FieldName = 'ShipVIA'
      Origin = '"ORDERS.DB".ShipVIA'
      Size = 7
    end
    object OrdersByDateQueryPO: TIBStringField
      FieldName = 'PO'
      Origin = '"ORDERS.DB".PO'
      Size = 15
    end
    object OrdersByDateQueryTerms: TIBStringField
      FieldName = 'Terms'
      Origin = '"ORDERS.DB".Terms'
      Size = 6
    end
    object OrdersByDateQueryPaymentMethod: TIBStringField
      FieldName = 'PaymentMethod'
      Origin = '"ORDERS.DB".PaymentMethod'
      Size = 7
    end
    object OrdersByDateQueryItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
      Origin = '"ORDERS.DB".ItemsTotal'
    end
    object OrdersByDateQueryTaxRate: TFloatField
      FieldName = 'TaxRate'
      Origin = '"ORDERS.DB".TaxRate'
    end
    object OrdersByDateQueryFreight: TCurrencyField
      FieldName = 'Freight'
      Origin = '"ORDERS.DB".Freight'
    end
    object OrdersByDateQueryAmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
      Origin = '"ORDERS.DB".AmountPaid'
    end
    object OrdersByDateQueryCompany: TIBStringField
      FieldKind = fkLookup
      FieldName = 'Company'
      LookupDataSet = Cust
      LookupKeyFields = 'CustNo'
      LookupResultField = 'Company'
      KeyFields = 'CustNo'
      Size = 40
      Lookup = True
    end
  end
  object Transaction: TIBTransaction
    Active = False
    DefaultDatabase = Database
    AutoStopAction = saNone
    Left = 490
    Top = 10
  end
  object OpenDialog: TOpenDialog
    Filter = 'Interbase Files (*.gdb)|*.gdb|All Files (*.*)|*.*'
    Left = 570
    Top = 10
  end
  object OrdersSource: TDataSource
    DataSet = Orders
    Left = 90
    Top = 10
  end
  object CustByOrdSrc: TDataSource
    DataSet = CustByOrd
    Left = 90
    Top = 60
  end
  object ItemsSource: TDataSource
    DataSet = Items
    Left = 90
    Top = 110
  end
  object PartsSource: TDataSource
    DataSet = Parts
    Left = 90
    Top = 160
  end
  object EmpsSource: TDataSource
    DataSet = Emps
    Left = 90
    Top = 210
  end
  object VendorSource: TDataSource
    DataSet = Vendors
    Left = 90
    Top = 260
  end
  object CustSource: TDataSource
    DataSet = Cust
    Left = 320
    Top = 10
  end
  object CustMasterSrc: TDataSource
    DataSet = Cust
    Left = 320
    Top = 60
  end
  object OrdByCustSrc: TDataSource
    DataSet = OrdByCust
    Left = 320
    Top = 110
  end
  object CustByCompSrc: TDataSource
    DataSet = CustByComp
    Left = 320
    Top = 160
  end
  object MastRvProject: TRvProject
    Engine = MastRvSystem
    ProjectFile = 'MastApp.rav'
    Left = 570
    Top = 60
  end
  object CustByLastInvRvDataSetConnection: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CustByLastInvQuery
    Left = 580
    Top = 210
  end
  object MastRvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormWidth = 1024
    SystemPreview.FormHeight = 768
    SystemPreview.ZoomFactor = 100
    SystemPrinter.ScaleX = 100
    SystemPrinter.ScaleY = 100
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1
    Left = 570
    Top = 110
  end
  object OrdersByDateRvDataSetConnection: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = OrdersByDateQuery
    Left = 580
    Top = 260
  end
end
