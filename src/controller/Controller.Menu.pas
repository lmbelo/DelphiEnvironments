unit Controller.Menu;

interface

uses
  System.SysUtils, System.Classes,
  Data.Menu,
  Core.DelphiInfo, Core.DelphiRegistry;

type
  TControllerMenu = class(TDataModule)
  private
    FData: TDataMenu;
  public
    constructor Create(AOwner: TComponent); override;

    procedure AddMenuItemConfig();
    procedure AddMenuItemDelphi(const ADelphiInfo: TDelphiInfo;
      const ARegistryInfo: TRegistryInfo; const ADelphiVersion: TDelphiVersion);

    procedure LoadRegistry(const ADelphiVersion: TDelphiVersion);
    procedure ClearGroups();
  public
    property Data: TDataMenu read FData write FData;
  end;

var
  ControllerMenu: TControllerMenu;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses
  System.Types, System.Win.Registry, System.Rtti,
  Winapi.ShellAPI, Winapi.Windows,
  Vcl.Graphics,
  FMX.ImgList,
  Core.Image;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TControllerMenu.AddMenuItemConfig();
var
  LStream: TStream;
begin
  LStream := TMemoryStream.Create;
  try
    AppImage.img50x50.Bitmap(TSizeF.Create(50, 50), 0).SaveToStream(LStream);
    LStream.Seek(0, 0);
    FData.Add(ITEM_TYPE_CONFIG, 'Settings', String.Empty, String.Empty, LStream);
  finally
    LStream.Free;
  end;
end;

procedure TControllerMenu.AddMenuItemDelphi(const ADelphiInfo: TDelphiInfo;
  const ARegistryInfo: TRegistryInfo; const ADelphiVersion: TDelphiVersion);

  procedure LoadIcon(const AFileName: string; const AStream: TStream);
  var
    FileInfo: TShFileInfo;
    LIcon: TIcon;
  begin
    if FileExists(AFileName) then begin
      FillChar(FileInfo, SizeOf(FileInfo), 0);
      SHGetFileInfo(PChar(AFileName), 0, FileInfo, SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
      if FileInfo.hIcon <> 0 then begin
        LIcon := TIcon.Create;
        try
          LIcon.Handle := FileInfo.hIcon;
          LIcon.SaveToStream(AStream);
        finally
          LIcon.Free;
        end;
        DestroyIcon(FileInfo.hIcon);
      end;
    end;
  end;

var
  LStream: TMemoryStream;
  LGroup: string;
begin
  LGroup := TRttiEnumerationType.GetName<TDelphiVersion>(ADelphiVersion);
  LStream := TMemoryStream.Create();
  try
    LoadIcon(ARegistryInfo.App, LStream);
    FData.Add(ITEM_TYPE_DELPHI, ADelphiInfo.Product, 'Registries', LGroup, LStream);
  finally
    LStream.Free();
  end;
end;

procedure TControllerMenu.ClearGroups;
var
  LDelphiVersion: TDelphiVersion;
begin
  for LDelphiVersion := Low(TDelphiVersion) to High(TDelphiVersion) do begin
    FData.Remove(TRttiEnumerationType.GetName<TDelphiVersion>(LDelphiVersion));
  end;
end;

constructor TControllerMenu.Create(AOwner: TComponent);
begin
  inherited;
  FData := TDataMenu.Create(Self);
end;

procedure TControllerMenu.LoadRegistry(const ADelphiVersion: TDelphiVersion);
var
  LList: TRegistryInfoList;
  LValue: TRegistryInfo;
  LStream: TStream;
  LGroup: string;
begin
  LList := TRegistryInfoList.Create;
  try
    if TRegistry.TryListDelphiEnvs(ADelphiVersion, LList) then begin
      if LList.Count > 0 then
        AddMenuItemDelphi(TDelphiInfos[ADelphiVersion], LList.Last, ADelphiVersion);

      for LValue in LList do begin
        LGroup := TRttiEnumerationType.GetName<TDelphiVersion>(ADelphiVersion);
        LStream := TMemoryStream.Create;
        try
          AppImage.img50x50.Bitmap(TSizeF.Create(50, 50), 1).SaveToStream(LStream);
          LStream.Seek(0, 0);
          FData.Add(ITEM_TYPE_REGISTRY, LValue.Name, LValue.Path, LGroup, LStream);
        finally
          LStream.Free;
        end;
      end;
    end;
  finally
    LList.Free;
  end;
end;

end.
