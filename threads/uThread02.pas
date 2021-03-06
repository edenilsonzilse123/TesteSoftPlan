unit uThread02;

interface

uses
  System.Classes, Vcl.Dialogs, Vcl.StdCtrls, System.SysUtils, Vcl.Forms, Vcl.ComCtrls,
  Vcl.Controls;

type
  TMinhaThread02 = class(TThread)
  private
    vTempoThr02:Integer;
    vProgressoThr02:TProgressBar;
    vParenteThr02:TWinControl;
    vLabelThr02:TLabel;
    { Private declarations }
  protected
    procedure Execute; override;
    procedure Executar;
  public
    property pTempoThr02:Integer read vTempoThr02 write vTempoThr02;
    property pParenteThr02:TWinControl read vParenteThr02 write vParenteThr02;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMinhaThread02.UpdateCaption;
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

{ TMinhaThread02 }

procedure TMinhaThread02.Executar;
var
  x:Integer;
begin
  vLabelThr02            :=  TLabel.Create(nil);
  vLabelThr02.Parent     :=  vParenteThr02;
  vLabelThr02.Caption    :=  'Progresso thread 02';
  vLabelThr02.Top        :=  151;
  vLabelThr02.Width      :=  120;
  vProgressoThr02        :=  TProgressBar.Create(nil);
  vProgressoThr02.Parent :=  vParenteThr02;
  vProgressoThr02.Top    :=  172;
  vProgressoThr02.Width  :=  537;
  vProgressoThr02.Left   :=  8;
  vLabelThr02.Left       :=  8;
  for x := 0 to 100 do
  begin
    vProgressoThr02.Position :=  x;
    Sleep(vTempoThr02);
  end;
  FreeAndNil(vLabelThr02);
  FreeAndNil(vProgressoThr02);
end;

procedure TMinhaThread02.Execute;
begin
  Executar;
end;

end.
