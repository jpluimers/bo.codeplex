unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LoggerUnit;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    LogRadioGroup: TRadioGroup;
    Splitter1: TSplitter;
    LogMemo: TMemo;
    LogButton: TButton;
    procedure LogButtonClick(Sender: TObject);
  strict private
    FLogger: TLogger;
  strict protected
    function GetLogger: TLogger;
    property Logger: TLogger read GetLogger;
  public
    destructor Destroy; override;
  end;

var
  MainForm: TMainForm;

implementation

uses
  OutputDebugViewLoggerUnit, LoggersUnit;

{$R *.dfm}

destructor TMainForm.Destroy;
begin
  inherited Destroy;
  FLogger.Free;
  FLogger := nil;
end;

function TMainForm.GetLogger: TLogger;
begin
  if not Assigned(FLogger) then
    FLogger :=  TTeeLogger.Create([
      TOutputDebugViewLogger.Create(),
      TStringsLogger.Create(LogMemo.Lines),
      TStringsLogger.Create(LogRadioGroup.Items)
    ]);
  Result := FLogger;
end;

procedure TMainForm.LogButtonClick(Sender: TObject);
begin
  Logger.Log(Sender.ClassName, (Sender as TComponent).Name);
end;

end.
