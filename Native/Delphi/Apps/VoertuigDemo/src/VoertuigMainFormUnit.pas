unit VoertuigMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TVoertuigMainForm = class(TForm)
    VoertuigTypeRadioGroup: TRadioGroup;
    RijButton: TButton;
    LogMemo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VoertuigMainForm: TVoertuigMainForm;

implementation

{$R *.dfm}

end.
