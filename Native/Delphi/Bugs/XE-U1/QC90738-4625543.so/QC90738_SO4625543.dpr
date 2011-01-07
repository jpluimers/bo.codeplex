// http://qc.embarcadero.com/wc/qcmain.aspx?d=90738
// http://stackoverflow.com/questions/4625543/interface-with-property-using-generics-in-delphi

program QC90738_SO4625543;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  INamed = interface
    function GetName : String;
    property Name : String read GetName;
  end;

  TPerson = class(TInterfacedObject, INamed)
  strict private
    name_ : String;
    function GetName: String;
  public
    constructor Create(firstName : String); reintroduce;
    property Name: String read GetName;
  end;

constructor TPerson.Create(firstName : String);
begin
  inherited Create();
  name_ := firstName;
end;

function TPerson.GetName: String;
begin
  Result := name_;
end;

type
  TPrinter<T : INamed> = class
    ref : T;
    procedure Print;
  end;

  TPrinter2 = class
    ref : INamed;
    procedure Print;
  end;

  procedure TPrinter<T>.Print;
  begin
    // order of the calls does not matter; Name will fail under certain circumstances
    WriteLn(ref.GetName); // <-- this is ok
    WriteLn(ref.Name);  // <-- this line gives access violation for TPrinter<TPerson>, but not for TPrinter<INamed>
  end;

  procedure TPrinter2.Print;
  begin
    WriteLn(ref.GetName);
    WriteLn(ref.Name);
  end;

//////////////////////////////////////////////////////////////

procedure Main;
var
  johnT : TPerson;
  printI : TPrinter<INamed>;
  printT : TPrinter<TPerson>;
  print2 : TPrinter2;

begin
  johnT := TPerson.Create('John');
  printI := TPrinter<INamed>.Create;
  printT := TPrinter<TPerson>.Create;
  print2 := TPrinter2.Create;
  printI.ref := johnT;
  printT.ref := johnT;
  print2.ref := johnT;
  printI.Print;
  printT.Print;
  print2.Print;
  ReadLn;
end;

begin
  try
    Main();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
