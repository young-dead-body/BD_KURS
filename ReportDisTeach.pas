unit ReportDisTeach;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfmReportDisTeach = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReportDisTeach: TfmReportDisTeach;

implementation

{$R *.dfm}

uses DM;

procedure TfmReportDisTeach.Button1Click(Sender: TObject);
begin
  with dmFACULT do
   begin
    frxReport3.ShowReport();
   end;
end;

procedure TfmReportDisTeach.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmFacult.dstPDTEACH.Active := false;
  dmFacult.dstDISCIPLINE.Active := false;
  fmReportDisTeach:=nil;
end;

procedure TfmReportDisTeach.FormShow(Sender: TObject);
begin
  dmFacult.dstPDTEACH.Active := true;
  dmFacult.dstDISCIPLINE.Active := true;
  dmFacult.dstPDTEACH.FullRefresh;
end;

end.
