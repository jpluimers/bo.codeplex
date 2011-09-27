using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TicTacToeLogic
{
    public static class Players
    {
#if WINDOWS_PHONE
        public static IEnumerable<Player> All
        {
            get
            {
                return EnumHelpers.GetValues(new Player());
            }
        }
#else
        public static Array All
        {
            get
            {
                return Enum.GetValues(typeof(Player));
            }
        }
#endif
    }
}
