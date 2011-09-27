using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TicTacToeLogic
{

    public abstract class BasePlayer
    {
        public abstract bool PlayBestMove(Game game);
    }

}
