unit ClassTypeInfoUnit;

interface

  { Find a fieldclass with name ClassName in the scope of Instance.
    If not found in the scope of Instance, then walk back to the ultimate owner
    (topmost owner) of Instance and then do a breath-first search in the
    object-ownership-hierarchy of this ultimate owner }

{ Get as much information from a TObject Instance into a string }
function InstanceInfo(const Instance: TObject): string;

{ Safe way (will catch and report exceptions) to obtain information }

function SafeClassName(const Instance: TObject): string;

function IdentifyInstance(const Instance: TObject; const PropertyName: string; var Identification: string): Boolean;

implementation

uses
  Controls,
  SysUtils,
  Classes,
  FormatUnit,
  PropertyTypeInfoUnit;

function InstanceInfo(const Instance: TObject): string;
var
  Found: Boolean;
  Identification: string;
begin
  Result := SafeClassName(Instance);
  try
    if Instance <> nil then
    begin
      Identification := '';
      Found := IdentifyInstance(Instance, 'Name', Identification); { TComponent }
      if not Found then
        Found := IdentifyInstance(Instance, 'FieldName', Identification); { TField }
      if not Found then
        Found := IdentifyInstance(Instance, 'Text', Identification); { TField }
      { don't try getting the properties below, since they need a HWindow
        and crash with external exception C000001D when called.
        This is mainly for tracing the Notification(TWinControl, opInsert). }
      if (Instance is TWinControl) and
        TWinControl(Instance).HandleAllocated
      then
      begin
        if not Found then
          Found := IdentifyInstance(Instance, 'Caption', Identification); { TField }
        if not Found then
          Found := IdentifyInstance(Instance, 'Hint', Identification); { TField }
      end;
      if not Found then
        if Instance is Exception then
          with Instance as Exception do
            Identification := 'Message='+Message
        else if Instance is TPersistent then
          with Instance as TPersistent do
            Identification := 'GetNamePath='+GetNamePath;
  (*
  TCollectionItem:DisplayName
  TStrings:Text
  *)
      Result := SafeFormat('%s[%p]:%s', [Result, Pointer(Instance), Identification]);
    end;
  except
    on E: Exception do
      Result := Result+' Exception: '+E.Message;
  end;
end; { InstanceInfo }

function SafeClassName(const Instance: TObject): string;
begin
  if Instance = nil then
    Result := '(NIL)'
  else try
    Result := Instance.ClassName;
  except
    on E: Exception do
      Result := 'Exception: '+E.Message;
  end;
end;

function IdentifyInstance(const Instance: TObject; const PropertyName: string; var Identification: string): Boolean;
begin
  Result := Instance <> nil;
  if Result then
  try
    Result := Instance.ClassInfo <> nil;
    if Result then
      Result := GetStrPropByName(Instance, PropertyName, Identification);
    if Result then
      Result := Identification <> '';
    if Result then
      Identification := SafeFormat('%s=%s',[PropertyName, Identification]);
  except
    on E: Exception do
      if Result then
        Identification := Identification + 'PropertyName: '+PropertyName+' Exception: '+E.Message
      else
        Identification := 'PropertyName: '+PropertyName+' Exception: '+E.Message;
  end;
end; { IdentifyInstance }

end.
