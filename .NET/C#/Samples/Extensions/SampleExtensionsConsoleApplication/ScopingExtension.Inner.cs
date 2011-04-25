using System;

namespace ScopingExtension.Inner
{
    public static class ScopingExtension
    {

        public static void ShowScope(this object value)
        {
            Console.WriteLine("ScopingExtension.Inner");
        }
    }
}
