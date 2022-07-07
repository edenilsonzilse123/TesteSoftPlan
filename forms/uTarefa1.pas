unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfrmTarefa01 = class(TfrmBase)
    mmoTabelas: TMemo;
    lblTabelas: TLabel;
    mmoColunas: TMemo;
    lblColunas: TLabel;
    mmoCondicoes: TMemo;
    lblCondicoes: TLabel;
    mmoSqlGerado: TMemo;
    lblSqlGerado: TLabel;
    btnGeraSql: TButton;
    spqry1: TspQuery;
    procedure btnGeraSqlClick(Sender: TObject);
    procedure LerTabelas;
    procedure LerColunas;
    procedure LerCondicoes;
    procedure Atribuir;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarefa01: TfrmTarefa01;

implementation

{$R *.dfm}

procedure TfrmTarefa01.Atribuir;
begin
  LerTabelas;
  LerColunas;
  LerCondicoes;
end;

procedure TfrmTarefa01.btnGeraSqlClick(Sender: TObject);
begin
  inherited;
  Atribuir;
  spqry1.GeraSql;
  mmoSqlGerado.Lines.Add(spqry1.pspSqlSaida);
end;

procedure TfrmTarefa01.LerColunas;
var
  x:Integer;
begin
  spqry1.pspColunas :=  TStringList.Create;
  for x := 0 to mmoColunas.Lines.Count - 1 do
    spqry1.pspColunas.Add(mmoColunas.Lines[x]);
end;

procedure TfrmTarefa01.LerCondicoes;
var
  x:Integer;
begin
  spqry1.pspCondicoes :=  TStringList.Create;
  for x := 0 to mmoCondicoes.Lines.Count - 1 do
    spqry1.pspCondicoes.Add(mmoCondicoes.Lines[x]);
end;

procedure TfrmTarefa01.LerTabelas;
var
  x:Integer;
begin
  spqry1.pspTabelas :=  TStringList.Create;
  for x := 0 to mmoTabelas.Lines.Count - 1 do
    spqry1.pspTabelas.Add(mmoTabelas.Lines[x]);
end;

end.
