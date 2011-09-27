using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TicTacToeLogic
{
    public static class Lines
    {
#if WINDOWS_PHONE
        public static IEnumerable<Line> All
        {
            get
            {
                return EnumHelpers.GetValues(new Line());
            }
        }
#else
        public static Array All
        {
            get
            {
                return Enum.GetValues(typeof(Line));
            }
        }
#endif
    }
}
