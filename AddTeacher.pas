unit AddTeacher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmAddTeacher = class(TForm)
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
    procedure buCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddTeacher: TfmAddTeacher;

implementation

{$R *.dfm}

uses DM;

procedure TfmAddTeacher.buCancelClick(Sender: TObject);
begin
  //������� ����� �� ������ ����������
  //Action := caFree;
  fmAddTeacher := nil;
end;

procedure TfmAddTeacher.buOkClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    //�������� ����� ������ � ����� ���������� ������
    dstTeacher.Insert;
    //������� ��������� �������� � ����� ������
    dstTeacher.FBN('SURNAME').AsString := edFam.Text;
    dstTeacher.FBN('NAME').AsString := edName.Text;
    dstTeacher.FBN('OTHESTVO').AsString := edOtch.Text;
    dstTeacher.FBN('ACADDEGREE').AsString := cbNauchStep.Text;
    dstTeacher.FBN('TITLE').AsString := cbNauchZvan.Text;
  end;
end;

end.
