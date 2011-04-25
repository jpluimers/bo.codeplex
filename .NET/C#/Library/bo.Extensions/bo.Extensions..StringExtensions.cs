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

        // note that With needs a couple of overloads to match the System.String.Format overloads

        public static string With(this string format, object arg0)
        {
            return string.Format(format, arg0);
        }

        public static string With(this string format, object arg0, object arg1)
        {
            return string.Format(format, arg0, arg1);
        }

        public static string Format(this string format, IFormatProvider provider, params object[] args)
        {
            return string.Format(provider, format, args);
        }
        
        public static string With(this string format, object arg0, object arg1, object arg2)
        {
            return string.Format(format, arg0, arg1, arg2);
        }
        
        public static string With(this string format, params object[] args)
        {
            return string.Format(format, args);
        }

    }
}