unit FastMMUsageTrackerMainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFastMMUsageTrackerMainForm = class(TForm)
    ShowFastMMUsageTrackerButton: TButton;
    LeakButton: TButton;
    procedure LeakButtonClick(Sender: TObject);
    procedure ShowFastMMUsageTrackerButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FastMMUsageTrackerMainForm: TFastMMUsageTrackerMainForm;

implementation

uses
  FastMMUsageTracker;

{$R *.dfm}

procedure TFastMMUsageTrackerMainForm.LeakButtonClick(Sender: TObject);
begin
  Sender := TObject.Create();
end;

procedure TFastMMUsageTrackerMainForm.ShowFastMMUsageTrackerButtonClick(Sender: TObject);
begin
  ShowFastMMUsageTracker;
end;

end.
