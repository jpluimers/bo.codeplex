unit TicTacToe.FireMonkeyUIControllerUnit;

interface

uses
  TicTacToe.GenericAbstractUIControllerUnit,
  FMX.Controls;

type
  TFireMonkeyUIController = class(TGenericAbstractUIController<TButton, TButton, TCheckBox, TLabel>)
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
  FMX.Dialogs;

function TFireMonkeyUIController.ComputerOnOffIsOn(const computerOnOff: TCheckBox): Boolean;
begin
  Result := computerOnOff.IsChecked;
end;

function TFireMonkeyUIController.GetBoardButtonText(const boardButton: TButton): string;
begin
  Result := boardButton.Text;
end;

procedure TFireMonkeyUIController.SetBoardButtonText(const boardButton: TButton; const text: string);
begin
  boardButton.Text := text;
end;

procedure TFireMonkeyUIController.SetStatusText(const text: string);
begin
  StatusTextLabel.Text := text;
end;

procedure TFireMonkeyUIController.ShowMessage(const message: string);
begin
  FMX.Dialogs.ShowMessage(message);
end;

end.
