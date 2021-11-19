unit AddApplic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet, Vcl.Mask, FIBDataSet,
  pFIBDataSet;

type
  TfmAddApplic = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    DBLCNDIS: TDBLookupComboBox;
    DBLCNTEACH: TDBLookupComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure buOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddApplic: TfmAddApplic;

implementation

{$R *.dfm}

uses DM, TableStudApplic;

procedure TfmAddApplic.buOkClick(Sender: TObject);
var
  NTEACH, NDIS, NPD: integer;
begin
    NDIS := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
    NTEACH := DBLCNTEACH.Listsource.Dataset.FieldByName('NTEACH').AsInteger;
    NPD := DBLCNTEACH.Listsource.Dataset.FieldByName('NPD').AsInteger;
  with dmFACULT do
  begin
    //Включаем набор данных в режим добавления записи
    dstApplic.Insert;
    //Заносим введенные значения в набор данных
    dstApplic.FBN('NSTUD').AsInteger :=
                    fmTableStudApplic.DBGrid2.DataSource.DataSet.FieldByName('NSTUD').AsInteger;
    dstApplic.FBN('NPD').AsInteger := NPD;
    dstApplic.FBN('NDIS').AsInteger := NDIS;
    dstApplic.FBN('NTEACH').AsInteger := NTEACH;
  end;
end;

procedure TfmAddApplic.FormShow(Sender: TObject);
begin
with dmFACULT do
  begin
    //Включаем набор данных в режим изменения записи
    Edit1.Text := fmTableStudApplic.DBGrid2.DataSource.DataSet.FieldByName('FAM').AsString;
    dstPDTEACH.Active := true;
    dstApplic.Active := true;
  end;

end;

end.
