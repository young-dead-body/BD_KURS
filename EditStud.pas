unit EditStud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmEditStud = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edFam: TEdit;
    edNGroup: TEdit;
    procedure buOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditStud: TfmEditStud;

implementation

{$R *.dfm}

uses DM;

procedure TfmEditStud.buOkClick(Sender: TObject);
begin
 with dmFACULT do
  begin
    //Заносим введенные значения в набор данных
    dstStudent.Edit;
    dstStudent.FBN('FAM').AsString := edFam.Text;
    dstStudent.FBN('NUMGROUPS').AsString := edNGroup.Text;
  end;
end;

procedure TfmEditStud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Удаляем форму из памяти компьютера
  Action := caFree;
  fmEditStud := nil;
end;

procedure TfmEditStud.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
  //Включаем набор данных в режим изменения записи
    dstStudent.Edit;
    dstStudent.FBN('FAM').AsString := edFam.Text;
    dstStudent.FBN('NUMGROUPS').AsString := edNGroup.Text;
  end;
  edFam.SetFocus;
end;

end.
