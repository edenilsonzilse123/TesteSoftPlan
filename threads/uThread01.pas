unit uThread01;

interface

uses
  System.Classes, Vcl.Dialogs, Vcl.StdCtrls, System.SysUtils, Vcl.Forms, Vcl.ComCtrls,
  Vcl.Controls;

type
  TMinhaThread = class(TThread)
  private
    vTempo:Integer;
    vProgresso:TProgressBar;
    vParente:TWinControl;
    vLabel:TLabel;
    { Private declarations }
  protected
    procedure Execute; override;
    procedure Executar;
  public
    property pTempo:Integer read vTempo write vTempo;
    property pParente:TWinControl read vParente write vParente;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMinhaThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TMinhaThread }

procedure TMinhaThread.Executar;
var
  x:Integer;
begin
  vLabel            :=  TLabel.Create(nil);
  vLabel.Parent     :=  vParente;
  vLabel.Caption    :=  'Progresso thread 01';
  vLabel.Top        :=  103;
  vLabel.Width      :=  120;
  vProgresso        :=  TProgressBar.Create(nil);
  vProgresso.Parent :=  vParente;
  vProgresso.Top    :=  124;
  vProgresso.Width  :=  537;
  vProgresso.Left   :=  8;
  vLabel.Left       :=  8;
  for x := 0 to 100 do
  begin
    vProgresso.Position :=  x;
    Sleep(vTempo);
  end;
  FreeAndNil(vLabel);
  FreeAndNil(vProgresso);
end;

procedure TMinhaThread.Execute;
begin
  Executar;
end;

end.
