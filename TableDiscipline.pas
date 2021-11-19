unit TableDiscipline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmTableDiscipline = class(TForm)
    Panel1: TPanel;
    buAdd: TButton;
    buEdit: TButton;
    buDelete: TButton;
    chbFiltr: TCheckBox;
    edFilter: TEdit;
    StatusBar1: TStatusBar;
    buRefresh: TButton;
    buExit: TButton;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    mFile: TMenuItem;
    mExit: TMenuItem;
    mRefresh: TMenuItem;
    ActionList1: TActionList;
    acQuit: TAction;
    acRefresh: TAction;
    acQuery: TAction;
    procedure buAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buEditClick(Sender: TObject);
    procedure buDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acQuitExecute(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure chbFiltrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTableDiscipline: TfmTableDiscipline;

implementation

{$R *.dfm}

uses DM, AddDiscipline, EditDiscipline;

procedure TfmTableDiscipline.acQuitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmTableDiscipline.acRefreshExecute(Sender: TObject);
begin
with dmFACULT do
  begin
    //��������� ����� ������
    dstDiscipline.FullRefresh;
    //������� ���������� ������� � �������
    StatusBar1.Panels[1].Text := IntToStr(dstDiscipline.RecordCount);
  end;
end;

procedure TfmTableDiscipline.buAddClick(Sender: TObject);
begin
  //������� ����� Add
  fmAddDiscipline := TfmAddDiscipline.Create(Application);
  //��������� �� ���� ����� ���������� ������
  if fmAddDiscipline.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstDiscipline.Post;
    StatusBar1.Panels[1].Text := IntToStr(dmFACULT.dstDiscipline.RecordCount);
  end
  //��� ���������� ��
  else dmFACULT.dstDiscipline.Cancel;
end;

procedure TfmTableDiscipline.buDeleteClick(Sender: TObject);
begin
with dmFACULT do
  begin
    if dstDiscipline.RecordCount= 0 then exit;
    if Application.MessageBox('������� ������� ������?', '��������',
       MB_YESNO) = mrYes then dstDiscipline.Delete;
    StatusBar1.Panels[1].Text := IntToStr(dstDiscipline.RecordCount);
  end;
end;

procedure TfmTableDiscipline.buEditClick(Sender: TObject);
begin
//��������� ���������� �� ������ � �������
  if dmFACULT.dstDiscipline.RecordCount = 0  then exit;
  //������� ����� fmEdit
  fmEditDiscipline := TfmEditDiscipline.Create(Application);
   //��������� �� ���� ����� ��������� ������
  if fmEditDiscipline.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstDiscipline.Post;
    StatusBar1.Panels[1].Text := IntToStr(dmFACULT.dstDiscipline.RecordCount);
  end
  //��� ���������� ��
  else dmFACULT.dstDiscipline.Cancel;
end;

procedure TfmTableDiscipline.chbFiltrClick(Sender: TObject);
var fn : string;
begin
  fn := '';
  if (chbFiltr.Checked) and (edFilter.Text<>'') then
  begin
    //���� �������� checked ����������� � ���� ������� ��� ������
    fn := '(NAME LIKE '''+edFilter.Text+'%'')';
    dmFACULT.dstDiscipline.Close;
    dmFACULT.dstDiscipline.MainWhereClause := fn;
    dmFACULT.dstDiscipline.Open;
  end
  else
  begin
    //���� �������� checked �� �����������
    dmFACULT.dstDiscipline.Close;
    dmFACULT.dstDiscipline.MainWhereClause := fn;
    dmFACULT.dstDiscipline.Open;
  end;
end;

procedure TfmTableDiscipline.DBGrid1TitleClick(Column: TColumn);
var
  cn : string;
begin
  cn := Column.FieldName;
  if dmFACULT.dstDiscipline.OrderClause <> cn  then
  begin
    dmFACULT.dstDiscipline.Close;
    dmFACULT.dstDiscipline.OrderClause := cn;
    dmFACULT.dstDiscipline.Open;
  end;
end;

procedure TfmTableDiscipline.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmFACULT do
    begin
    //������ �����������.
    dstDiscipline.Active := False;
    //��������� ����� � ����� ������
    dbFACULT.Connected := False;
    end;
    fmTableDiscipline := nil;
end;

procedure TfmTableDiscipline.FormShow(Sender: TObject);
begin
//������� ���� ������
  with dmFACULT do
  begin
    //������������� ����� � ����� ������
    dbFACULT.Connected := True;
    //������������ ������
    dstDiscipline.Active := True;
    //��������� ����� ������
    dstDiscipline.FullRefresh;
    //������� ���������� ������� � ������� Phone
    StatusBar1.Panels[1].Text := IntToStr(dstDiscipline.RecordCount);
  end;
end;



end.
