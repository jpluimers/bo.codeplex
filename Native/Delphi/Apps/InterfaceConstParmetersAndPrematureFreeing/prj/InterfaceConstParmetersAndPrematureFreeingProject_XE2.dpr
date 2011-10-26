program InterfaceConstParmetersAndPrematureFreeingProject_XE2;

{$APPTYPE CONSOLE}

uses
  FastMM4 in '..\..\..\..\..\Forks\FastMM\FastMM4.pas',
  FastMM4Messages in '..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
  SysUtils,
  TextTestRunner,
  DumpUnit in '..\src\DumpUnit.pas',
  MyInterfacedObjectUnit in '..\src\MyInterfacedObjectUnit.pas',
  InterfaceConstParmetersAndMemoryLeakTestCaseUnit in '..\src\InterfaceConstParmetersAndMemoryLeakTestCaseUnit.pas',
  InterfaceConstParmetersAndPrematureFreeingUnit in '..\src\InterfaceConstParmetersAndPrematureFreeingUnit.pas',
  InterfaceConstParmetersAndPrematureFreeingTestCaseUnit in '..\src\InterfaceConstParmetersAndPrematureFreeingTestCaseUnit.pas',
  InterfaceConstParmetersBaseTestCaseUnit in '..\src\InterfaceConstParmetersBaseTestCaseUnit.pas',
  WritelnInterfacedObjectUnit in '..\src\WritelnInterfacedObjectUnit.pas';

begin
// QC 90482/RAID 281509
// http://qc.embarcadero.com/wc/qcmain.aspx?d=90482
//
// note: MemoryLeak checking requires to rebuild the DUnit and FastMM units these defines to be defined at project level:
// - {$define FastMM}
// - {$define EnableMemoryLeakReporting}
// - {$define FullDebugMode}
// - {$define FullDebugModeCallBacks}
// - {$define CatchUseOfFreedInterfaces} // disables CheckUseOfFreedBlocksOnShutdown
//
// You will need to adapt these paths to the location of your own sources:
//// FastMM units:
// FastMM4 in '..\..\..\..\..\Forks\FastMM\FastMM4.pas',
// FastMM4Messages in '..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
//
//// DUnit units:
// FastMMMemLeakMonitor in 'C:\Program Files\Embarcadero\RAD Studio\8.0\source\dUnit\src\FastMMMemLeakMonitor.pas',
// TestFramework in 'C:\Program Files\Embarcadero\RAD Studio\8.0\source\dUnit\src\TestFramework.pas',
// TextTestRunner in 'C:\Program Files\Embarcadero\RAD Studio\8.0\source\dUnit\src\TextTestRunner.pas',
  try
    // do NOT forget to call Free, otherwise you will have memory leaks in DUnit (as not everything there is interface based)
    TextTestRunner.RunRegisteredTests.Free();
//    Run(); // this will show you the create/destroy/addref/releaFastMMMemLeakMonitorpse order using WriteLn in InterfaceConstParmetersAndPrematureFreeingUnit
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Write('Press <Enter>');
  Readln;
end.

