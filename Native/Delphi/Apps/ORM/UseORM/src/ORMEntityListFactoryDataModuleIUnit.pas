unit ORMEntityListFactoryDataModuleIUnit;

interface

uses
  MidasLib, // jpl: now we do not need MIDAS.DLL any more
  SysUtils, Classes, ORMEntityUnit, ClientUnit;

type
  TORMEntityListFactoryDataModule = class(TDataModule)
  strict private
    FClientList: TClientList;
    FLookupEntityListManager: TLookupEntityListManager;
  strict protected
    function GetClientList: TClientList; virtual;
    function GetLookupEntityListManager: TLookupEntityListManager; virtual;
  public
    property ClientList: TClientList read GetClientList;
    property LookupEntityListManager: TLookupEntityListManager read GetLookupEntityListManager;
  end;

var
  ORMEntityListFactoryDataModule: TORMEntityListFactoryDataModule;

implementation

{$R *.dfm}

function TORMEntityListFactoryDataModule.GetClientList: TClientList;
begin
  if not Assigned(FClientList) then
  begin
    FClientList := TClientList.Create(LookupEntityListManager);
    FClientList.Fill;
  end;
  Result := FClientList;
end;

function TORMEntityListFactoryDataModule.GetLookupEntityListManager: TLookupEntityListManager;
begin
  if not Assigned(FLookupEntityListManager) then
    FLookupEntityListManager := TLookupEntityListManager.Create(Self);
  Result := FLookupEntityListManager;
end;

end.
