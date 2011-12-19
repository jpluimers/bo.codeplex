unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    VersionMemo: TMemo;
    VersionInfoButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure VersionInfoButtonClick(Sender: TObject);
  strict protected
    function OSArchitectureToStr(const Architecture: TOSVersion.TArchitecture):
        string;
    function OSPlatformToStr(const Platform: TOSVersion.TPlatform): string;
    function PlatformFromIFDEF: string;
    function PlatformFromPointer: string;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  VersionMemo.Clear();
end;

function TMainForm.OSArchitectureToStr(const Architecture:
    TOSVersion.TArchitecture): string;
begin
  case Architecture of
    arIntelX86: Result := 'IntelX86';
    arIntelX64: Result := 'IntelX64';
  else
    Result := 'UNKNOWN OS Architecture';
  end;
end;

function TMainForm.OSPlatformToStr(const Platform: TOSVersion.TPlatform): string;
begin
  case Platform of
    pfWindows: Result := 'Windows';
    pfMacOS:   Result := 'MacOS';
  else
    Result := 'UNKNOWN OS Platform';
  end;
end;

function TMainForm.PlatformFromIFDEF: string;
begin
  Result := 'UNKNOWN OS Platform Bitsize';
{$IFDEF CPUX86}
  Result := '32bit';
{$ENDIF CPUX86}
{$IFDEF CPUX64}
  Result := '64bit';
{$ENDIF CPUX64}
end;

function TMainForm.PlatformFromPointer: string;
var
  BitSize: Integer;
  PointerSize: Integer;
begin
  PointerSize := SizeOf(Pointer);
  BitSize := PointerSize * 8;
  Result := IntToStr(BitSize) + 'bit';
end;

procedure TMainForm.VersionInfoButtonClick(Sender: TObject);
begin
  VersionMemo.Lines.Clear();
  VersionMemo.Lines.Add(TOSVersion.ToString());
  VersionMemo.Lines.Add('Architecture:  ' + OSArchitectureToStr(TOSVersion.Architecture));
  VersionMemo.Lines.Add('Platform:  ' + OSPlatformToStr(TOSVersion.Platform));
  VersionMemo.Lines.Add('OS Name:  ' + TOSVersion.Name);
  VersionMemo.Lines.Add('OS Version – Major:  ' + IntToStr(TOSVersion.Major));
  VersionMemo.Lines.Add('OS Version – Minor:  ' + IntToStr(TOSVersion.Minor));
  VersionMemo.Lines.Add('OS Build:  ' + IntToStr(TOSVersion.Build));
  VersionMemo.Lines.Add('OS Service Pack - Major:  ' + IntToStr(TOSVersion.ServicePackMajor));
  VersionMemo.Lines.Add('OS Service Pack - Minor:  ' + IntToStr(TOSVersion.ServicePackMinor));
  VersionMemo.Lines.Add('Application compiled for (via pointer):  '+
    OSPlatformToStr(TOSVersion.Platform) + ' ' + PlatformFromPointer());
  VersionMemo.Lines.Add('Application compiled for (via IFDEF):  '+
    OSPlatformToStr(TOSVersion.Platform) + ' ' + PlatformFromIFDEF());
end;

end.
