unit QueryListDisciplineTeacher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfmQueryListDisciplineTeacher = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    buExit: TButton;
    DBLCNTEACH: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQueryListDisciplineTeacher: TfmQueryListDisciplineTeacher;

implementation

{$R *.dfm}

uses DM;

procedure TfmQueryListDisciplineTeacher.FormShow(Sender: TObject);
begin
  dmFACULT.dstTeacher.Active := true;
  dmFACULT.dstPD.Active := true;
end;

end.
