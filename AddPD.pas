unit AddPD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmAddPD = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBLCNDIS: TDBLookupComboBox;
    Edit1: TEdit;
    procedure buOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddPD: TfmAddPD;

implementation

{$R *.dfm}

uses DM, TableTeacherDiscipline;

procedure TfmAddPD.buCancelClick(Sender: TObject);
begin
  //������� ����� �� ������ ����������
  fmAddPD := nil;
end;

procedure TfmAddPD.buOkClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    //�������� ����� ������ � ����� ���������� ������
    dstPD.Insert;
    //������� ��������� �������� � ����� ������
    dstPD.FBN('NTEACH').AsInteger :=
      fmTableTeacherDiscipline.DBGrid2.DataSource.DataSet.FieldByName('NTEACH').AsInteger;
    dstPD.FBN('NDIS').AsInteger := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
  end;
end;

procedure TfmAddPD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //������� ����� �� ������ ����������
  fmAddPD := nil;
    Action := cafree;
end;

procedure TfmAddPD.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
  //�������� ����� ������ � ����� ��������� ������
    dstPD.Edit;
    Edit1.Text := fmTableTeacherDiscipline.DBGrid2.DataSource.DataSet.FieldByName('SURNAME').AsString;
  end;
end;

end.
