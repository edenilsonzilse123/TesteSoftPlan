unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs;

type
  TspQuery = class(TFDQuery)
  private
    spTabelas:TStringList;
    spColunas:TStringList;
    spCondicoes:TStringList;
    spSqlSaida:String;
  protected
    { Protected declarations }
  public
    constructor Create();
    procedure GeraSql;
  published
    property pspTabelas:TStringList read spTabelas write spTabelas;
    property pspColunas:TStringList read spColunas write spColunas;
    property pspCondicoes:TStringList read spCondicoes write spCondicoes;
    property pspSqlSaida:String read spSqlSaida;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SoftPlanTesteEdenilson', [TspQuery]);
end;

{ TspQuery }

constructor TspQuery.Create;
begin
  spTabelas:=TStringList.Create;
  spColunas:=TStringList.Create;
  spCondicoes:=TStringList.Create;
end;

procedure TspQuery.GeraSql;
var
  x,y:Integer;
  sqlGerado:String;
begin
  sqlGerado :=  EmptyStr;
  if (spTabelas.Count > 1) then
  begin
    ShowMessage('Somente ? permitido a sele??o de uma tabela apenas');
    Abort;
  end;
  if (spColunas.Count < 1) then
  begin
    ShowMessage('Deve ser marcada uma coluna para sele??o');
    Abort;
  end;
  sqlGerado := sqlGerado  + ' SELECT ';
  for x := 0 to spColunas.Count - 1 do
    sqlGerado :=  sqlGerado + ' ' + spColunas[x] + ',';
  sqlGerado :=  Copy(sqlGerado,1,Length(sqlGerado)-1);
  sqlGerado := sqlGerado  + ' FROM '  + spTabelas[0]  + ' WHERE 1=1 ';
  for y := 0 to spCondicoes.Count - 1 do
    sqlGerado :=  sqlGerado + ' AND '  + spCondicoes[y];
  spSqlSaida  :=  sqlGerado;
end;

end.
