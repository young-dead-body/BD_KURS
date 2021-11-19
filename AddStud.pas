unit AddStud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmAddStud = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edFam: TEdit;
    edNGroup: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddStud: TfmAddStud;

implementation

{$R *.dfm}

uses DM;


procedure TfmAddStud.buOkClick(Sender: TObject);
begin
 with dmFACULT do
  begin
    //Включаем набор данных в режим добавления записи
    dstStudent.Insert;
    //Заносим введенные значения в набор данных
    dstStudent.FBN('FAM').AsString := edFam.Text;
    dstStudent.FBN('NUMGROUPS').AsString := edNGroup.Text;
    end;
end;

procedure TfmAddStud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Удаляем форму из памяти компьютера
  Action := caFree;
  fmAddStud := nil;
end;

end.
