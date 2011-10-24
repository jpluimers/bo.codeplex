program DebuggerVisualizersVCLDemo;

uses
  Vcl.Forms,
  DebuggerVisualizersDemoFormUnit in '..\src\DebuggerVisualizersDemoFormUnit.pas' {DebuggerVisualizersDemoForm},
  StringUtilsUnit in '..\..\..\..\bo.Text\StringUtilsUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDebuggerVisualizersDemoForm, DebuggerVisualizersDemoForm);
  Application.Run;
end.
