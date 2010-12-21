unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LoggerUnit, LoggerInterfaceUnit;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    LogRadioGroup: TRadioGroup;
    Splitter1: TSplitter;
    LogMemo: TMemo;
    LogButton: TButton;
    procedure LogButtonClick(Sender: TObject);
  strict private
    FLogger: ILogger;
  strict protected
    function GetLogger: ILogger;
    property Logger: ILogger read GetLogger;
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
  FLogger := nil;
end;

function TMainForm.GetLogger: ILogger;
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
  Logger.Log('Foo Bar', 1, 'Foo', 'Bar');
end;

end.
