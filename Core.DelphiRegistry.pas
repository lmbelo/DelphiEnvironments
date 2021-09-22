unit Core.DelphiRegistry;

interface

uses
  System.Win.Registry, Winapi.Windows, System.Classes,
  System.Generics.Collections, Core.DelphiInfo;

type
  TRegistryInfo = record
  public
    Name: string;
    Path: string;
    App: string;
  public
    constructor Create(const AName, APath, AIconPath: string);
  end;

  TRegistryInfoList = TList<TRegistryInfo>;

  TRegistryHelper = class helper for TRegistry
  public
    function ListDelphiEnvs(const ADelphiVersion: TDelphiVersion;
      const ARootKey: HKEY; const AConsiderDefault: boolean;
      const AList: TRegistryInfoList): boolean;

    class function TryListDelphiEnvs(const ADelphiVersion: TDelphiVersion;
      const AList: TRegistryInfoList): boolean;
  end;

implementation

uses
  SysUtils, StrUtils;

{ TRegistryHelper }

function TRegistryHelper.ListDelphiEnvs(const ADelphiVersion: TDelphiVersion;
  const ARootKey: HKEY; const AConsiderDefault: boolean;
  const AList: TRegistryInfoList): boolean;
const
  DEFAULTS: TArray<string> = ['elaunch'];
  APP = 'App';
var
  LInfo: TDelphiInfo;
  LSubKeys: TStringList;
  LName: string;
  LApp: string;
  LFullRegNum: string;
begin
  LInfo := TDelphiInfos[ADelphiVersion];
  RootKey := ARootKey;
  Result := KeyExists(LInfo.RegPath);
  if Result then begin
    OpenKeyReadOnly(LInfo.RegPath);
    LSubKeys := TStringList.Create();
    try
      GetKeyNames(LSubKeys);
      for LName in LSubKeys do
      begin
        LFullRegNum := LName + '\' + LInfo.RegNum;
        if KeyExists(LFullRegNum) then
          if not AConsiderDefault and (IndexStr(LName, DEFAULTS) > -1) then
            Continue
          else begin
            OpenKeyReadOnly(LFullRegNum);
            try
              LApp := ReadString(APP);
            finally
              CloseKey();
            end;
            AList.Add(TRegistryInfo.Create(LName, CurrentPath + LName + '\' + LInfo.RegNum, LApp));
          end;
      end;
    finally
      LSubKeys.Free();
    end;
  end;
end;

class function TRegistryHelper.TryListDelphiEnvs(
  const ADelphiVersion: TDelphiVersion; const AList: TRegistryInfoList): boolean;
var
  LReg: TRegistry;
begin
  LReg := TRegistry.Create();
  try
    Result := true;
    if not LReg.ListDelphiEnvs(ADelphiVersion, HKEY_CURRENT_USER, false, AList) then
      Result := LReg.ListDelphiEnvs(ADelphiVersion, HKEY_LOCAL_MACHINE, false, AList);
  finally
    LReg.Free();
  end;
end;

{ TRegistryInfo }

constructor TRegistryInfo.Create(const AName, APath, AIconPath: string);
begin
  Name := AName;
  Path := APath;
  App := AIconPath;
end;

end.
