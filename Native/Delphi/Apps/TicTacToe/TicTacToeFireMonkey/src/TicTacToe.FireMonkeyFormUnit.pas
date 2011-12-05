unit TicTacToe.FireMonkeyFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, TicTacToe.FireMonkeyUIControllerUnit;

type
  TFireMonkeyForm = class(TForm)
    BoardButton1: TButton;
    BoardButton2: TButton;
    BoardButton3: TButton;
    BoardButton4: TButton;
    BoardButton5: TButton;
    BoardButton6: TButton;
    BoardButton7: TButton;
    BoardButton8: TButton;
    BoardButton9: TButton;
    StartNewGameWithPlayerXButton: TButton;
    StartNewGameWithPlayerOButton: TButton;
    ComputerPlaysXCheckBox: TCheckBox;
    ComputerPlaysOCheckBox: TCheckBox;
    CurrentPlayerLabel: TLabel;
    OneSecondTimer: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BoardButtonClick(Sender: TObject);
    procedure OneSecondTimerTimer(Sender: TObject);
    procedure StartNewGameWithPlayerOButtonClick(Sender: TObject);
    procedure StartNewGameWithPlayerXButtonClick(Sender: TObject);
  strict private
    FFireMonkeyUIController: TFireMonkeyUIController;
  strict protected
    property FireMonkeyUIController: TFireMonkeyUIController read FFireMonkeyUIController;
  end;

var
  FireMonkeyForm: TFireMonkeyForm;

implementation

uses
  TicTacToe.PlayerUnit;

{$R *.fmx}

procedure TFireMonkeyForm.FormDestroy(Sender: TObject);
begin
  FFireMonkeyUIController.Free();
  FFireMonkeyUIController := nil;
end;

procedure TFireMonkeyForm.FormCreate(Sender: TObject);
begin
  FFireMonkeyUIController := TFireMonkeyUIController.Create(
    BoardButton1, BoardButton2, BoardButton3,
    BoardButton4, BoardButton5, BoardButton6,
    BoardButton7, BoardButton8, BoardButton9,
    StartNewGameWithPlayerOButton, StartNewGameWithPlayerXButton,
    ComputerPlaysOCheckBox, ComputerPlaysXCheckBox,
    CurrentPlayerLabel);
end;

procedure TFireMonkeyForm.BoardButtonClick(Sender: TObject);
begin
  FireMonkeyUIController.PlayGameButton(Sender as TButton);
end;

procedure TFireMonkeyForm.OneSecondTimerTimer(Sender: TObject);
begin
  if Assigned(FireMonkeyUIController) then
    FireMonkeyUIController.GameLoopTimerTick();
end;

procedure TFireMonkeyForm.StartNewGameWithPlayerOButtonClick(Sender: TObject);
begin
  FireMonkeyUIController.StartGame(TPlayer.Nought);
end;

procedure TFireMonkeyForm.StartNewGameWithPlayerXButtonClick(Sender: TObject);
begin
  FireMonkeyUIController.StartGame(TPlayer.Cross);
end;

end.
