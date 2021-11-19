unit AddDiscipline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmAddDiscipline = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    edName: TEdit;
    edTTIME: TEdit;
    procedure buOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddDiscipline: TfmAddDiscipline;

implementation

{$R *.dfm}

uses DM;

procedure TfmAddDiscipline.buCancelClick(Sender: TObject);
begin
  //������� ����� �� ������ ����������
  fmAddDiscipline := nil;
end;

procedure TfmAddDiscipline.buOkClick(Sender: TObject);
begin
 with dmFACULT do
  begin
    //�������� ����� ������ � ����� ���������� ������
    dstDiscipline.Insert;
    //������� ��������� �������� � ����� ������
    dstDiscipline.FBN('NAME').AsString := edNAME.Text;
    dstDiscipline.FBN('TTIME').AsString := edTTIME.Text;
    end;
end;
procedure TfmAddDiscipline.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //������� ����� �� ������ ����������
  fmAddDiscipline := nil;
  Action := cafree;
end;


end.
