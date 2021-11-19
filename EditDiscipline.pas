unit EditDiscipline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmEditDiscipline = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    edName: TEdit;
    edTTIME: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure buOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditDiscipline: TfmEditDiscipline;

implementation

{$R *.dfm}

uses DM;

procedure TfmEditDiscipline.buOkClick(Sender: TObject);
begin
 with dmFACULT do
  begin
    //Заносим введенные значения в набор данных
    dstDiscipline.Edit;
    dstDiscipline.FBN('NAME').AsString := edNAME.Text;
    dstDiscipline.FBN('TTIME').AsString := edTTIME.Text;
  end;
end;

procedure TfmEditDiscipline.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Удаляем форму из памяти компьютера
  fmEditDiscipline := nil;
end;

procedure TfmEditDiscipline.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
  //Включаем набор данных в режим изменения записи
    dstDiscipline.Edit;
    dstDiscipline.FBN('NAME').AsString := edNAME.Text;
    dstDiscipline.FBN('TTIME').AsString := edTTIME.Text;
  end;
  edName.SetFocus;
end;

end.
