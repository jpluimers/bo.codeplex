using System;
using System.Collections.Generic;

namespace bo.Extensions.RandomExtensions
{
    public static class RandomExtensions
    {
        public static bool CoinToss(this Random rng)
        {
            return rng.Next(2) == 0;
        }

        public static T OneOf<T>(this Random rng, IList<T> things)
        {
            return things[rng.Next(things.Count)];
        }

        public static T OneOf<T>(this Random rng, params T[] things)
        {
            return things[rng.Next(things.Length)];
        }
    }
}