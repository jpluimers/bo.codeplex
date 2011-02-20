using System;

namespace bo.Extensions.StringExtensions
{
    public static class StringExtensions
    {
        public static string ReverseString(this string value)
        {
            char[] array = value.ToCharArray();
            Array.Reverse(array);
            return new string(array);
        }

        public static bool IsNullOrWhiteSpace(this string value)
        {
            if (null != value)
            {
                foreach (Char character in value)
                {
                    if (!Char.IsWhiteSpace(character))
                    {
                        return false;
                    }
                }
            } 
            return true;
        }
    }
}