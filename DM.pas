unit DM;

interface

uses
  System.SysUtils, System.Classes, FIBDataSet, Data.DB, pFIBDataSet,
  FIBDatabase, pFIBDatabase, frxClass, frxDBSet;

type
  TdmFACULT = class(TDataModule)
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dbFACULT: TpFIBDatabase;
    dstPD: TpFIBDataSet;
    dstPDNPD: TFIBIntegerField;
    dstPDNDIS: TFIBIntegerField;
    dstPDNTEACH: TFIBIntegerField;
    dstPDNameDis: TStringField;
    dsPD: TDataSource;
    dstTeacher: TpFIBDataSet;
    dstTeacherNTEACH: TFIBIntegerField;
    dstTeacherSURNAME: TFIBStringField;
    dstTeacherNAME: TFIBStringField;
    dstTeacherOTHESTVO: TFIBStringField;
    dstTeacherACADDEGREE: TFIBStringField;
    dstTeacherTITLE: TFIBStringField;
    dsTeacher: TDataSource;
    dstDiscipline: TpFIBDataSet;
    dstDisciplineNDIS: TFIBIntegerField;
    dstDisciplineNAME: TFIBStringField;
    dstDisciplineTTIME: TFIBIntegerField;
    dsDiscipline: TDataSource;
    dsSelectQueryTeacher: TDataSource;
    dstSelectQueryTeacher: TpFIBDataSet;
    dstStudent: TpFIBDataSet;
    dsStudent: TDataSource;
    dstStudentNSTUD: TFIBIntegerField;
    dstStudentFAM: TFIBStringField;
    dstStudentNUMGROUPS: TFIBStringField;
    dstApplic: TpFIBDataSet;
    dsApplic: TDataSource;
    dstApplicNAPPLIC: TFIBIntegerField;
    dstApplicNSTUD: TFIBIntegerField;
    dstApplicNPD: TFIBIntegerField;
    dstApplicNDIS: TFIBIntegerField;
    dstApplicNTEACH: TFIBIntegerField;
    dstApplicNameDis: TStringField;
    dstApplicSurnameTeacher: TStringField;
    dstPDSurnameTeach: TStringField;
    dstPDTEACH: TpFIBDataSet;
    dstPDTEACHNPD: TFIBIntegerField;
    dstPDTEACHNDIS: TFIBIntegerField;
    dstPDTEACHNTEACH: TFIBIntegerField;
    dstPDTEACHSurnameTeach: TStringField;
    dsPDTEACH: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dstAPPLICSTUD: TpFIBDataSet;
    dsAPPLICSTUD: TDataSource;
    dstAPPLICSTUDNAPPLIC: TFIBIntegerField;
    dstAPPLICSTUDNSTUD: TFIBIntegerField;
    dstAPPLICSTUDNPD: TFIBIntegerField;
    dstAPPLICSTUDNDIS: TFIBIntegerField;
    dstAPPLICSTUDNTEACH: TFIBIntegerField;
    dstAPPLICSTUDFAMSTUD: TStringField;
    frxReport2: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    dstAPPLICSTUDDisName: TStringField;
    frxReport3: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    dstPDTEACHNameDis: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFACULT: TdmFACULT;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
