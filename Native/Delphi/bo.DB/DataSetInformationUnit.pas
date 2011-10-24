unit DataSetInformationUnit;

interface

uses
  Data.DB;

function DataSetInfo(const DataSet: TDataSet): string;
function FieldDefsInfo(const DataSet: TDataSet): string;
function FieldsInfo(const DataSet: TDataSet): string;

implementation

uses
  System.SysUtils,
  Xml.XMLConst;

type
  TStringBuilderAppender = reference to procedure (const StringBuilder: TStringBuilder; const Index: Integer);

function BuildStringIterating(const Count: Integer; const StringBuilderAppender: TStringBuilderAppender): string;
var
  Index: Integer;
  StringBuilder: TStringBuilder;
begin
  StringBuilder := TStringBuilder.Create();
  try
    for Index := 0 to Count-1 do
    begin
      StringBuilderAppender(StringBuilder, Index);
      StringBuilder.Append(CRLF);
    end;
    Result := StringBuilder.ToString();
  finally
    StringBuilder.Free;
  end;
end;

function DataSetInfo(const DataSet: TDataSet): string;
begin
  Result := Format('%s(%s) Records=%d, BOF=%s, EOF=%s%s', [
  DataSet.ClassName, DataSet.Name, DataSet.RecordCount, BoolToStr(DataSet.Bof), BoolToStr(DataSet.Eof), CRLF]);
end;

function FieldsInfo(const DataSet: TDataSet): string;
var
  Fields: TFields;
begin
  Fields := DataSet.Fields;
  Result := BuildStringIterating(Fields.Count,
    procedure (const StringBuilder: TStringBuilder; const Index: Integer)
    var
      Field: TField;
    begin
      Field := Fields[Index];
      StringBuilder.AppendFormat('Field[%d] FieldNo=%d, Name="%s" FieldName="%s"', [Index, Field.FieldNo, Field.Name, Field.FieldName]);
    end
  );
end;

function FieldDefsInfo(const DataSet: TDataSet): string;
var
  FieldDefs: TFieldDefs;
begin
  FieldDefs := DataSet.FieldDefs;
  Result := BuildStringIterating(FieldDefs.Count,
    procedure (const StringBuilder: TStringBuilder; const Index: Integer)
    var
      FieldDef: TFieldDef;
    begin
      FieldDef := FieldDefs[Index];
      StringBuilder.AppendFormat('FieldDef[%d] FieldNo=%d, Name="%s"', [Index, FieldDef.FieldNo, FieldDef.Name]);
    end
  );
end;

end.
