program ClientMQTT;

uses
  Forms,
  uClientMQTT in 'uClientMQTT.pas' {frmClientPROTOCOL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClientPROTOCOL, frmClientPROTOCOL);
  Application.Run;
end.
