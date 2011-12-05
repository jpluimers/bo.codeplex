unit TicTacToe_IOSUIControllerUnit;

interface

uses
{$ifdef FPC} // iOS
  TicTacToe_GameUnit,
  TicTacToe_BasePlayerUnit,
  TicTacToe_UIControlerExceptionUnit,
  TicTacToe_SquareUnit,
  TicTacToe_BoardUnit,
  TicTacToe_PlayerUnit,
  TicTacToe_WinnerUnit,
  Classes,
{$else}
  TicTacToe_GenericAbstractUIControllerUnit,
{$endif FPC} // iOS
  FMX_Controls;

type
{$ifdef FPC} // iOS
  /// <summary>
  /// TBoardButton types the buttons 1..9
  /// TStartGameWithPlayerButton types the start buttons for X or O
  /// TComputerPlayerOnOff types the CheckBox/OnOff switches that determines when the computer plays X or O
  /// TStatusTextLabel shows the game status (which player is about to play)
  /// </summary>
  /// <typeparam name="TBoardButton"></typeparam>
  /// <typeparam name="TStartGameWithPlayerButton"></typeparam>
  /// <typeparam name="TComputerPlayerOnOff"></typeparam>
  /// <typeparam name="TStatusTextLabel"></typeparam>
  ///    <TBoardButton: class;
  ///      TStartGameWithPlayerButton: class;
  ///      TComputerPlayerOnOff: class;
  ///      TStatusTextLabel: class> = class(TObject)
  // fake the Generic type parameters by aliasing them:
  TBoardButton = TButton;
  TStartGameWithPlayerButton = TButton;
  TComputerPlayerOnOff = TCheckBox;
  TStatusTextLabel = TLabel;
  TBaseIOSUIController = class(TObject)
    type
      TBoardButtonArray = array of TBoardButton;
      TBoardButtonArrayBySquare = array[TSquare] of TBoardButton;
    strict private
      Game: TGame;
      function Getthis(square: TSquare): TBoardButton; virtual;
    strict protected
      function GetBoardButton1: TBoardButton; virtual;
      function GetBoardButton2: TBoardButton; virtual;
      function GetBoardButton3: TBoardButton; virtual;
      function GetBoardButton4: TBoardButton; virtual;
      function GetBoardButton5: TBoardButton; virtual;
      function GetBoardButton6: TBoardButton; virtual;
      function GetBoardButton7: TBoardButton; virtual;
      function GetBoardButton8: TBoardButton; virtual;
      function GetBoardButton9: TBoardButton; virtual;
      function GetComputerPlayerOOnOff: TComputerPlayerOnOff; virtual;
      function GetComputerPlayerXOnOff: TComputerPlayerOnOff; virtual;
      function GetStartGameWithPlayerOButton: TStartGameWithPlayerButton; virtual;
      function GetStartGameWithPlayerXButton: TStartGameWithPlayerButton; virtual;
      function GetStatusTextLabel: TStatusTextLabel; virtual;
    public
      /// <summary>
      /// Initializes a new instance of the AbstractUIController class.
      /// </summary>
      constructor Create(const boardButton1: TBoardButton; const boardButton2: TBoardButton; const boardButton3:
          TBoardButton; const boardButton4: TBoardButton; const boardButton5: TBoardButton; const boardButton6: TBoardButton;
          const boardButton7: TBoardButton; const boardButton8: TBoardButton; const boardButton9: TBoardButton; const
          startGameWithPlayerOButton: TStartGameWithPlayerButton; const startGameWithPlayerXButton:
          TStartGameWithPlayerButton; const computerPlayerOOnOff: TComputerPlayerOnOff; const computerPlayerXOnOff:
          TComputerPlayerOnOff; const statusTextLabel: TStatusTextLabel);

    {$region abstract methods that clients should override}
      function getboardbuttontext(const boardbutton: tboardbutton): string; virtual; abstract;
      procedure setboardbuttontext(const boardbutton: tboardbutton; const text: string); virtual; abstract;
      procedure setstatustext(const text: string); virtual; abstract;
      procedure showmessage(const message: string); virtual; abstract;
      function computeronoffison(const computeronoff: tcomputerplayeronoff): boolean; virtual; abstract;
    {$endregion}

    {$region properties}
      property ComputerPlayerXOnOff: TComputerPlayerOnOff read GetComputerPlayerXOnOff;
      property ComputerPlayerOOnOff: TComputerPlayerOnOff read GetComputerPlayerOOnOff;
      property StartGameWithPlayerXButton: TStartGameWithPlayerButton read GetStartGameWithPlayerXButton;
      property StartGameWithPlayerOButton: TStartGameWithPlayerButton read GetStartGameWithPlayerOButton;
      property BoardButton9: TBoardButton read GetBoardButton9;
      property BoardButton8: TBoardButton read GetBoardButton8;
      property BoardButton7: TBoardButton read GetBoardButton7;
      property BoardButton6: TBoardButton read GetBoardButton6;
      property BoardButton5: TBoardButton read GetBoardButton5;
      property BoardButton4: TBoardButton read GetBoardButton4;
      property BoardButton3: TBoardButton read GetBoardButton3;
      property BoardButton2: TBoardButton read GetBoardButton2;
      property BoardButton1: TBoardButton read GetBoardButton1;
      property StatusTextLabel: TStatusTextLabel read GetStatusTextLabel;
    {$endregion}

      function CreatePlayer: TBasePlayer; virtual;
      procedure GameLoopTimerTick; virtual;
      procedure PlayGameButton(const boardButton: TBoardButton); virtual;
      function ButtonSquare(const boardButton: TBoardButton): TSquare; virtual;

    strict private
      property this[square: TSquare]: TBoardButton read Getthis;

    {$region step1board}
    strict private
      function gameBoardCopy: TBoard;  virtual;
    public
      procedure BoardToView(); virtual;
      procedure ViewToBoard(); virtual;
      procedure ClearBoard; virtual;
    {$endregion step1board}

    {$region step2game}
    strict private
      procedure gameToView; virtual;
      procedure internalPlayGameButton(const playButton: TBoardButton); virtual;
    public
      procedure StartGame(const newPlayer: TPlayer); virtual;
    {$endregion step2game}

    {$region step3computer}
    strict private
      function isComputerPlaying(const player: TPlayer; const computerPlayerOnOff: TComputerPlayerOnOff): Boolean; virtual;

      procedure computerPlay; virtual;
    {$endregion}

    strict private
      FComputerPlayerXOnOff: TComputerPlayerOnOff;
      FComputerPlayerOOnOff: TComputerPlayerOnOff;
      FStartGameWithPlayerXButton: TStartGameWithPlayerButton;
      FStartGameWithPlayerOButton: TStartGameWithPlayerButton;
      FBoardButton9: TBoardButton;
      FBoardButton8: TBoardButton;
      FBoardButton7: TBoardButton;
      FBoardButton6: TBoardButton;
      FBoardButton5: TBoardButton;
      FBoardButton4: TBoardButton;
      FBoardButton3: TBoardButton;
      FBoardButton2: TBoardButton;
      FBoardButton1: TBoardButton;
      FStatusTextLabel: TStatusTextLabel;

      procedure showWinner(const winner: TWinner); virtual;
  end;
{$endif FPC} // iOS

{$ifdef FPC} // iOS
  TIOSUIController = class(TBaseIOSUIController)
{$else}
  TIOSUIController = class(TGenericAbstractUIController<TButton, TButton, TCheckBox, TLabel>)
{$endif FPC} // iOS
  public
    // note: in Delphi you can not use the types used in the Generic class (<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff, TStatusTextLabel>)
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
{$ifdef FPC} // iOS
  EnumTypeInfoUnit,
  TicTacToe_SquareContentMapperUnit,
  TicTacToe_SimplePlayerUnit,
  SysUtils,
  TicTacToe_PlayerMapperUnit,
  Variants,
  TicTacToe_WinnerMapperUnit,
{$endif FPC} // iOS
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

{$ifdef FPC} // iOS

constructor TBaseIOSUIController.Create(const boardButton1: TBoardButton; const boardButton2: TBoardButton; const
    boardButton3: TBoardButton; const boardButton4: TBoardButton; const boardButton5: TBoardButton; const boardButton6:
    TBoardButton; const boardButton7: TBoardButton; const boardButton8: TBoardButton; const boardButton9: TBoardButton;
    const startGameWithPlayerOButton: TStartGameWithPlayerButton; const startGameWithPlayerXButton:
    TStartGameWithPlayerButton; const computerPlayerOOnOff: TComputerPlayerOnOff; const computerPlayerXOnOff:
    TComputerPlayerOnOff; const statusTextLabel: TStatusTextLabel);
begin
  inherited Create();
  game := TGame.Create();
  Self.FBoardButton1 := boardButton1;
  Self.FBoardButton2 := boardButton2;
  Self.FBoardButton3 := boardButton3;
  Self.FBoardButton4 := boardButton4;
  Self.FBoardButton5 := boardButton5;
  Self.FBoardButton6 := boardButton6;
  Self.FBoardButton7 := boardButton7;
  Self.FBoardButton8 := boardButton8;
  Self.FBoardButton9 := boardButton9;
  Self.FStartGameWithPlayerOButton := startGameWithPlayerOButton;
  Self.FStartGameWithPlayerXButton := startGameWithPlayerXButton;
  Self.FComputerPlayerOOnOff := computerPlayerOOnOff;
  Self.FComputerPlayerXOnOff := computerPlayerXOnOff;
  Self.FStatusTextLabel := statusTextLabel;
end;

procedure TBaseIOSUIController.BoardToView;
var
  boardButton: TBoardButton;
  square: TSquare;
  text: string;
  theBoard: TBoard;
begin
  theBoard := gameBoardCopy; // in the loop, don't get the board each time from the game
  for square := Low(TSquare) to High(TSquare) do
  begin
    text := TSquareContentMapper.ToText(theBoard.this[square]);
    boardButton := this[square];
    SetBoardButtonText(boardButton, text);
  end;
end;

function TBaseIOSUIController.ButtonSquare(const boardButton: TBoardButton): TSquare;
var
  square: TSquare;
begin
  for square := Low(TSquare) to High(TSquare) do
  begin
    if (boardButton = this[square])
    then
      Exit(square);
  end;
  raise EUIControlerException.CreateFmt('invalid boardButton %s', [boardButton.Name {ToString}]);
end;

function TBaseIOSUIController.CreatePlayer: TBasePlayer;
begin
  Result := TSimplePlayer.Create(); // TRandomPlayer.Create();
end;

procedure TBaseIOSUIController.GameLoopTimerTick;
begin
  computerPlay();
end;

function TBaseIOSUIController.GetBoardButton1: TBoardButton;
begin
  Result := FBoardButton1;
end;

function TBaseIOSUIController.GetBoardButton2: TBoardButton;
begin
  Result := FBoardButton2;
end;

function TBaseIOSUIController.GetBoardButton3: TBoardButton;
begin
  Result := FBoardButton3;
end;

function TBaseIOSUIController.GetBoardButton4: TBoardButton;
begin
  Result := FBoardButton4;
end;

function TBaseIOSUIController.GetBoardButton5: TBoardButton;
begin
  Result := FBoardButton5;
end;

function TBaseIOSUIController.GetBoardButton6: TBoardButton;
begin
  Result := FBoardButton6;
end;

function TBaseIOSUIController.GetBoardButton7: TBoardButton;
begin
  Result := FBoardButton7;
end;

function TBaseIOSUIController.GetBoardButton8: TBoardButton;
begin
  Result := FBoardButton8;
end;

function TBaseIOSUIController.GetBoardButton9: TBoardButton;
begin
  Result := FBoardButton9;
end;

function TBaseIOSUIController.GetComputerPlayerOOnOff: TComputerPlayerOnOff;
begin
  Result := FComputerPlayerOOnOff;
end;

function TBaseIOSUIController.GetComputerPlayerXOnOff: TComputerPlayerOnOff;
begin
  Result := FComputerPlayerXOnOff;
end;

function TBaseIOSUIController.GetStartGameWithPlayerOButton: TStartGameWithPlayerButton;
begin
  Result := FStartGameWithPlayerOButton;
end;

function TBaseIOSUIController.GetStartGameWithPlayerXButton: TStartGameWithPlayerButton;
begin
  Result := FStartGameWithPlayerXButton;
end;

function TBaseIOSUIController.GetStatusTextLabel: TStatusTextLabel;
begin
  Result := FStatusTextLabel;
end;

procedure TBaseIOSUIController.PlayGameButton(const boardButton: TBoardButton);
begin
  try
    internalPlayGameButton(boardButton);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TBaseIOSUIController.Getthis(square: TSquare): TBoardButton;
var
  boardButtonsBySquare: TBoardButtonArrayBySquare;
begin
  // easier usage
  // risk:  assume the enumerations in TSquare will not change
  boardButtonsBySquare[TSquare.Zero] := BoardButton1;
  boardButtonsBySquare[TSquare.One] := BoardButton2;
  boardButtonsBySquare[TSquare.Two] := BoardButton3;
  boardButtonsBySquare[TSquare.Three] := BoardButton4;
  boardButtonsBySquare[TSquare.Four] := BoardButton5;
  boardButtonsBySquare[TSquare.Five] := BoardButton6;
  boardButtonsBySquare[TSquare.Six] := BoardButton7;
  boardButtonsBySquare[TSquare.Seven] := BoardButton8;
  boardButtonsBySquare[TSquare.Eight] := BoardButton9;

  Result := boardButtonsBySquare[square];
end;

function TBaseIOSUIController.gameBoardCopy: TBoard;
begin
  Result := game.BoardCopy;
end;

procedure TBaseIOSUIController.ViewToBoard;
var
  boardButton: TBoardButton;
  square: TSquare;
  text: string;
  theBoard: TBoard;
begin
  theBoard := gameBoardCopy; // in the loop, don't get the board each time from the game
  try
    for square := Low(TSquare) to High(TSquare) do
    begin
      boardButton := this[square];
      text := GetBoardButtonText(boardButton);
      theBoard.this[square] := TSquareContentMapper.ToContent(text);
    end;
  finally
    theBoard.Free();
  end;
end;

procedure TBaseIOSUIController.ClearBoard;
begin
  game.ClearBoard();
  BoardToView();
end;

procedure TBaseIOSUIController.gameToView;
var
  text: string;
begin
  BoardToView();
  text := Format('%s plays', [TPlayerMapper.ToText(game.CurrentPlayer)]);
  SetStatusText(text);
end;

procedure TBaseIOSUIController.internalPlayGameButton(const playButton: TBoardButton);
var
  square: TSquare;
begin
  square := ButtonSquare(playButton);
  game.Play(square);
  gameToView();
  showWinner(game.Winner());
end;

procedure TBaseIOSUIController.StartGame(const newPlayer: TPlayer);
begin
  game.Start(newPlayer);
  gameToView();
end;

function TBaseIOSUIController.isComputerPlaying(const player: TPlayer; const computerPlayerOnOff:
    TComputerPlayerOnOff): Boolean;
begin
  result := game.CurrentPlayer = player;
  result := result and ComputerOnOffIsOn(computerPlayerOnOff);
end;

procedure TBaseIOSUIController.computerPlay;
var
  computerIsPlayingForAnyPlayer: Boolean;
  player: TBasePlayer;
begin
  if (not game.Finished()) then
  begin
    computerIsPlayingForAnyPlayer :=
      isComputerPlaying(TPlayer.Cross, ComputerPlayerXOnOff) // computer plays X
    or
      isComputerPlaying(TPlayer.Nought, ComputerPlayerOOnOff); // computer plays O
    if (computerIsPlayingForAnyPlayer) then
    begin
      player := CreatePlayer();
      try
        player.PlayBestMove(game);
      finally
        player.Free;
      end;
      gameToView();
      showWinner(game.Winner());
    end;
  end;
end;

procedure TBaseIOSUIController.showWinner(const winner: TWinner);
var
  winnerText: string;
begin
  winnerText := TWinnerMapper.WinnerText(winner);
  if (winnerText <> NullAsStringValue) then
    ShowMessage(winnerText);
end;

{$endif FPC} // iOS

end.
