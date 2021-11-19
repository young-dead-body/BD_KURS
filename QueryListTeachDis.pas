unit QueryListTeachDis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfmQueryListTeachDis = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    buRequest: TButton;
    buExit: TButton;
    DBLCNTEACH: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buRequestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQueryListTeachDis: TfmQueryListTeachDis;

implementation

{$R *.dfm}

uses DM;

procedure TfmQueryListTeachDis.buRequestClick(Sender: TObject);
var
  NTEACH: INTEGER;
begin
  NTEACH := DBLCNTEACH.Listsource.Dataset.FieldByName('NTEACH').AsInteger;
  with dmFACULT do
  begin
    if dstSelectQueryTeacher.Active then
      dstSelectQueryTeacher.Close;
      dstSelectQueryTeacher.SelectSQL.Clear;
      dstSelectQueryTeacher.SelectSQL.Add('SELECT NAME');
      dstSelectQueryTeacher.SelectSQL.Add('FROM DISCIPLINE');
      dstSelectQueryTeacher.SelectSQL.Add('WHERE NDIS IN (');
      dstSelectQueryTeacher.SelectSQL.Add('SELECT NDIS');
      dstSelectQueryTeacher.SelectSQL.Add('FROM PD');
      dstSelectQueryTeacher.SelectSQL.Add('WHERE NTEACH = '+ INTTOSTR(NTEACH) +')');

      dstSelectQueryTeacher.Open;
  end;
  DBGrid1.Columns[0].Title.Caption := 'Наименования дисциплин';
end;

procedure TfmQueryListTeachDis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmFacult.dstTeacher.Active := false;
    dmFacult.dstPDTEACH.Active := false;
    fmQueryListTeachDis := nil;
end;

procedure TfmQueryListTeachDis.FormShow(Sender: TObject);
begin
    dmFacult.dstTeacher.Active := true;
    dmFacult.dstPDTEACH.Active := true;
end;

end.
