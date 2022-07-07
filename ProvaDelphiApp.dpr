program ProvaDelphiApp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  uBase in 'forms\uBase.pas' {frmBase},
  uTarefa3 in 'forms\uTarefa3.pas' {frmTarefa03},
  uTarefa2 in 'forms\uTarefa2.pas' {frmTarefa02},
  uThread01 in 'threads\uThread01.pas',
  uThread02 in 'threads\uThread02.pas',
  uTarefa1 in 'forms\uTarefa1.pas' {frmTarefa01};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
