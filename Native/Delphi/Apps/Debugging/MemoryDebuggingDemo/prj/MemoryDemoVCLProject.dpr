program MemoryDemoVCLProject;

uses
//  FastMM4 in '..\..\..\..\..\..\Forks\FastMM\FastMM4.pas',
//  FastMM4Messages in '..\..\..\..\..\..\Forks\FastMM\FastMM4Messages.pas',
//  SafeMMInstall in '..\SafeMM\SafeMMInstall.pas',
//  SafeMM in '..\SafeMM\SafeMM.pas',
//  InstallMemoryManagerUnit in '..\src\InstallMemoryManagerUnit.pas',
  Vcl.Forms,
  MemoryDemoFormUnit in '..\src\MemoryDemoFormUnit.pas' {Form1},
  MyPointUnit in '..\src\MyPointUnit.pas' {$R *.res};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
