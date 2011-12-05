unit TicTacToe_VclFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TicTacToe_VCLUIControllerUnit,
  Vcl.ExtCtrls;

type
  TVclForm = class(TForm)
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
    ClearBoardButton: TButton;
    ViewToBoardButton: TButton;
    BoardToViewButton: TButton;
    TestButtonSquareButton: TButton;
    OneSecondTimer: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure BoardButtonClick(Sender: TObject);
    procedure BoardToViewButtonClick(Sender: TObject);
    procedure ClearBoardButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OneSecondTimerTimer(Sender: TObject);
    procedure StartNewGameWithPlayerOButtonClick(Sender: TObject);
    procedure StartNewGameWithPlayerXButtonClick(Sender: TObject);
    procedure TestButtonSquareButtonClick(Sender: TObject);
    procedure ViewToBoardButtonClick(Sender: TObject);
  strict private
    FVCLUIController: TVCLUIController;
  strict protected
    property VCLUIController: TVCLUIController read FVCLUIController;
  end;

var
  VclForm: TVclForm;

implementation

uses
  TicTacToe_PlayerUnit;

{$R *.dfm}

procedure TVclForm.FormDestroy(Sender: TObject);
begin
  FVCLUIController.Free();
  FVCLUIController := nil;
end;

procedure TVclForm.BoardButtonClick(Sender: TObject);
begin
  VCLUIController.PlayGameButton(Sender as TButton);
end;

procedure TVclForm.BoardToViewButtonClick(Sender: TObject);
begin
  VCLUIController.BoardToView();
end;

procedure TVclForm.ClearBoardButtonClick(Sender: TObject);
begin
  VCLUIController.ClearBoard();
end;

procedure TVclForm.FormCreate(Sender: TObject);
begin
  FVCLUIController := TVCLUIController.Create(
    BoardButton1, BoardButton2, BoardButton3,
    BoardButton4, BoardButton5, BoardButton6,
    BoardButton7, BoardButton8, BoardButton9,
    StartNewGameWithPlayerOButton, StartNewGameWithPlayerXButton,
    ComputerPlaysOCheckBox, ComputerPlaysXCheckBox,
    CurrentPlayerLabel);
end;

procedure TVclForm.OneSecondTimerTimer(Sender: TObject);
begin
  if Assigned(VCLUIController) then
    VCLUIController.GameLoopTimerTick();
end;

procedure TVclForm.StartNewGameWithPlayerOButtonClick(Sender: TObject);
begin
  VCLUIController.StartGame(TPlayer.Nought);
end;

procedure TVclForm.StartNewGameWithPlayerXButtonClick(Sender: TObject);
begin
  VCLUIController.StartGame(TPlayer.Cross);
end;

procedure TVclForm.TestButtonSquareButtonClick(Sender: TObject);
begin
  VCLUIController.ButtonSquare(sender as TButton);
end;

procedure TVclForm.ViewToBoardButtonClick(Sender: TObject);
begin
  VCLUIController.ViewToBoard();
end;

end.
