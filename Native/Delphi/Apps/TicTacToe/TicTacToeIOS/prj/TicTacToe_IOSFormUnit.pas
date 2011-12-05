unit TicTacToe_IOSFormUnit;

interface

uses
  SysUtils, Types, UITypes, Classes, Variants, FMX_Types, FMX_Controls, FMX_Forms,
  FMX_Dialogs, TicTacToe_IOSUIControllerUnit;

type
  TIOSForm = class(TForm)
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
    StyleBook1: TStyleBook;
    procedure BoardButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure OneSecondTimerTimer(Sender: TObject);
    procedure StartNewGameWithPlayerOButtonClick(Sender: TObject);
    procedure StartNewGameWithPlayerXButtonClick(Sender: TObject);
  strict private
    FIOSUIController: TIOSUIController;
  strict protected
    property IOSUIController: TIOSUIController read FIOSUIController;
  end;

var
  IOSForm: TIOSForm;

implementation

uses
  TicTacToe_PlayerUnit;

{$R *.lfm}

procedure TIOSForm.BoardButtonClick(Sender: TObject);
begin
  IOSUIController.PlayGameButton(Sender as TButton);
end;

procedure TIOSForm.FormCreate(Sender: TObject);
begin
  FIOSUIController := TIOSUIController.Create(
    BoardButton1, BoardButton2, BoardButton3,
    BoardButton4, BoardButton5, BoardButton6,
    BoardButton7, BoardButton8, BoardButton9,
    StartNewGameWithPlayerOButton, StartNewGameWithPlayerXButton,
    ComputerPlaysOCheckBox, ComputerPlaysXCheckBox,
    CurrentPlayerLabel);
end;

procedure TIOSForm.FormDeactivate(Sender: TObject);
begin
  FIOSUIController.Free();
  FIOSUIController := nil;
end;

procedure TIOSForm.OneSecondTimerTimer(Sender: TObject);
begin
  if Assigned(IOSUIController) then
    IOSUIController.GameLoopTimerTick();
end;

procedure TIOSForm.StartNewGameWithPlayerOButtonClick(Sender: TObject);
begin
  IOSUIController.StartGame(TPlayer.Nought);
end;

procedure TIOSForm.StartNewGameWithPlayerXButtonClick(Sender: TObject);
begin
  IOSUIController.StartGame(TPlayer.Cross);
end;

end.
