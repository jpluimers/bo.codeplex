using System;
using System.Collections;
using System.Linq;

using bo.Extensions.SampleExtensions;
using bo.Extensions.DelegateExtensions;
using bo.Extensions.ObjectExtensions;
using bo.Extensions.StringExtensions;
using bo.Extensions.NullExtensions;

namespace SampleExtensionsConsoleApplication
{

    public static class IntExtensions
    {
        public static void Inc(this int value)
        {
            value++; // this won't work, since value is not passed by reference
        }
    }

    class Program : bo.ConsoleProgram
    {
        private delegate void MainDelegate(string[] args);
        private delegate int LogicDelegate(string[] args);

        protected override int logic(string[] args)
        {
            demoExtensionMethodsUseValueParameters();

            demoDelegateExtensions();

            demoObjectExtensions();

            demoStringExtensions(args);

            demoThrowArgumentNullExceptionIfNull();

            ScopingDemo.Run();

            return base.logic(args);
        }

        private static void runAndDebugLogExceptions(Action action)
        {
            try
            {
                action();
            }
            catch (Exception ex)
            {
                ex.DebugLog();
            }
        }

        private static void demoThrowArgumentNullExceptionIfNull()
        {
            runAndDebugLogExceptions(() => // lambda style
            {
                IDisposable i = null;
                i.ThrowArgumentNullExceptionIfNull();
            });
            runAndDebugLogExceptions(delegate // delegate style
            {
                uint? u = null;
                u.ThrowArgumentNullExceptionIfNull();
            });
            runAndDebugLogExceptions(delegate
            {
                object o = null;
                o.ThrowArgumentNullExceptionIfNull();
            });

            runAndDebugLogExceptions(delegate
            {
                IDisposable i = null;
                i.ThrowArgumentNullExceptionIfNull("IDisposable");
            });
            runAndDebugLogExceptions(delegate
            {
                uint? u = null;
                u.ThrowArgumentNullExceptionIfNull("uint?");
            });
            runAndDebugLogExceptions(delegate
            {
                object o = null;
                o.ThrowArgumentNullExceptionIfNull("object");
            });
        }

        private static void demoStringExtensions(string[] args)
        {
            string line = string.Format("args.Length: {0}", args.Length);
            line.DebugLog();
            var reverseLine = line.Reverse(); // System.Linq
            // line.Reverse().DebugLog(); // fails because System.Linq returns a char[]
            reverseLine.ToString().DebugLog();

            // you can call Extension Methods directly too:
            bo.Extensions.StringExtensions.StringExtensions.ReverseString(line).DebugLog();

            string[] items = { "foo", null, "     ", "bar" };
            foreach (string item in items)
            {
                Console.WriteLine("{0}: null-or-whitespace? {1}", item, item.IsNullOrWhiteSpace());
            }
        }

        private static void demoExtensionMethodsUseValueParameters()
        {
            // prints 10, not 11
            int i = 10;
            i.Inc();
            log(i.ToString());
        }

        private static void demoObjectExtensions()
        {
            object o = null;
            o.Free();

            // if in V1 of the FCL WindowsIdentity does not implemented IDispose, and in V2 it does, then Free will caan Dispose
            // 
            System.Security.Principal.WindowsIdentity currentWindowsIdentity = System.Security.Principal.WindowsIdentity.GetCurrent();
            try
            {
                currentWindowsIdentity.Name.DebugLog();
            }
            finally
            {
                currentWindowsIdentity.Free();
            }
        }

        private void demoDelegateExtensions()
        {
            MainDelegate mainDelegate = new MainDelegate(Main); // static
            LogicDelegate logicDelegate = new LogicDelegate(this.logic); // instance, cannot call this from a static method without having an instance

            mainDelegate.DelegateSignature().DebugLog();
            logicDelegate.DelegateSignature().DebugLog();
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
