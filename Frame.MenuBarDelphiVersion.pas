unit Frame.MenuBarDelphiVersion;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.ListBox;

type
  TFrameMenuBarDelphiVersion = class(TFrame)
    imgCategory: TImage;
    cbVersion: TComboBox;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Core.DelphiInfo;

{$R *.fmx}

{ TFrameMenuBarDelphiVersion }

constructor TFrameMenuBarDelphiVersion.Create(AOwner: TComponent);
var
  LDelphiVer: TDelphiVersion;
begin
  inherited;
  for LDelphiVer := Low(TDelphiVersion) to High(TDelphiVersion) do begin
    cbVersion.Items.Add(TDelphiInfos[LDelphiVer].Product);
  end;

  if cbVersion.Count > 0 then
    cbVersion.ItemIndex := 0;
end;

end.
