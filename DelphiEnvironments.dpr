program DelphiEnvironments;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  App.MainForm in 'App.MainForm.pas' {MainForm},
  App.Image in 'App.Image.pas' {AppImage: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAppImage, AppImage);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
