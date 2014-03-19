unit dm_u;

interface

uses
  SysUtils, Classes, DB, DBClient, ScktComp, MConnect, SConnect,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, dialogs,
  frxClass, frxExportXLS, frxExportPDF, ADODB;

type
  TDM = class(TDataModule)
    SockConn: TSocketConnection;
    Cds_Com: TClientDataSet;
    Cds_Mst: TClientDataSet;
    Cds_Dtl: TClientDataSet;
    Cds_Qry: TClientDataSet;
    Cds_All: TClientDataSet;
    CltSckt: TClientSocket;
    Cds_Local: TClientDataSet;
    Cds_Exp: TClientDataSet;
    cds_dtl1: TClientDataSet;
    cds_dtl2: TClientDataSet;
    cds_Dtl3: TClientDataSet;
    cds_dtl4: TClientDataSet;
    cds_dtl5: TClientDataSet;
    IdFTP: TIdFTP;
    Cds_Com1: TClientDataSet;
    Cds_Com_SQN: TClientDataSet;
    Cds_Com3: TClientDataSet;
    Cds_Com2: TClientDataSet;
    cds_dtl6: TClientDataSet;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    Cds_qry1: TClientDataSet;
    Cds_qry3: TClientDataSet;
    Cds_qry2: TClientDataSet;
    Cds_qry4: TClientDataSet;
    Cds_Com4: TClientDataSet;
    Cds_Com5: TClientDataSet;
    Cds_Com6: TClientDataSet;
    conn: TADOConnection;
    tbl1: TADOTable;
    cmd: TADOCommand;
    qry: TADOQuery;
    ds: TADODataSet;
    sp: TADOStoredProc;
    procedure Cds_MstReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cds_DtlReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_dtl1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_dtl2ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_Dtl3ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_dtl4ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cds_QryReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cds_AllReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cds_LocalReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cds_ExpReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_dtl5ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
                                                                                
var
  DM: TDM;
  CdsMstErrStr: String;
  CdsDtlErrStr: String;
  CdsDtl1ErrStr, CdsDtl2ErrStr, CdsDtl3ErrStr, CdsDtl4ErrStr, CdsDtl5ErrStr: String;
  CdsAllErrStr, CdsQryErrStr, CdsExpErrStr, CdsLclErrStr: String;
implementation

{$R *.dfm}
procedure TDM.Cds_MstReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsMstErrStr:= E.Message;
end;

procedure TDM.Cds_DtlReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsDtlErrStr:= e.Message;
end;

procedure TDM.cds_dtl1ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsDtl1ErrStr:= e.Message;
end;

procedure TDM.cds_dtl2ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsDtl2ErrStr:= e.Message;
end;

procedure TDM.cds_Dtl3ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsDtl3ErrStr:= e.Message;
end;

procedure TDM.cds_dtl4ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsDtl4ErrStr:= e.Message;
end;

procedure TDM.Cds_QryReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsQryErrStr:= e.Message;
end;

procedure TDM.Cds_AllReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsAllErrStr:= e.Message;
end;

procedure TDM.Cds_LocalReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  cdsLclErrStr:= e.Message;
end;

procedure TDM.Cds_ExpReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  CdsExpErrStr:= e.Message;
end;

procedure TDM.cds_dtl5ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  cdsDtl5ErrStr:= e.Message;
end;

end.
