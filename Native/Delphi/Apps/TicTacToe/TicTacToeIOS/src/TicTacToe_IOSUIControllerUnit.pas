unit TicTacToe_IOSUIControllerUnit;

interface

uses
  TicTacToe_GenericAbstractUIControllerUnit,
  FMX_Controls;

type
  TIOSUIController = class(TGenericAbstractUIController<TButton, TButton, TCheckBox, TLabel>)
  public
    // note: in Delphi you can not use the types used in the Generic class (<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff, TStatusTextLabel)
    // you have to use the concrete class names when overriding methods
    // note: class completion of virtual/abstract methods does not work when descending from Generic classes
    function ComputerOnOffIsOn(const computerOnOff: TCheckBox): Boolean; override;
    function GetBoardButtonText(const boardButton: TButton): string; override;
    procedure SetBoardButtonText(const boardButton: TButton; const text: string); override;
    procedure SetStatusText(const text: string); override;
    procedure ShowMessage(const message: string); override;
  end;

implementation

uses
  FMX_Dialogs;

function TIOSUIController.ComputerOnOffIsOn(const computerOnOff: TCheckBox): Boolean;
begin
  Result := computerOnOff.IsChecked;
end;

function TIOSUIController.GetBoardButtonText(const boardButton: TButton): string;
begin
  Result := boardButton.Text;
end;

procedure TIOSUIController.SetBoardButtonText(const boardButton: TButton; const text: string);
begin
  boardButton.Text := text;
end;

procedure TIOSUIController.SetStatusText(const text: string);
begin
  StatusTextLabel.Text := text;
end;

procedure TIOSUIController.ShowMessage(const message: string);
begin
  FMX_Dialogs.ShowMessage(message);
end;

end.
