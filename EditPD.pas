unit EditPD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmEditPD = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBLCNDIS: TDBLookupComboBox;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure buOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditPD: TfmEditPD;

implementation

{$R *.dfm}

uses DM, TableTeacherDiscipline;



procedure TfmEditPD.buOkClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    //Заносим введенные значения в набор данных
    dstPD.FBN('NTEACH').AsInteger :=
      fmTableTeacherDiscipline.DBGrid2.DataSource.DataSet.FieldByName('NTEACH').AsInteger;
    dstPD.FBN('NDIS').AsInteger := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
  end;

end;

procedure TfmEditPD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Удаляем форму из памяти компьютера
  fmEditPD := nil;
    Action := cafree;
end;

procedure TfmEditPD.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
  //Включаем набор данных в режим изменения записи
    dstPD.Edit;
    Edit1.Text := fmTableTeacherDiscipline.DBGrid2.DataSource.DataSet.FieldByName('SURNAME').AsString;
  end;

end;

end.
