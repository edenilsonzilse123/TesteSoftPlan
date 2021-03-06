unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmTarefa03 = class(TfrmBase)
    dbgrdTarefa03: TDBGrid;
    btnTotal: TButton;
    edtTotal: TEdit;
    btnDivisoes: TButton;
    edtTotalDivisoes: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregarDados;
    procedure FormActivate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);

    function  getTotalGrid:Real;
    function  getTotalDiv:Real;
    procedure btnDivisoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarefa03: TfrmTarefa03;
  vDataSetMostrar:TClientDataSet;
  vDataSource:TDataSource;

implementation

{$R *.dfm}

procedure TfrmTarefa03.btnDivisoesClick(Sender: TObject);
begin
  inherited;
  edtTotalDivisoes.Text :=  FormatFloat('#.##',getTotalDiv);
end;

procedure TfrmTarefa03.btnTotalClick(Sender: TObject);
begin
  inherited;
  edtTotal.Text :=  'R$ ' + FormatFloat('#.##',getTotalGrid);
end;

procedure TfrmTarefa03.CarregarDados;
var
  x:Integer;
begin
  try
    try
      vDataSetMostrar           :=  TClientDataSet.Create(nil);
      vDataSetMostrar.Close;
      vDataSetMostrar.FieldDefs.Clear;
      vDataSetMostrar.FieldDefs.Add('idPrjeto',ftInteger);
      vDataSetMostrar.FieldDefs.Add('nmProjeto',ftString,50);
      vDataSetMostrar.FieldDefs.Add('Valor',ftCurrency);
      vDataSetMostrar.CreateDataSet;
      vDataSetMostrar.Open;
      for x := 1 to 10 do
      begin
        vDataSetMostrar.Append;
        vDataSetMostrar.FieldByName('idPrjeto').AsInteger :=  x;
        vDataSetMostrar.FieldByName('nmProjeto').AsString := 'Projeto_' + IntToStr(x);
        vDataSetMostrar.FieldByName('Valor').AsCurrency   :=  x*10;
        vDataSetMostrar.Post;
      end;
      vDataSource               :=  TDataSource.Create(nil);
      vDataSource.DataSet       :=  vDataSetMostrar;
      dbgrdTarefa03.DataSource  :=  vDataSource;
    except
      FreeAndNil(vDataSetMostrar);
      FreeAndNil(vDataSource);
      ShowMessage('N?o foi poss?vel carregar os dados');
    end;
  finally

  end;
end;

procedure TfrmTarefa03.FormActivate(Sender: TObject);
begin
  inherited;
  CarregarDados;
end;

procedure TfrmTarefa03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmTarefa03 :=  nil;
end;

function TfrmTarefa03.getTotalDiv: Real;
var
  x:Integer;
  vValorAnterior:Real;
begin
  Result                :=  0;
  vValorAnterior        :=  0;
  if vDataSetMostrar <> nil then
  begin
    vDataSetMostrar.First;
    while not vDataSetMostrar.Eof do
    begin
      if vValorAnterior > 0 then
        Result          :=  Result  + (vDataSetMostrar.FieldByName('Valor').AsCurrency/vValorAnterior);
      vValorAnterior    :=  vDataSetMostrar.FieldByName('Valor').AsCurrency;
      vDataSetMostrar.Next;
    end;
  end;
end;

function TfrmTarefa03.getTotalGrid: Real;
var
  x:Integer;
begin
  Result := 0;
  if vDataSetMostrar <> nil then
  begin
    vDataSetMostrar.First;
    while not vDataSetMostrar.Eof do
    begin
      Result := Result  + vDataSetMostrar.FieldByName('Valor').AsCurrency;
      vDataSetMostrar.Next;
    end;
  end;
end;

end.
