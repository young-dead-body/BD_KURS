unit QueryListStudTeachDis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfmQueryListStudTeachDis = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    buRequest: TButton;
    buExit: TButton;
    DBLCNTEACH: TDBLookupComboBox;
    DBLCNDIS: TDBLookupComboBox;
    procedure buRequestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLCNDISClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQueryListStudTeachDis: TfmQueryListStudTeachDis;

implementation

{$R *.dfm}

uses DM;

procedure TfmQueryListStudTeachDis.buRequestClick(Sender: TObject);
var
  NTEACH, NDIS: INTEGER;
begin
  NDIS := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
  NTEACH := DBLCNTEACH.Listsource.Dataset.FieldByName('NTEACH').AsInteger;
  with dmFACULT do
  begin
    if dstSelectQueryTeacher.Active then
      dstSelectQueryTeacher.Close;
      dstSelectQueryTeacher.SelectSQL.Clear;
      dstSelectQueryTeacher.SelectSQL.Add('SELECT FAM');
      dstSelectQueryTeacher.SelectSQL.Add('FROM STUD');
      dstSelectQueryTeacher.SelectSQL.Add('WHERE NSTUD IN (SELECT NSTUD');
      dstSelectQueryTeacher.SelectSQL.Add('FROM APPLIC');
      dstSelectQueryTeacher.SelectSQL.Add('WHERE NTEACH = '+ INTTOSTR(NTEACH));
      dstSelectQueryTeacher.SelectSQL.Add('AND NDIS = '+ INTTOSTR(NDIS)+' )');
      dstSelectQueryTeacher.Open;
  end;
  DBGrid1.Columns[0].Title.Caption := 'Фамилии студентов';
end;

procedure TfmQueryListStudTeachDis.DBLCNDISClick(Sender: TObject);
begin
  dmFACULT.dstPDTEACH.Active := true;
end;

procedure TfmQueryListStudTeachDis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmFacult.dstTeacher.Active := false;
    dmFacult.dstDiscipline.Active := false;
    dmFACULT.dstPDTEACH.Active := false;
    fmQueryListStudTeachDis :=nil;
end;

procedure TfmQueryListStudTeachDis.FormShow(Sender: TObject);
begin
    dmFacult.dstTeacher.Active := true;
    dmFacult.dstDiscipline.Active := true;
end;

end.
