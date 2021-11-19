unit FacultDiscipline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg;

type
  TfmFacultDiscipline = class(TForm)
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    AboutTheProgram: TMenuItem;
    StudentApplic: TMenuItem;
    TablePD: TMenuItem;
    N8: TMenuItem;
    mnClose: TMenuItem;
    ListTeachers: TMenuItem;
    mnDisciplineTeach: TMenuItem;
    mnSTUDdisTEACH: TMenuItem;
    mnReportStudents: TMenuItem;
    mnReportStudDis: TMenuItem;
    mnReportDisTeach: TMenuItem;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure mnCloseClick(Sender: TObject);
    //=================СУБФОРМЫ====================
    procedure DisciplineClick(Sender: TObject);
    procedure TablePDClick(Sender: TObject);
    procedure StudentApplicClick(Sender: TObject);
    //==========ОТЧЁТЫ=============================
    procedure mnReportStudentsClick(Sender: TObject);
    procedure mnReportStudDisClick(Sender: TObject);
    //========Запросы==============================
    procedure ListTeachersClick(Sender: TObject);
    procedure mnDisciplineTeachClick(Sender: TObject);
    procedure mnSTUDdisTEACHClick(Sender: TObject);
    procedure AboutTheProgramClick(Sender: TObject);
    procedure mnReportDisTeachClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFacultDiscipline: TfmFacultDiscipline;

implementation

{$R *.dfm}

uses TableTeacherDiscipline, TableDiscipline, QueryListTeachers,
  TableStudApplic, QueryListTeachDis, QueryListStudTeachDis, DM, ReportStudDis, ReportDisTeach;

procedure TfmFacultDiscipline.FormShow(Sender: TObject);
begin
  fmFacultDiscipline.Height  := 550;
  fmFacultDiscipline.Width  := 1090;
end;

procedure TfmFacultDiscipline.ListTeachersClick(Sender: TObject);
begin
  if (not Assigned(fmQueryListTeachers)) then
    fmQueryListTeachers := TfmQueryListTeachers.Create(Application);
  fmQueryListTeachers.Show;
end;

procedure TfmFacultDiscipline.mnCloseClick(Sender: TObject);
begin
  fmFacultDiscipline := nil;
  Close();
  //Action := cafree;
end;

procedure TfmFacultDiscipline.mnDisciplineTeachClick(Sender: TObject);
begin
  if (not Assigned(fmQueryListTeachDis)) then
    fmQueryListTeachDis := TfmQueryListTeachDis.Create(Application);
  fmQueryListTeachDis.Show;
end;

procedure TfmFacultDiscipline.mnReportDisTeachClick(Sender: TObject);
begin
  if (not Assigned(fmReportDisTeach)) then
    fmReportDisTeach := TfmReportDisTeach.Create(Application);
  fmReportDisTeach.Show;
end;

procedure TfmFacultDiscipline.mnReportStudDisClick(Sender: TObject);
begin
  if (not Assigned(fmReportStudDis)) then
    fmReportStudDis := TfmReportStudDis.Create(Application);
  fmReportStudDis.Show;
end;

procedure TfmFacultDiscipline.mnReportStudentsClick(Sender: TObject);
begin
   with dmFACULT do
   begin
    dbFacult.Connected := true;
    dstStudent.active :=true;
    //dstStudent.FullRefresh;
    frxReport1.ShowReport();
   end;
end;

procedure TfmFacultDiscipline.mnSTUDdisTEACHClick(Sender: TObject);
begin
  if (not Assigned(fmQueryListTeachDis)) then
    fmQueryListStudTeachDis := TfmQueryListStudTeachDis.Create(Application);
  fmQueryListStudTeachDis.Show;
end;



procedure TfmFacultDiscipline.AboutTheProgramClick(Sender: TObject);
var
   WND : HWND;
   lpText,lpText1,lpText2,lpText3,lpCaption:string;
   Tip:integer;
begin
  WND:=fmFacultDiscipline.Handle;
   lpCaption:='Информация о программе';
   lpText1:='Данное программное обеспечение предназначено  для учета заявок';
   lpText2:='на изучение факультативных дисциплин.';
   lpText3:=#13 + 'Автор приложения студент группы 18ВО1:Кравчук М.В.';
   lpText:= lpText1 + lpText2 + lpText3;
   Tip:=MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON1;
   MessageBox(WND,PChar(lpText),PChar(lpCaption),Tip)
end;

procedure TfmFacultDiscipline.DisciplineClick(Sender: TObject);
begin
  fmTableDiscipline := TfmTableDiscipline.Create(Application);
  fmTableDiscipline.Show;
end;

procedure TfmFacultDiscipline.StudentApplicClick(Sender: TObject);
begin
  fmTableStudApplic := TfmTableStudApplic.Create(Application);
  fmTableStudApplic.Show;
end;

procedure TfmFacultDiscipline.TablePDClick(Sender: TObject);
begin
  fmTableTeacherDiscipline := TfmTableTeacherDiscipline.Create(Application);
  fmTableTeacherDiscipline.Show;
end;

end.
