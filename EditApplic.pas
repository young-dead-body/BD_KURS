unit EditApplic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmEditApplic = class(TForm)
    Panel1: TPanel;
    buOk: TButton;
    buCancel: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLCNDIS: TDBLookupComboBox;
    DBLCNTEACH: TDBLookupComboBox;
    Edit1: TEdit;
    procedure DBLCNDISClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditApplic: TfmEditApplic;

implementation

{$R *.dfm}

uses DM, TableStudApplic;

procedure TfmEditApplic.buOkClick(Sender: TObject);
var
  NTEACH, NDIS, NPD: integer;
begin
    NDIS := DBLCNDIS.Listsource.Dataset.FieldByName('NDIS').AsInteger;
    NTEACH := DBLCNTEACH.Listsource.Dataset.FieldByName('NTEACH').AsInteger;
    NPD := DBLCNTEACH.Listsource.Dataset.FieldByName('NPD').AsInteger;
  with dmFACULT do
  begin
    //Включаем набор данных в режим добавления записи
    dstApplic.Edit;
    //Заносим введенные значения в набор данных
    dstApplic.FBN('NSTUD').AsInteger :=
                    fmTableStudApplic.DBGrid2.DataSource.DataSet.FieldByName('NSTUD').AsInteger;
    dstApplic.FBN('NPD').AsInteger := NPD;
    dstApplic.FBN('NDIS').AsInteger := NDIS;
    dstApplic.FBN('NTEACH').AsInteger := NTEACH;
  end;
end;

procedure TfmEditApplic.DBLCNDISClick(Sender: TObject);
begin
  with dmFACULT do
  begin
    //Обновляем набор данных
    dstPDTEACH.FullRefresh;
  end;
end;

procedure TfmEditApplic.FormShow(Sender: TObject);
begin
  with dmFACULT do
  begin
    //Включаем набор данных в режим изменения записи
    Edit1.Text := fmTableStudApplic.DBGrid2.DataSource.DataSet.FieldByName('FAM').AsString;
  end;
end;

end.
