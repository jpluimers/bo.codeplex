using System;

namespace bo.Extensions.ObjectExtensions
{
    public static class ObjectExtensions
    {
        public static void Free(this object value)
        {
            IDisposable disposable = value as IDisposable;
            if (disposable != null)
                disposable.Dispose();
        }
    }
}
