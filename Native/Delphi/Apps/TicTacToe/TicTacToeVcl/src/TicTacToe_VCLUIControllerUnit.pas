unit TicTacToe_VCLUIControllerUnit;

interface

uses
  TicTacToe_GenericAbstractUIControllerUnit,
  Vcl.StdCtrls;

type
  TVCLUIController = class(TGenericAbstractUIController<TButton, TButton, TCheckBox, TLabel>)
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
  Vcl.Dialogs;

function TVCLUIController.ComputerOnOffIsOn(const computerOnOff: TCheckBox): Boolean;
begin
  Result := computerOnOff.Checked;
end;

function TVCLUIController.GetBoardButtonText(const boardButton: TButton): string;
begin
  Result := boardButton.Caption;
end;

procedure TVCLUIController.SetBoardButtonText(const boardButton: TButton; const text: string);
begin
  boardButton.Caption := text;
end;

procedure TVCLUIController.SetStatusText(const text: string);
begin
  StatusTextLabel.Caption := text;
end;

procedure TVCLUIController.ShowMessage(const message: string);
begin
  Vcl.Dialogs.ShowMessage(message);
end;

end.
