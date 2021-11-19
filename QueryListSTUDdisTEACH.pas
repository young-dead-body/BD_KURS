unit QueryListSTUDdisTEACH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FIBDataSet, pFIBDataSet,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfmQueryListSTUDdisTEACH = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    buExit: TButton;
    DBLCNTEACH: TDBLookupComboBox;
    DBLCNDIS: TDBLookupComboBox;
    dstApplic: TpFIBDataSet;
    dstApplicNAPPLIC: TFIBIntegerField;
    dstApplicNSTUD: TFIBIntegerField;
    dstApplicNPD: TFIBIntegerField;
    dstApplicNDIS: TFIBIntegerField;
    dstApplicNTEACH: TFIBIntegerField;
    dstApplicSURNAMESTUD: TStringField;
    procedure buExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQueryListSTUDdisTEACH: TfmQueryListSTUDdisTEACH;

implementation

{$R *.dfm}

uses DM;

procedure TfmQueryListSTUDdisTEACH.buExitClick(Sender: TObject);
var
  NDIS, NTEACH: INTEGER;
begin
   { NDIS := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
    NTEACH := DBLCNTEACH.Listsource.Dataset.FieldByName('NTEACH').AsInteger;
  with dmFACULT do
  begin
    if dstSelectQueryTeacher.Active then
      dstSelectQueryTeacher.Close;
      dstSelectQueryTeacher.SelectSQL.Clear;
      dstSelectQueryTeacher.SelectSQL.Add('SELECT NSTUD');
      dstSelectQueryTeacher.SelectSQL.Add('FROM APPLIC');
      //dstSelectQueryTeacher.SelectSQL.Add('WHERE (NDIS = '+INTTOSTR(NDIS)+') AND (NTEACH = '
      //+INTTOSTR(NTEACH)+')');
      dstSelectQueryTeacher.Open;
  end; }
end;

end.
