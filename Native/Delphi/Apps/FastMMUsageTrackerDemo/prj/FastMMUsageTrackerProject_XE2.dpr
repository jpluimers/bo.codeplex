program FastMMUsageTrackerProject_XE2;

uses
  FastMmBootstrapUnit in '..\..\..\bo.FastMM\FastMmBootstrapUnit.pas',
  Forms,
  FastMMUsageTrackerMainFormUnit in '..\src\FastMMUsageTrackerMainFormUnit.pas' {FastMMUsageTrackerMainForm},
  FastMM4Messages in '..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
  FastMM4 in '..\..\..\..\..\Forks\FastMM\FastMM4.pas',
  FastMMUsageTracker in '..\..\..\..\..\Forks\FastMM\Demos\Usage Tracker\FastMMUsageTracker.pas' {fFastMMUsageTracker};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFastMMUsageTrackerMainForm, FastMMUsageTrackerMainForm);
  Application.Run;
end.
