unit TableStudApplic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmTableStudApplic = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    MainMenu1: TMainMenu;
    mFile: TMenuItem;
    mExit: TMenuItem;
    mRefresh: TMenuItem;
    ActionList1: TActionList;
    acQuit: TAction;
    acRefresh: TAction;
    buAddStud: TButton;
    buDeleteStud: TButton;
    buEditStud: TButton;
    Panel1: TPanel;
    buAddApplic: TButton;
    buEditApplic: TButton;
    buDeleteApplic: TButton;
    buRefresh: TButton;
    buExit: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acQuitExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure buAddApplicClick(Sender: TObject);
    procedure buEditApplicClick(Sender: TObject);
    procedure buDeleteApplicClick(Sender: TObject);
    procedure buAddStudClick(Sender: TObject);
    procedure buDeleteStudClick(Sender: TObject);
    procedure buEditStudClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTableStudApplic: TfmTableStudApplic;

implementation

{$R *.dfm}

uses DM, AddApplic, EditApplic, AddStud, EditStud;

procedure TfmTableStudApplic.acQuitExecute(Sender: TObject);
begin
  //Application.Terminate;
  fmTableStudApplic := nil;
  Close;
end;

procedure TfmTableStudApplic.DBGrid1TitleClick(Column: TColumn);
var
  cn : string;
begin
  cn := Column.FieldName;
  if dmFACULT.dstStudent.OrderClause <> cn  then
  begin
    dmFACULT.dstStudent.Close;
    dmFACULT.dstStudent.OrderClause := cn;
    dmFACULT.dstStudent.Open;
    dmFACULT.dstAPPLIC.FullRefresh;  // для того, чтобы обновить данные в таблице APPLIC
  end;
end;

procedure TfmTableStudApplic.acRefreshExecute(Sender: TObject);
begin
with dmFACULT do
  begin
    //Обновляем набор данных
    dstStudent.FullRefresh;
    dstAPPLIC.FullRefresh;
  end;
end;


procedure TfmTableStudApplic.buAddStudClick(Sender: TObject);
begin
  //Создаем форму Add
  fmAddStud := TfmAddStud.Create(Application);
  //Выполняем на этой форме добавление записи
  if fmAddStud.ShowModal = mrOK then
  begin
    //Подтверждаем транзакцию
    dmFACULT.dstStudent.Post;
  end
  //или откатываем ее
  else dmFACULT.dstStudent.Cancel;
end;


procedure TfmTableStudApplic.buDeleteApplicClick(Sender: TObject);
begin
with dmFACULT do
  begin
    if dstAPPLIC.RecordCount= 0 then exit;
    if Application.MessageBox('Удалить текущую запись?', 'Удаление',
       MB_YESNO) = mrYes then dstAPPLIC.Delete;
  end;
end;

procedure TfmTableStudApplic.buEditApplicClick(Sender: TObject);
begin
//Проверить существуют ли записи в таблице
  if dmFACULT.dstAPPLIC.RecordCount = 0  then exit;
  //Создать форму fmEdit
  fmEditApplic := TfmEditApplic.Create(Application);
   //Выполняем на этой форме изменение записи
  if fmEditApplic.ShowModal = mrOK then
  begin
    //Подтверждаем транзакцию
    dmFACULT.dstAPPLIC.Post;
  end
  //или откатываем ее
  else dmFACULT.dstAPPLIC.Cancel;
end;

procedure TfmTableStudApplic.buEditStudClick(Sender: TObject);
begin
  //Проверить существуют ли записи в таблице
  if dmFACULT.dstStudent.RecordCount = 0  then exit;
  //Создать форму fmEdit
  fmEditStud := TfmEditStud.Create(Application);
   //Выполняем на этой форме изменение записи
  if fmEditStud.ShowModal = mrOK then
  begin
    //Подтверждаем транзакцию
    dmFACULT.dstStudent.Post;
  end
  //или откатываем ее
  else dmFACULT.dstStudent.Cancel;
end;

procedure TfmTableStudApplic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmFACULT do
  begin
    //Запрос закрывается.
    dstStudent.Active := False;
    dstApplic.Active := False;
    //Закрываем связь с базой данных
    dbFACULT.Connected := False;
  end;
end;

procedure TfmTableStudApplic.FormShow(Sender: TObject);
begin
//Открыть базу данных
  with dmFACULT do
  begin
    //Устанавливаем связь с базой данных
    dbFACULT.Connected := True;
    //Активизируем запрос
    dstStudent.Active := True;
    dstApplic.Active := True;
  end;
end;

procedure TfmTableStudApplic.buDeleteStudClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    if dstStudent.RecordCount= 0 then exit;
    if Application.MessageBox('Удалить текущую запись?', 'Удаление',
       MB_YESNO) = mrYes then dstStudent.Delete;
  end;
end;



procedure TfmTableStudApplic.buAddApplicClick(Sender: TObject);
begin
  //Создаем форму Add
  fmAddApplic := TfmAddApplic.Create(Application);
  //Выполняем на этой форме добавление записи
  if fmAddApplic.ShowModal = mrOK then
  begin
    //Подтверждаем транзакцию
    dmFACULT.dstAPPLIC.Post;
  end
  //или откатываем ее
  else dmFACULT.dstAPPLIC.Cancel;
end;

end.
