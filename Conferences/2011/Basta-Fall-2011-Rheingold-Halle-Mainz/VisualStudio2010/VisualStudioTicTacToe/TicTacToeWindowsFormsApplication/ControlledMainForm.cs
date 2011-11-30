﻿using System;
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
    public partial class ControlledMainForm : Form
    {
        public ControlledMainForm()
        {
            InitializeComponent();
            controller = new WindowsFormsUIController(
                button1, button2, button3,
                button4, button5, button6,
                button7, button8, button9,
                buttonStartO, buttonStartX,
                computerOCheckBox, computerXCheckBox,
                currentPlayerLabel
                );
        }

        WindowsFormsUIController controller;

        private void ComputerPlaysTimer_Tick(object sender, System.EventArgs e)
        {
            controller.GameLoopTimerTick();
        }

        private void boardButton_Click(object sender, System.EventArgs e)
        {
            controller.PlayGameButton(sender as Button);
        }

        private void buttonStartO_Click(object sender, System.EventArgs e)
        {
            controller.StartGame(Player.Nought);
        }

        private void buttonStartX_Click(object sender, System.EventArgs e)
        {
            controller.StartGame(Player.Cross);
        }

        private void buttonBoardToStorage_Click(object sender, System.EventArgs e)
        {
            controller.ViewToBoard();
        }

        private void buttonStorageToBoard_Click(object sender, System.EventArgs e)
        {
            controller.BoardToView();
        }

        private void buttonClearBoard_Click(object sender, System.EventArgs e)
        {
            controller.ClearBoard();
        }

        private void buttonTestButtonSquare_Click(object sender, System.EventArgs e)
        {
            controller.ButtonSquare(sender as Button);
        }
    }
}
