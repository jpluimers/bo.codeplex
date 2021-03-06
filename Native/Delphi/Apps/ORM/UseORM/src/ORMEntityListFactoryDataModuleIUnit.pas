unit ORMEntityListFactoryDataModuleIUnit;

interface

uses
  MidasLib, // jpl: now we do not need MIDAS.DLL any more
  SysUtils, Classes, ORMEntityUnit, ClientUnit, GenderUnit;

type
  TORMEntityListFactoryDataModule = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  strict private
    FClientList: TClientList;
    FGenderList: TGenderList;
    FFilteredClientList: TClientList;
    FLookupEntityListManager: TLookupEntityListManager;
  strict protected
    function GetClientList: TClientList; virtual;
    function GetGenderList: TGenderList; virtual;
    function GetFilteredClientList: TClientList; virtual;
    function GetLookupEntityListManager: TLookupEntityListManager; virtual;
  public
    property ClientList: TClientList read GetClientList;
    property GenderList: TGenderList read GetGenderList;
    property FilteredClientList: TClientList read GetFilteredClientList;
    property LookupEntityListManager: TLookupEntityListManager read GetLookupEntityListManager;
  end;

var
  ORMEntityListFactoryDataModule: TORMEntityListFactoryDataModule;

implementation

uses
  ApplicationHelperUnit, Forms;

{$R *.dfm}

procedure TORMEntityListFactoryDataModule.DataModuleCreate(Sender: TObject);
begin
  Application.AssertHaveIniFile();
end;

function TORMEntityListFactoryDataModule.GetClientList: TClientList;
begin
  if not Assigned(FClientList) then
  begin
    FClientList := TClientList.Create(LookupEntityListManager);
    FClientList.Fill;
  end;
  Result := FClientList;
end;

function TORMEntityListFactoryDataModule.GetGenderList: TGenderList;
begin
  if not Assigned(FGenderList) then
  begin
    FGenderList := TGenderList.Create(LookupEntityListManager);
    FGenderList.Fill;
  end;
  Result := FGenderList;
end;

function TORMEntityListFactoryDataModule.GetFilteredClientList: TClientList;
begin
  if not Assigned(FFilteredClientList) then
  begin
    FFilteredClientList := TClientList.Create(LookupEntityListManager);
    FFilteredClientList.AddFilterCriterion(TClientList.FirstNameFieldName, 'Foo');
    FFilteredClientList.Fill;
  end;
  Result := FFilteredClientList;
end;

function TORMEntityListFactoryDataModule.GetLookupEntityListManager: TLookupEntityListManager;
begin
  if not Assigned(FLookupEntityListManager) then
    FLookupEntityListManager := TLookupEntityListManager.Create(Self);
  Result := FLookupEntityListManager;
end;

end.
