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
    lblProgressThread01: TLabel;
    pbThread01: TProgressBar;
    lblProgressThread02: TLabel;
    pbThread02: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RodarThreads;
    procedure btnRodarThreadsClick(Sender: TObject);
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
  vThread01Exec             :=  TMinhaThread.Create;
  vThread01Exec.vTempo      :=  StrToIntDef(seThread01.Text,0);
  vThread01Exec.vProgresso  :=  pbThread01;
  vThread01Exec.Resume;
  vThread02Exec             :=  TMinhaThread02.Create;
  vThread02Exec.vTempo      :=  StrToIntDef(seThread02.Text,0);
  vThread02Exec.vProgresso  :=  pbThread02;
  vThread02Exec.Resume;
end;

procedure TfrmTarefa02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmTarefa02 :=  nil;
end;

procedure TfrmTarefa02.RodarThreads;
var
  x:Integer;
begin
  x :=  0;
  repeat
    pbThread01.Position :=  x;
    pbThread02.Position :=  x;
    Inc(x);
    Sleep(500);
  until x > 100;
  ShowMessage('Terminou');
  pbThread01.Position :=  0;
  pbThread02.Position :=  0;
end;

end.
