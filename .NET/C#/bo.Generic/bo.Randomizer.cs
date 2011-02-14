using System;

namespace bo.Generic
{
    /// <summary>
    /// Typically, you only want one Random class per process/appdomain
    /// This is because initializing Random objects will give them the same 
    /// seed, hence the same order of random numbers.
    /// See http://msdn.microsoft.com/en-us/library/system.random(VS.85).aspx
    /// </summary>

    public static class Randomizer
    {

        public static Random Random
        {
            get
            {
                Random instance = Singleton<Random>.Instance; // <============
                return instance;
            }
        }
    }

}