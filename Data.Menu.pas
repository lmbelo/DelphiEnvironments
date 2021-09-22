unit Data.Menu;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataMenu = class(TDataModule)
    fdmtMenu: TFDMemTable;
    fdmtMenuITEM_TYPE: TWordField;
    fdmtMenuITEM_NAME: TStringField;
    fdmtMenuITEM_DESC: TStringField;
    fdmtMenuITEM_IMG: TBlobField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Add(const AItemType: byte; const AItemName, AItemDesc: string; const AItemImg: TStream);
  end;

var
  DataMenu: TDataMenu;

const
  ITEM_TYPE_SEPARATOR = 255;
  ITEM_TYPE_CONFIG = 0;
  ITEM_TYPE_DELPHI = 1;
  ITEM_TYPE_REGISTRY = 2;               //Add a group field and a delete group method

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataMenu.Add(const AItemType: byte; const AItemName,
  AItemDesc: string; const AItemImg: TStream);
begin
  fdmtMenu.Append();
  fdmtMenuITEM_TYPE.AsInteger := AItemType;
  fdmtMenuITEM_NAME.AsString := AItemName;
  fdmtMenuITEM_DESC.AsString := AItemDesc;
  if Assigned(AItemImg) then
    fdmtMenuITEM_IMG.LoadFromStream(AItemImg);
  fdmtMenu.Post();
end;

procedure TDataMenu.DataModuleCreate(Sender: TObject);
begin
  fdmtMenu.CreateDataSet();
end;

end.
