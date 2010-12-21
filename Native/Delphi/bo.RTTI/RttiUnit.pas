unit RttiUnit;

interface

type
  TRtti = record
    //1 similar to http://hallvards.blogspot.com/2006/09/hack11-get-guid-of-interface-reference.html but for the interface type, not for a reference
    class function GetInterfaceIID<T: IInterface>(var IID: TGUID): Boolean; static;
  end;

implementation

uses
  TypInfo,
  Rtti;

class function TRtti.GetInterfaceIID<T>(var IID: TGUID): Boolean;
var
  TypeInfoOfT: PTypeInfo;
  RttiContext: TRttiContext;
  RttiInterfaceType: TRttiInterfaceType;
  RttiType: TRttiType;
begin
  TypeInfoOfT := TypeInfo(T);
  RttiContext := TRttiContext.Create();

  RttiType := RttiContext.GetType(TypeInfoOfT);
  if RttiType is TRttiInterfaceType then
  begin
    RttiInterfaceType := RttiType as TRttiInterfaceType;
    IID := RttiInterfaceType.GUID;
    Result := True;
  end
  else
    Result := False;
end;

end.
