program DelphiEnvironments;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  App.MainForm in 'App.MainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
