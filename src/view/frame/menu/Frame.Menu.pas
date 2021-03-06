unit Frame.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.MultiView, FMX.TabControl,
  Frame.MenuBarDelphiVersion, FMX.Controls.Presentation, FMX.Layouts,
  Data.Bind.Components, Data.Bind.DBScope,
  Controller.Menu,
  Data.Menu;

type
  TFrameMenu = class(TFrame)
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB1: TBindSourceDB;
    loMain: TLayout;
    tbTopMenu: TToolBar;
    btnDown: TSpeedButton;
    btnUp: TSpeedButton;
    frmMenuBarDelphiVersion: TFrameMenuBarDelphiVersion;
    loDisplay: TLayout;
    tcView: TTabControl;
    mvMenu: TMultiView;
    btnMenu: TSpeedButton;
    lvlItems: TListView;
    procedure frmMenuBarDelphiVersioncbVersionChange(Sender: TObject);
  private
    FController: TControllerMenu;
  public
    constructor Create(AOwner: TComponent); override;
  public
    property Controller: TControllerMenu read FController write FController;
  end;

implementation

{$R *.fmx}

uses
  Core.DelphiInfo;

{ TFrameMenu }

constructor TFrameMenu.Create(AOwner: TComponent);
begin
  inherited;
  FController := TControllerMenu.Create(Self);
  FController.AddMenuItemConfig();
  BindSourceDB1.DataSet := FController.Data.fdmtMenu;
end;

procedure TFrameMenu.frmMenuBarDelphiVersioncbVersionChange(Sender: TObject);
var
  LDelphiVer: TDelphiVersion;
begin
  FController.ClearGroups();
  for LDelphiVer := Low(TDelphiVersion) to High(TDelphiVersion) do begin
    if (frmMenuBarDelphiVersion.cbVersion.Selected.Text = TDelphiInfos[LDelphiVer].Product) then begin
      FController.LoadRegistry(LDelphiVer);
    end;
  end;
end;

end.
