program DelphiEnvironments;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  App.MainForm in 'App.MainForm.pas' {MainForm},
  Core.DelphiInfo in 'Core.DelphiInfo.pas',
  Core.DelphiRegistry in 'Core.DelphiRegistry.pas',
  Data.Menu in 'Data.Menu.pas' {DataMenu: TDataModule},
  App.Image in 'App.Image.pas' {AppImage: TDataModule},
  Frame.Presentation in 'Frame.Presentation.pas' {FramePresentation: TFrame},
  Frame.Configuration in 'Frame.Configuration.pas' {FrameConfiguration: TFrame},
  Frame.Category in 'Frame.Category.pas' {FrameCategory: TFrame},
  Frame.CategoryDelphi in 'Frame.CategoryDelphi.pas' {FrameCategoryDelphi: TFrame},
  Frame.MenuBarDelphiVersion in 'Frame.MenuBarDelphiVersion.pas' {FrameMenuBarDelphiVersion: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAppImage, AppImage);
  Application.CreateForm(TDataMenu, DataMenu);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
