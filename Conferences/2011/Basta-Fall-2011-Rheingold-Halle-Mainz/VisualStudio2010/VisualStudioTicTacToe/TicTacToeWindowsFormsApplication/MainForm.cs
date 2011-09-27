using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using TicTacToeLogic;

namespace TicTacToeWindowsFormsApplication
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private Button this[Square square]
        {
            get
            {
                Button[] boardButtons = 
				{
					button1, button2, button3,
					button4, button5, button6, 
					button7, button8, button9
				};
                return boardButtons[(int)square];
            }
        }

        private Square buttonSquare(Button button)
        {
            foreach (Square square in Squares.All)
            {
                if (button == this[square])
                    return square;
            } // semi-colon not needed
            throw new ApplicationException("invalid button " + button.ToString());
            //MessageBox.Show(String.Format("invalid button {0}", button));
        }

        Game game = new Game();

        #region step1board
        private Board board
        {
            get
            {
                return game.Board;
            }
        }

        private void boardToView()
        {
            Board theBoard = board; // in the loop, don't get the board each time from the game
            foreach (Square square in Squares.All)
            {
                string text = SquareContentMapper.ToText(theBoard[square]);
#if DotNet11
                // .NET 1.1 trick to get around this error message:
                // Property or indexer 'property' cannot be assigned to — it is read only
                Button button = this[square];
                button.Text = Text;
#else
                this[square].Text = text;
#endif
            };
        }

        private void viewToBoard()
        {
            foreach (Square square in Squares.All)
            {
                board[square] = SquareContentMapper.ToContent(this[square].Text);
            };
        }

        private void clearBoard()
        {
            foreach (Square square in Squares.All)
            {
                board[square] = SquareContent.None;
            };
            viewToBoard();
        }

        private void playBoardButton(Button playButton)
        {
            Square square = buttonSquare(playButton);
            if (board[square] == SquareContent.None)
            {
                board[square] = (currentPlayer == Player.Cross) ? SquareContent.Cross : SquareContent.Nought;
                currentPlayer = (currentPlayer == Player.Cross) ? Player.Nought : Player.Cross;
                boardToView();
                //showWinner(board.Winner()); // board does not know about winner
            } // semi-colon not allowed before else
            else
                MessageBox.Show("you can only play on empty squares!");
            return;
        } // semi-colon not allowed

        Player currentPlayer = Player.Cross;
        #endregion step1board

        #region step2game
        private void gameToView()
        {
            boardToView();
            currentPlayerLabel.Text = (game.CurrentPlayer == Player.Cross) ? "X plays" : "O plays";
        }

        private void playGameButton(Button playButton)
        {
            Square square = buttonSquare(playButton);
            game.Play(square);
            gameToView();
            showWinner(game.Winner());
        }

        private void startGame(Player newPlayer)
        {
            game.Start(newPlayer);
            gameToView();
        }
        #endregion step2game

        #region step3computer
        private void computerPlay()
        {
            if (!game.Finished())
            {
                if (
                    (game.CurrentPlayer == Player.Cross) && (ComputerXCheckBox.Checked) // computer plays X
                ||
                    (game.CurrentPlayer == Player.Nought) && (ComputerOCheckBox.Checked) // computer plays O
                    )
                {
                    BasePlayer player = new SimplePlayer(); // RandomPlayer();
                    player.PlayBestMove(game);
                    gameToView();
                    showWinner(game.Winner());
                };
            }
        }
        #endregion

        private void showWinner(Winner winner)
        {
            string winnerText = WinnerMapper.WinnerText(winner);
            if (!string.IsNullOrEmpty(winnerText))
                MessageBox.Show(winnerText);
        }

    }
}
