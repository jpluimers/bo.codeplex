using System;

// usually it is wise to embed this in an extra namespace to make resolution more fine grained
namespace bo.Extensions.SampleExtensions
{

    // Erweiterungsmethoden: http://msdn.microsoft.com/de-de/library/bb383977.aspx

    // must be static, usually also public; the same holds for the methods
    public static class SampleExtensions
    {

        // on interface references
        public static void Free(this IDisposable disposable)
        {
            if (null != disposable)
                disposable.Dispose();
        }

        // on built-in types
        public static void DebugLog(this string value)
        {
            // http://stackoverflow.com/questions/271398/what-are-your-favorite-extension-methods-for-c-codeplex-com-extensionoverflow/276331#276331
            // http://stackoverflow.com/questions/4429254/how-to-make-debugview-work-under-net-4
            // Works with internal debugger (pane "Output") using F5, or with DebugView using Ctrl-F5
            // Note the .NET 4 " HR Propagated"  bug when using DebugView (http://social.msdn.microsoft.com/Forums/en/vsdebug/thread/3954ba35-5dd0-4194-b172-8619bf293e4b)
            System.Diagnostics.Debug.WriteLine(value);
            Console.WriteLine(value);
        }

        public enum DebugLogLevel { simple, full };

        // on object references
        public static void DebugLog(this Exception ex, DebugLogLevel debugLogLevel = DebugLogLevel.simple) // C# 4.0: optional parameters (default parameter values)
        {
            if (debugLogLevel == DebugLogLevel.simple)
                ex.Message.DebugLog();
            else
                ex.ToString().DebugLog();
        }

        // on generic types
        public static object ToDBValue<T>(this Nullable<T> nullable) where T : struct
        {
            if (nullable.HasValue)
                return nullable.Value;
            else
                return DBNull.Value;
        }

    }
}
