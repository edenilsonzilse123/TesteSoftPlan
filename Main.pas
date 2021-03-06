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
    actTarefas02: TAction;
    arefa021: TMenuItem;
    actTarefas01: TAction;
    arefa011: TMenuItem;
    procedure actTarefas03Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actTarefas02Execute(Sender: TObject);
    procedure actTarefas01Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uTarefa3, uTarefa2, uTarefa1;

procedure TMainForm.actTarefas01Execute(Sender: TObject);
begin
 if frmTarefa01 = nil then
    Application.CreateForm(TfrmTarefa01,frmTarefa01);
  frmTarefa01.SetarTitulo(actTarefas01.Caption);
  frmTarefa01.show;
end;

procedure TMainForm.actTarefas02Execute(Sender: TObject);
begin
  if frmTarefa02 = nil then
    Application.CreateForm(TfrmTarefa02,frmTarefa02);
  frmTarefa02.SetarTitulo(actTarefas02.Caption);
  frmTarefa02.show;
end;

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
