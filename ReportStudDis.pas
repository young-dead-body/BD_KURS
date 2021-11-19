unit ReportStudDis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmReportStudDis = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReportStudDis: TfmReportStudDis;

implementation

{$R *.dfm}

uses DM;

procedure TfmReportStudDis.Button1Click(Sender: TObject);
begin
  with dmFACULT do
   begin
    frxReport2.ShowReport();
   end;
end;

procedure TfmReportStudDis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmFacult.dstAPPLICSTUD.Active := false;
  dmFacult.dstDISCIPLINE.Active := false;
  fmReportStudDis:=nil;
end;

procedure TfmReportStudDis.FormShow(Sender: TObject);
begin
  dmFacult.dstAPPLICSTUD.Active := true;
  dmFacult.dstDISCIPLINE.Active := true;
  dmFacult.dstAPPLICSTUD.FullRefresh;
end;

end.
