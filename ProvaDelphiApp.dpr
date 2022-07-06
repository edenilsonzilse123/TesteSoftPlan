program ProvaDelphiApp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  uBase in 'forms\uBase.pas' {frmBase},
  uTarefa3 in 'forms\uTarefa3.pas' {frmTarefa03};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
