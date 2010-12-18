program FastMMUsageTrackerProject;

uses
  FastMmBootstrapUnit in '..\..\..\bo.FastMM\FastMmBootstrapUnit.pas',
  Forms,
  FastMMUsageTrackerMainFormUnit in '..\src\FastMMUsageTrackerMainFormUnit.pas' {FastMMUsageTrackerMainForm},
  FastMM4Messages in '..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
  FastMM4 in '..\..\..\..\..\Forks\FastMM\FastMM4.pas',
  FastMMUsageTracker in 'C:\develop.backup\codeplex\TFS05\bo\Forks\FastMM\Demos\Usage Tracker\FastMMUsageTracker.pas' {fFastMMUsageTracker};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFastMMUsageTrackerMainForm, FastMMUsageTrackerMainForm);
  Application.Run;
end.
