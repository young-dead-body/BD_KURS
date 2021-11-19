unit EditTeacher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmEditTeacher = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edFam: TEdit;
    edName: TEdit;
    edOtch: TEdit;
    cbNauchStep: TComboBox;
    cbNauchZvan: TComboBox;
    procedure buOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditTeacher: TfmEditTeacher;

implementation

{$R *.dfm}

uses DM;

procedure TfmEditTeacher.buOkClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    //Заносим введенные значения в набор данных
    dstTeacher.Edit;
    dstTeacher.FBN('SURNAME').AsString := edFam.Text;
    dstTeacher.FBN('NAME').AsString := edName.Text;
    dstTeacher.FBN('OTHESTVO').AsString := edOtch.Text;
    dstTeacher.FBN('ACADDEGREE').AsString := cbNauchStep.Text;
    dstTeacher.FBN('TITLE').AsString := cbNauchZvan.Text;
  end;
end;

procedure TfmEditTeacher.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Удаляем форму из памяти компьютера
  Action := caFree;
  fmEditTeacher := nil;
end;

procedure TfmEditTeacher.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
  //Включаем набор данных в режим изменения записи
    dstTeacher.Edit;
    dstTeacher.FBN('SURNAME').AsString := edFam.Text;
    dstTeacher.FBN('NAME').AsString := edName.Text;
    dstTeacher.FBN('OTHESTVO').AsString := edOtch.Text;
    dstTeacher.FBN('ACADDEGREE').AsString := cbNauchStep.Text;
    dstTeacher.FBN('TITLE').AsString := cbNauchZvan.Text;
  end;
  edFam.SetFocus;
  edName.SetFocus;
  edOtch.SetFocus;
  cbNauchStep.SetFocus;
  cbNauchZvan.SetFocus;
end;

end.
