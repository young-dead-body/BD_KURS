unit TableTeacherDiscipline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfmTableTeacherDiscipline = class(TForm)
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    buAddTeacher: TButton;
    buDeleteTeacher: TButton;
    buEditTeacher: TButton;
    ActionList1: TActionList;
    acQuit: TAction;
    acRefresh: TAction;
    Panel4: TPanel;
    buAddPD: TButton;
    buDeletePD: TButton;
    buEditPD: TButton;
    buRefresh: TButton;
    procedure FormShow(Sender: TObject);
    procedure buAddTeacherClick(Sender: TObject);
    procedure buEditTeacherClick(Sender: TObject);
    procedure buDeleteTeacherClick(Sender: TObject);
    procedure buAddPDClick(Sender: TObject);
    procedure buEditPDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acQuitExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure buDeletePDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTableTeacherDiscipline: TfmTableTeacherDiscipline;

implementation

{$R *.dfm}

uses DM, AddTeacher, EditTeacher, AddPD, EditPD;

procedure TfmTableTeacherDiscipline.acQuitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmTableTeacherDiscipline.acRefreshExecute(Sender: TObject);
begin
  with dmFACULT do
  begin
    //��������� ����� ������
    dstPD.FullRefresh;
    dstTeacher.FullRefresh;
  end;
end;

procedure TfmTableTeacherDiscipline.formShow(Sender: TObject);
begin
//������� ���� ������
  with dmFACULT do
  begin
    //������������� ����� � ����� ������
    dbFACULT.Connected := True;
    //������������ ������
    dstPD.Active := True;
    dstTeacher.Active := True;
    dstDiscipline.Active := True;

    //��������� ����� ������
    dstPD.FullRefresh;
    dstTeacher.FullRefresh;
  end;
end;

procedure TfmTableTeacherDiscipline.buAddTeacherClick(Sender: TObject);
begin
  //������� ����� Add
  fmAddTeacher := TfmAddTeacher.Create(Application);
  //��������� �� ���� ����� ���������� ������
  if fmAddTeacher.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstTeacher.Post;
  end
  //��� ���������� ��
  else dmFACULT.dstTeacher.Cancel;
end;

procedure TfmTableTeacherDiscipline.buDeletePDClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    if dstPD.RecordCount = 0 then exit;
    if Application.MessageBox('������� ������� ������?', '��������',
                              MB_YESNO) = mrYes then dstPD.Delete;
  end;
end;

procedure TfmTableTeacherDiscipline.buDeleteTeacherClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    if dstTeacher.RecordCount = 0 then exit;
    if Application.MessageBox('������� ������� ������?', '��������',
                              MB_YESNO) = mrYes then dstTeacher.Delete;
  end;
end;

procedure TfmTableTeacherDiscipline.buEditPDClick(Sender: TObject);
begin
  //��������� ���������� �� ������ � �������
  if dmFACULT.dstPD.RecordCount = 0  then exit;
  //������� ����� fmEdit
  fmEditPD := TfmEditPD.Create(Application);
   //��������� �� ���� ����� ��������� ������
  if fmEditPD.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstPD.Post;
  end
  //��� ���������� ��
  else dmFACULT.dstPD.Cancel;
end;

procedure TfmTableTeacherDiscipline.buEditTeacherClick(Sender: TObject);
begin
  //��������� ���������� �� ������ � �������
  if dmFACULT.dstTeacher.RecordCount = 0  then exit;
  //������� ����� fmEdit
  fmEditTeacher := TfmEditTeacher.Create(Application);
   //��������� �� ���� ����� ��������� ������
  if fmEditTeacher.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstTeacher.Post;
  end
  //��� ���������� ��
  else dmFACULT.dstTeacher.Cancel;
end;


procedure TfmTableTeacherDiscipline.buAddPDClick(Sender: TObject);
begin
  //������� ����� Add
  fmAddPD := TfmAddPD.Create(Application);
  //��������� �� ���� ����� ���������� ������
  if fmAddPD.ShowModal = mrOK then
  begin
    //������������ ����������
    dmFACULT.dstPD.Post;
  end
  //��� ���������� ��
  else dmFACULT.dstPD.Cancel;
end;

procedure TfmTableTeacherDiscipline.FormClose(Sender: TObject; var Action: TCloseAction);
begin

with dmFACULT do
  begin
    dstPD.Active := false;
    dstTeacher.Active := false;
    dstDiscipline.Active := false;
  end;
  Action :=cafree;
  fmTableTeacherDiscipline := nil;
end;

end.
