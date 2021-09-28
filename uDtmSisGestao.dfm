object dtmSisGestao: TdtmSisGestao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 287
  Width = 303
  object FdConnection: TFDConnection
    Params.Strings = (
      'Database=belem'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = FdTransaction
    BeforeConnect = FdConnectionBeforeConnect
    Left = 24
    Top = 8
  end
  object FdQryGeral: TFDQuery
    Connection = FdConnection
    Left = 112
    Top = 8
  end
  object FdQryConsulta: TFDQuery
    Connection = FdConnection
    Left = 24
    Top = 72
  end
  object FdQryGeralDados: TFDQuery
    Connection = FdConnection
    Left = 112
    Top = 72
  end
  object FDWait: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 208
    Top = 16
  end
  object FDMySQLDriverLink: TFDPhysMySQLDriverLink
    DriverID = 'MYSQL'
    VendorLib = 'C:\libmySQL.dll'
    Left = 208
    Top = 72
  end
  object FdTransaction: TFDTransaction
    Connection = FdConnection
    Left = 64
    Top = 136
  end
  object DataSetProvider1: TDataSetProvider
    Left = 32
    Top = 136
  end
end
