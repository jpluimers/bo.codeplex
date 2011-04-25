using System;

namespace bo.Extensions.Generic.NullExtensions
{
    public static class NullExtensions
    {
        public static void ThrowArgumentNullExceptionIfNull<T>(this T data, string name) 
        {
            if (data == null)
                throw new ArgumentNullException(name);
        }

        public static void ThrowArgumentNullExceptionIfNull<T>(this T data)
        {
            if (data == null)
                throw new ArgumentNullException();
        }
    }
}
