unit App.MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.MultiView, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.DB, FMX.ListView,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListBox, FMX.ScrollBox,
  FMX.Memo, System.ImageList, FMX.ImgList, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Core.DelphiInfo, Core.DelphiRegistry, Frame.Configuration,
  FMX.TabControl, Frame.MenuBarDelphiVersion;

type
  TMainForm = class(TForm)
    mvMenu: TMultiView;
    loMain: TLayout;
    tbTopMenu: TToolBar;
    btnDown: TSpeedButton;
    btnUp: TSpeedButton;
    btnMenu: TSpeedButton;
    lvlItems: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    loDisplay: TLayout;
    TabControl1: TTabControl;
    frmMenuBarDelphiVersion: TFrameMenuBarDelphiVersion;
    procedure FormCreate(Sender: TObject);
    procedure frmMenuBarDelphiVersioncbVersionChange(Sender: TObject);
  private
    procedure AddMenuItemConfig();
    procedure AddMenuItemDelphi(const ADelphiInfo: TDelphiInfo; const ARegistryInfo: TRegistryInfo);
    procedure LoadRegistry(const ADelphiVersion: TDelphiVersion);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  System.Win.Registry, ShellAPI, Winapi.Windows, CommCtrl,
  Vcl.Graphics,
  App.Image, Data.Menu;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  AddMenuItemConfig();
end;

procedure TMainForm.frmMenuBarDelphiVersioncbVersionChange(Sender: TObject);
var
  LDelphiVer: TDelphiVersion;
begin
  for LDelphiVer := Low(TDelphiVersion) to High(TDelphiVersion) do begin
    if (frmMenuBarDelphiVersion.cbVersion.Selected.Text = TDelphiInfos[LDelphiVer].Product) then begin
      LoadRegistry(LDelphiVer);
    end;
  end;
end;

procedure TMainForm.AddMenuItemConfig();
var
  LStream: TStream;
begin
  LStream := TMemoryStream.Create;
  try
    AppImage.img50x50.Bitmap(TSizeF.Create(50, 50), 0).SaveToStream(LStream);
    LStream.Seek(0, 0);
    DataMenu.Add(ITEM_TYPE_CONFIG, 'Settings', String.Empty, LStream);
  finally
    LStream.Free;
  end;
end;

procedure TMainForm.AddMenuItemDelphi(const ADelphiInfo: TDelphiInfo;
  const ARegistryInfo: TRegistryInfo);

  procedure LoadIcon(const AFileName: string; const AStream: TStream);
  var
    FileInfo: TShFileInfo;
    LIcon: TIcon;
    LImageList: TImageList;
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
begin
  LStream := TMemoryStream.Create();
  try
    LoadIcon(ARegistryInfo.App, LStream);
    DataMenu.Add(ITEM_TYPE_DELPHI, ADelphiInfo.Product, 'Registries', LStream);
  finally
    LStream.Free();
  end;
end;

procedure TMainForm.LoadRegistry(const ADelphiVersion: TDelphiVersion);
var
  LList: TRegistryInfoList;
  LValue: TRegistryInfo;
  LStream: TStream;
begin
  LList := TRegistryInfoList.Create;
  try
    if TRegistry.TryListDelphiEnvs(ADelphiVersion, LList) then begin
      if LList.Count > 0 then
        AddMenuItemDelphi(TDelphiInfos[ADelphiVersion], LList.Last);

      for LValue in LList do begin
        LStream := TMemoryStream.Create;
        try
          AppImage.img50x50.Bitmap(TSizeF.Create(50, 50), 1).SaveToStream(LStream);
          LStream.Seek(0, 0);
          DataMenu.Add(ITEM_TYPE_REGISTRY, LValue.Name, LValue.Path, LStream);
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
