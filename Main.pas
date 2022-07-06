unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Tarefas: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    actTarefas03: TAction;
    arefa031: TMenuItem;
    procedure actTarefas03Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uTarefa3;

procedure TMainForm.actTarefas03Execute(Sender: TObject);
begin
  if frmTarefa03 = nil then
    Application.CreateForm(TfrmTarefa03,frmTarefa03);
  frmTarefa03.SetarTitulo(actTarefas03.Caption);
  frmTarefa03.show;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Caption :=  Application.Title;
end;

end.
