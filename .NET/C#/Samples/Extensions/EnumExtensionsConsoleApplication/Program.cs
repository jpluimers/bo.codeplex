using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using bo.Extensions.EnumExtensions;

namespace EnumExtensionsConsoleApplication
{
    class Program : bo.ConsoleProgram
    {
        protected override int logic(string[] args)
        {
            CardSuits reds = CardSuits.Diamonds | CardSuits.Hearts;
            CardSuits blacks = CardSuits.Clubs.Union(CardSuits.Spades);
            CardSuits minors = CardSuits.Clubs | CardSuits.Diamonds;
            CardSuits majors = CardSuits.Hearts.Union(CardSuits.Spades);

            CardSuits majorBlacks = majors.Intersect(blacks);
            CardSuits minorReds = minors.Intersect(reds);

            CardSuits allColors = reds.Union(blacks);
            CardSuits allLevels = minors.Union(majors); // minors + majors; // cannot use + here

            log("reds: {0}", reds);
            log("blacks: {0}", blacks);
            log("majors: {0}", majors);
            log("minors: {0}", minors);
            log("majorBlacks: {0}", majorBlacks);
            log("minorReds: {0}", minorReds);
            log("allColors: {0}", allColors);
            log("allLevels: {0}", allLevels);

            log("are Hearts a Minor suit? {0}", CardSuits.Hearts.In(minors));

            log("what is the intersection of Majors and Minors? {0}", minors.Intersect(majors)); // this displays 0

            CardSuits[] all = CardSuits.Clubs.All().ToArray(); // you need  " Clubs"  because there are no static Extension Methods
            foreach (CardSuits cardSuit in all)
            {
                log(cardSuit.ToString());
            }

            return 0;
        }

        static void Main(string[] args)
        {
#if DEBUG
            new Program().debugMain(args);
#else
            new Program().regularMain(args);
#endif
        }
    }
}
