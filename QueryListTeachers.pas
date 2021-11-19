unit QueryListTeachers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfmQueryListTeachers = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    buRequest: TButton;
    buExit: TButton;
    procedure buRequestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQueryListTeachers: TfmQueryListTeachers;

implementation

{$R *.dfm}

uses DM;

procedure TfmQueryListTeachers.buRequestClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    if dstSelectQueryTeacher.Active then
      dstSelectQueryTeacher.Close;
      dstSelectQueryTeacher.SelectSQL.Clear;
      dstSelectQueryTeacher.SelectSQL.Add('SELECT SURNAME');
      dstSelectQueryTeacher.SelectSQL.Add('FROM TEACHER');
      dstSelectQueryTeacher.SelectSQL.Add('ORDER BY SURNAME');
      dstSelectQueryTeacher.Open;
  end;
  DBGrid1.Columns[0].Title.Caption := 'Фамилии преподавателей';
end;

procedure TfmQueryListTeachers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmQueryListTeachers := nil;
  with dmFACULT do
  begin
    //Запрос закрывается.
    dstSelectQueryTeacher.Active := False;
    //Закрываем связь с базой данных
    dbFACULT.Connected := False;
  end;
end;

procedure TfmQueryListTeachers.FormShow(Sender: TObject);
begin
 with dmFACULT do
  begin
    //Закрываем связь с базой данных
    dbFACULT.Connected := true;
  end;
end;

end.
