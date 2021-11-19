program Project1;



uses
  Vcl.Forms,
  FacultDiscipline in 'FacultDiscipline.pas' {fmFacultDiscipline},
  TableTeacherDiscipline in 'TableTeacherDiscipline.pas' {fmTableTeacherDiscipline},
  DM in 'DM.pas' {dmFACULT: TDataModule},
  AddTeacher in 'AddTeacher.pas' {fmAddTeacher},
  EditTeacher in 'EditTeacher.pas' {fmEditTeacher},
  AddPD in 'AddPD.pas' {fmAddPD},
  EditPD in 'EditPD.pas' {fmEditPD},
  TableDiscipline in 'TableDiscipline.pas' {fmTableDiscipline},
  AddDiscipline in 'AddDiscipline.pas' {fmAddDiscipline},
  EditDiscipline in 'EditDiscipline.pas' {fmEditDiscipline},
  QueryListTeachers in 'QueryListTeachers.pas' {fmQueryListTeachers},
  TableStudApplic in 'TableStudApplic.pas' {fmTableStudApplic},
  AddApplic in 'AddApplic.pas' {fmAddApplic},
  EditApplic in 'EditApplic.pas' {fmEditApplic},
  AddStud in 'AddStud.pas' {fmAddStud},
  EditStud in 'EditStud.pas' {fmEditStud},
  QueryListTeachDis in 'QueryListTeachDis.pas' {fmQueryListTeachDis},
  QueryListStudTeachDis in 'QueryListStudTeachDis.pas' {fmQueryListStudTeachDis},
  ReportStudDis in 'ReportStudDis.pas' {fmReportStudDis},
  ReportDisTeach in 'ReportDisTeach.pas' {fmReportDisTeach};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmFacultDiscipline, fmFacultDiscipline);
  Application.CreateForm(TdmFACULT, dmFACULT);
  Application.CreateForm(TfmReportDisTeach, fmReportDisTeach);
  Application.Run;
end.
