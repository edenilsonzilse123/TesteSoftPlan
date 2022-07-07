unit uThread01;

interface

uses
  System.Classes, Vcl.Dialogs, Vcl.StdCtrls, System.SysUtils, Vcl.Forms, Vcl.ComCtrls;

type
  TMinhaThread = class(TThread)
  vTempo:Integer;
  vProgresso:TProgressBar;
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure Executar;
  public
    property pTempo:Integer read vTempo write vTempo;
    property pProgresso:TProgressBar read vProgresso write vProgresso;
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
  for x := 0 to 100 do
  begin
    vProgresso.Position :=  x;
    Sleep(vTempo);
  end;
end;

procedure TMinhaThread.Execute;
begin
  Executar;
end;

end.
