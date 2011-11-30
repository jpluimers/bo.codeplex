unit HiddenExecuteSettingsUnit;

interface

uses
  Classes,
  LoggerUnit,
  LoggerInterfaceUnit;

type
  THiddenExecuteSettings = class(TComponent)
  strict protected
    function GetVerbosityLevelInteger: Integer; virtual;
    procedure SetDbWinLoggerIsEnabled(const Value: Boolean); virtual;
    procedure SetShowHelp(const Value: Boolean); virtual;
    procedure SetVerbosityLevel(const Value: TVerbosityLevel); virtual;
    procedure SetVerbosityLevelInteger(const Value: Integer); virtual;
  public
  const
    DefaultEncryptConversation = True;
    DefaultShowHelp = False;
    DefaultVerbosityLevel = vlInfo; // vlWarn;
  strict private
    FShowHelp: Boolean;
    FVerbosityLevel: TVerbosityLevel;
    FDbWinLoggerIsEnabled: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DbWinLoggerIsEnabled: Boolean read FDbWinLoggerIsEnabled write SetDbWinLoggerIsEnabled;
    property ShowHelp: Boolean read FShowHelp write SetShowHelp;
    property VerbosityLevel: TVerbosityLevel read FVerbosityLevel write SetVerbosityLevel;
    property VerbosityLevelInteger: Integer read GetVerbosityLevelInteger write SetVerbosityLevelInteger;
  end;

implementation

uses
  SysUtils;

constructor THiddenExecuteSettings.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DbWinLoggerIsEnabled := DefaultEncryptConversation;
  ShowHelp := DefaultShowHelp;
  VerbosityLevel := DefaultVerbosityLevel;
end;

function THiddenExecuteSettings.GetVerbosityLevelInteger: Integer;
begin
  Result := Ord(VerbosityLevel);
end;

procedure THiddenExecuteSettings.SetDbWinLoggerIsEnabled(const Value: Boolean);
begin
  FDbWinLoggerIsEnabled := Value;
end;

procedure THiddenExecuteSettings.SetShowHelp(const Value: Boolean);
begin
  FShowHelp := Value;
end;

procedure THiddenExecuteSettings.SetVerbosityLevel(const Value: TVerbosityLevel);
begin
  FVerbosityLevel := Value;
end;

procedure THiddenExecuteSettings.SetVerbosityLevelInteger(const Value: Integer);
begin
  if Value >= Ord(Low(VerbosityLevel)) then
    if Value <= Ord(High(VerbosityLevel)) then
      VerbosityLevel := TVerbosityLevel(Value);
end;

end.
