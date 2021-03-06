unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, uThread01, uThread02;

type
  TfrmTarefa02 = class(TfrmBase)
    grpTempoMillis: TGroupBox;
    seThread01: TSpinEdit;
    lblThread01: TLabel;
    lblThread02: TLabel;
    seThread02: TSpinEdit;
    btnRodarThreads: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RodarThreads;
    procedure btnRodarThreadsClick(Sender: TObject);
    procedure TrocarTempo(pSpEdit:TSpinEdit);
    procedure seThread02Exit(Sender: TObject);
    procedure seThread01Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarefa02: TfrmTarefa02;
  vThread01Exec:TMinhaThread;
  vThread02Exec:TMinhaThread02;

implementation

{$R *.dfm}

procedure TfrmTarefa02.btnRodarThreadsClick(Sender: TObject);
begin
  inherited;
  if ((StrToIntDef(seThread01.Text,0) <= 94) or
      (StrToIntDef(seThread02.Text,0) <= 94)) then
  begin
    ShowMessage('O tempo m?nimo para cada thread ? 95 milissegundos');
    Abort;
  end;
  RodarThreads;
end;

procedure TfrmTarefa02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmTarefa02 :=  nil;
end;

procedure TfrmTarefa02.RodarThreads;
begin
  vThread01Exec             :=  TMinhaThread.Create;
  vThread01Exec.pTempo      :=  StrToIntDef(seThread01.Text,0);
  vThread01Exec.pParente    :=  Self;
  vThread01Exec.Resume;
  vThread02Exec             :=  TMinhaThread02.Create;
  vThread02Exec.pTempoThr02      :=  StrToIntDef(seThread02.Text,0);
  vThread02Exec.pParenteThr02    :=  Self;
  vThread02Exec.Resume;
end;

procedure TfrmTarefa02.seThread01Exit(Sender: TObject);
begin
  inherited;
  TrocarTempo(seThread01);
end;

procedure TfrmTarefa02.seThread02Exit(Sender: TObject);
begin
  inherited;
  TrocarTempo(seThread02);
end;

procedure TfrmTarefa02.TrocarTempo(pSpEdit: TSpinEdit);
begin
  if (StrToIntDef(pSpEdit.Text,0) <= 94) then
  begin
    ShowMessage('O tempo m?nimo para cada thread ? 95 milissegundos');
    pSpEdit.Text  :=  '95';
    Abort;
  end;
end;

end.
