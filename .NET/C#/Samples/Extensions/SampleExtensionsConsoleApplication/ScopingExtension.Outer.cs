using System;

namespace ScopingExtension.Outer
{
    public  static class ScopingExtension
    {
        public static string ToString(this object value)
        {
            return "ScopingExtension.ToString();";
        }

        public static void ShowScope(this object value)
        {
            Console.WriteLine("ScopingExtension.Outer");
        }
    }
}
