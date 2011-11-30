unit TicTacToe.GenericAbstractUIControllerUnit;

interface

uses
  TicTacToe.GameUnit, TicTacToeLogic.BasePlayerUnit;

type
  /// <summary>
  /// TBoardButton types the buttons 1..9
  /// TStartButton types the start buttons for X or O
  /// TComputerOnOff types the CheckBox/OnOff switches that determines when the computer plays X or O
  /// TStatusText shows the game status (which player is about to play)
  /// </summary>
  /// <typeparam name="TBoardButton"></typeparam>
  /// <typeparam name="TStartGameWithPlayerButton"></typeparam>
  /// <typeparam name="TComputerPlayerOnOff"></typeparam>
  /// <typeparam name="TStatusText"></typeparam>
  TGenericAbstractUIController
    <TBoardButton: class;
      TStartGameWithPlayerButton: class;
      TComputerPlayerOnOff: class;
      TStatusTextLabel: class> = class(TObject)
    strict private
      Game: TGame;
      function GetBoardButton3: TBoardButton; virtual;
    strict protected
      function GetBoardButton1: TBoardButton; virtual;
      function GetBoardButton2: TBoardButton;
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
      function GetBoardButtonText(const boardButton: TBoardButton): string; virtual; abstract;
      procedure SetBoardButtonText(const boardButton: TBoardButton; const text: string); virtual; abstract;
      procedure SetStatusText(const text: string); virtual; abstract;
      procedure ShowMessage(const message: string); virtual; abstract;
      function ComputerOnOffIsOn(const computerOnOff: TComputerPlayerOnOff): Boolean; virtual; abstract;
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

      procedure PlayGameButton(const boardButton: TBoardButton);

      public Square ButtonSquare(TBoardButton button)
      {
          foreach (Square square in Squares.All)
          {
              if (button == this[square])
                  return square;
          } // semi-colon not needed
          throw new UIControlerException(string.Format("invalid button {1}", button));
      }

      private TBoardButton this[Square square]
      {
          get
          {
              TBoardButton[] boardButtons =
      {
        BoardButton1, BoardButton2, BoardButton3,
        BoardButton4, BoardButton5, BoardButton6,
        BoardButton7, BoardButton8, BoardButton9
      };
              return boardButtons[(int)square];
          }
      }

      {$region step1board}

      private Board gameBoardCopy
      {
          get
          {
              return game.BoardCopy;
          }
      }
      public void BoardToView()
      {
          Board theBoard = gameBoardCopy; // in the loop, don't get the board each time from the game
          foreach (Square square in Squares.All)
          {
              string text = SquareContentMapper.ToText(theBoard[square]);
              TBoardButton boardButton = this[square];
              SetBoardButtonText(boardButton, text);
          };
      }

      public void ViewToBoard()
      {
          Board theBoard = gameBoardCopy; // in the loop, don't get the board each time from the game
          foreach (Square square in Squares.All)
          {
              TBoardButton boardButton = this[square];
              string text = GetBoardButtonText(boardButton);
              theBoard[square] = SquareContentMapper.ToContent(text);
          };
      }

      public void ClearBoard()
      {
          foreach (Square square in Squares.All)
          {
              gameBoardCopy[square] = SquareContent.None;
          };
          ViewToBoard();
      }
      {$endregion} step1board

      {$region step2game}
      private void gameToView()
      {
          BoardToView();
          string text = string.Format("{0} plays", PlayerMapper.ToText(game.CurrentPlayer));
          SetStatusText(text);
      }

      private void playGameButton(TBoardButton playButton)
      {
          Square square = ButtonSquare(playButton);
          game.Play(square);
          gameToView();
          showWinner(game.Winner());
      }

      public void StartGame(Player newPlayer)
      {
          game.Start(newPlayer);
          gameToView();
      }
      {$endregion} step2game

      {$region step3computer}

      private bool isComputerPlaying(Player player, TComputerPlayerOnOff computerPlayerOnOff)
      {
          bool result = game.CurrentPlayer == player;
          result = result && ComputerOnOffIsOn(computerPlayerOnOff);
          return result;
      }

      private void computerPlay()
      {
          if (!game.Finished())
          {
              bool computerIsPlayingForAnyPlayer =
                  isComputerPlaying(Player.Cross, ComputerPlayerXOnOff) // computer plays X
                  ||
                  isComputerPlaying(Player.Nought, ComputerPlayerOOnOff); // computer plays O
              if (computerIsPlayingForAnyPlayer )
              {
                  BasePlayer player = CreatePlayer();
                  player.PlayBestMove(game);
                  gameToView();
                  showWinner(game.Winner());
              };
          }
      }
      {$endregion}

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
      private void showWinner(Winner winner)
      {
          string winnerText = WinnerMapper.WinnerText(winner);
          if (!string.IsNullOrEmpty(winnerText))
              ShowMessage(winnerText);
      }

  }
}
  end;

implementation

constructor TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.Create(const boardButton1: TBoardButton; const boardButton2: TBoardButton; const boardButton3:
    TBoardButton; const boardButton4: TBoardButton; const boardButton5: TBoardButton; const boardButton6: TBoardButton;
    const boardButton7: TBoardButton; const boardButton8: TBoardButton; const boardButton9: TBoardButton; const
    startGameWithPlayerOButton: TStartGameWithPlayerButton; const startGameWithPlayerXButton:
    TStartGameWithPlayerButton; const computerPlayerOOnOff: TComputerPlayerOnOff; const computerPlayerXOnOff:
    TComputerPlayerOnOff; const statusTextLabel: TStatusTextLabel);
begin
  inherited Create();
  game := Game.Create();
  Self.BoardButton1 := boardButton1;
  Self.BoardButton2 := boardButton2;
  Self.BoardButton3 := boardButton3;
  Self.BoardButton4 := boardButton4;
  Self.BoardButton5 := boardButton5;
  Self.BoardButton6 := boardButton6;
  Self.BoardButton7 := boardButton7;
  Self.BoardButton8 := boardButton8;
  Self.BoardButton9 := boardButton9;
  Self.StartGameWithPlayerOButton := startGameWithPlayerOButton;
  Self.StartGameWithPlayerXButton := startGameWithPlayerXButton;
  Self.ComputerPlayerOOnOff := computerPlayerOOnOff;
  Self.ComputerPlayerXOnOff := computerPlayerXOnOff;
  Self.StatusTextLabel := statusTextLabel;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.CreatePlayer: TBasePlayer;
begin
  Result := TSimplePlayer.Create(); // TRandomPlayer.Create();
end;

procedure TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GameLoopTimerTick;
begin
  computerPlay();
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton1: TBoardButton;
begin
  Result := FBoardButton1;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton2: TBoardButton;
begin
  Result := FBoardButton2;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton3: TBoardButton;
begin
  Result := FBoardButton3;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton4: TBoardButton;
begin
  Result := FBoardButton4;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton5: TBoardButton;
begin
  Result := FBoardButton5;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton6: TBoardButton;
begin
  Result := FBoardButton6;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton7: TBoardButton;
begin
  Result := FBoardButton7;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton8: TBoardButton;
begin
  Result := FBoardButton8;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetBoardButton9: TBoardButton;
begin
  Result := FBoardButton9;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetComputerPlayerOOnOff: TComputerPlayerOnOff;
begin
  Result := FComputerPlayerOOnOff;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetComputerPlayerXOnOff: TComputerPlayerOnOff;
begin
  Result := FComputerPlayerXOnOff;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetStartGameWithPlayerOButton: TStartGameWithPlayerButton;
begin
  Result := FStartGameWithPlayerOButton;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetStartGameWithPlayerXButton: TStartGameWithPlayerButton;
begin
  Result := FStartGameWithPlayerXButton;
end;

function TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.GetStatusTextLabel: TStatusTextLabel;
begin
  Result := FStatusTextLabel;
end;

procedure TGenericAbstractUIController<TBoardButton, TStartGameWithPlayerButton, TComputerPlayerOnOff,
    TStatusTextLabel>.PlayGameButton(const boardButton: TBoardButton);
begin
  try
    playGameButton(boardButton);
  except
    on E: Exception do
      ShowMessage(ex.Message);
  end;
end;

end.
