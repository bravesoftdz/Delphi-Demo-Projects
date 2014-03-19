object DM: TDM
  OldCreateOrder = False
  Left = 653
  Top = 156
  Height = 530
  Width = 393
  object SockConn: TSocketConnection
    Connected = True
    ServerGUID = '{A0451873-E09E-4AD3-A9E7-76B58C1A873A}'
    ServerName = 'BrainSrvr.MidSrvrOra'
    Address = '127.0.0.1'
    Left = 16
    Top = 8
  end
  object Cds_Com: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 16
    Top = 56
  end
  object Cds_Mst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMst'
    RemoteServer = SockConn
    OnReconcileError = Cds_MstReconcileError
    Left = 16
    Top = 112
  end
  object Cds_Dtl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl'
    RemoteServer = SockConn
    OnReconcileError = Cds_DtlReconcileError
    Left = 72
    Top = 8
  end
  object Cds_Qry: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_QryReconcileError
    Left = 112
    Top = 16
  end
  object Cds_All: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAll'
    RemoteServer = SockConn
    OnReconcileError = Cds_AllReconcileError
    Left = 152
    Top = 56
  end
  object CltSckt: TClientSocket
    Active = False
    Address = '192.168.0.252'
    ClientType = ctBlocking
    Port = 95800
    Left = 16
    Top = 168
  end
  object Cds_Local: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_LocalReconcileError
    Left = 128
    Top = 96
  end
  object Cds_Exp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExp'
    RemoteServer = SockConn
    OnReconcileError = Cds_ExpReconcileError
    Left = 128
    Top = 144
  end
  object cds_dtl1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl1'
    RemoteServer = SockConn
    OnReconcileError = cds_dtl1ReconcileError
    Left = 72
    Top = 56
  end
  object cds_dtl2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl2'
    RemoteServer = SockConn
    OnReconcileError = cds_dtl2ReconcileError
    Left = 72
    Top = 104
  end
  object cds_Dtl3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl3'
    RemoteServer = SockConn
    OnReconcileError = cds_Dtl3ReconcileError
    Left = 72
    Top = 152
  end
  object cds_dtl4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl4'
    RemoteServer = SockConn
    OnReconcileError = cds_dtl4ReconcileError
    Left = 72
    Top = 208
  end
  object cds_dtl5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl5'
    RemoteServer = SockConn
    OnReconcileError = cds_dtl5ReconcileError
    Left = 136
    Top = 200
  end
  object IdFTP: TIdFTP
    Host = '192.168.0.2'
    Password = 'his2926666'
    User = 'his'
    Left = 16
    Top = 216
  end
  object Cds_Com1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 224
    Top = 56
  end
  object Cds_Com_SQN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 224
    Top = 232
  end
  object Cds_Com3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 224
    Top = 176
  end
  object Cds_Com2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 224
    Top = 120
  end
  object cds_dtl6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtl6'
    RemoteServer = SockConn
    OnReconcileError = cds_dtl5ReconcileError
    Left = 136
    Top = 256
  end
  object frxXLSExport1: TfrxXLSExport
    ShowProgress = True
    Left = 176
    Top = 8
  end
  object frxPDFExport1: TfrxPDFExport
    Left = 224
    Top = 8
  end
  object Cds_qry1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_QryReconcileError
    Left = 16
    Top = 280
  end
  object Cds_qry3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_QryReconcileError
    Left = 16
    Top = 336
  end
  object Cds_qry2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_QryReconcileError
    Left = 72
    Top = 280
  end
  object Cds_qry4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = SockConn
    OnReconcileError = Cds_QryReconcileError
    Left = 72
    Top = 336
  end
  object Cds_Com4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 216
    Top = 288
  end
  object Cds_Com5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 208
    Top = 344
  end
  object Cds_Com6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCom'
    RemoteServer = SockConn
    Left = 144
    Top = 320
  end
  object conn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=RSGl;Data Source=.\SQLExpress'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 272
    Top = 320
  end
  object tbl1: TADOTable
    Connection = conn
    Left = 328
    Top = 320
  end
  object cmd: TADOCommand
    Connection = conn
    Parameters = <>
    Left = 272
    Top = 376
  end
  object qry: TADOQuery
    Connection = conn
    Parameters = <>
    Left = 328
    Top = 376
  end
  object ds: TADODataSet
    Connection = conn
    Parameters = <>
    Left = 272
    Top = 440
  end
  object sp: TADOStoredProc
    Connection = conn
    Parameters = <>
    Left = 328
    Top = 408
  end
end
