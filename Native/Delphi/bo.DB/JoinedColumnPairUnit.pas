unit JoinedColumnPairUnit;

interface

uses
  NullablesUnit,
  Generics.Collections;

type
  TJoinedColumnPair = record
  strict private
    FChildColumn: string;
    FChildTable: string;
    FIsJoin: Boolean;
    FNewID: TNullableInteger;
    FOldID: TNullableInteger;
    FParentColumn: string;
    FParentTable: string;
  public
    class function Create(const ChildTable: string; const ChildColumn: string): TJoinedColumnPair; overload; static;
    class function Create(const ChildTable: string; const ChildColumn: string; const ParentTable: string; const ParentColumn: string): TJoinedColumnPair;
        overload; static;
    procedure ModifyID(const OldID, NewID: TNullableInteger);
    function ToString: string;
    property ChildColumn: string read FChildColumn;
    property ChildTable: string read FChildTable;
    property IsJoin: Boolean read FIsJoin;
    property NewID: TNullableInteger read FNewID;
    property OldID: TNullableInteger read FOldID;
    property ParentColumn: string read FParentColumn;
    property ParentTable: string read FParentTable;
  end;

type
  TJoinedColumnPairList = TList<TJoinedColumnPair>;

implementation

uses
  SysUtils;

class function TJoinedColumnPair.Create(const ChildTable: string; const ChildColumn: string): TJoinedColumnPair;
begin
  Result.FChildTable := ChildTable;
  Result.FChildColumn := ChildColumn;
  Result.FIsJoin := False;
  Result.FNewID.Clear();
  Result.FOldID.Clear();
end;

class function TJoinedColumnPair.Create(const ChildTable: string; const ChildColumn: string; const ParentTable: string; const ParentColumn: string):
    TJoinedColumnPair;
begin
  Result.FChildTable := ChildTable;
  Result.FChildColumn := ChildColumn;
  Result.FParentTable := ParentTable;
  Result.FParentColumn := ParentColumn;
  Result.FIsJoin := True;
  Result.FNewID.Clear();
  Result.FOldID.Clear();
end;

procedure TJoinedColumnPair.ModifyID(const OldID, NewID: TNullableInteger);
begin
  Self.FOldID := OldID;
  Self.FNewID := NewID;
end;

function TJoinedColumnPair.ToString: string;
begin
  Result := Format('IsJoin=%s, Parent=%s.%s, Child=%s.%s', [BoolToStr(IsJoin), ParentTable, ParentColumn, ChildTable, ChildColumn]);
end;

end.
