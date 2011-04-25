using System;
using System.Collections.Generic;
using System.Threading;

namespace bo
{
    public class ConsoleProgram
    {
        #region tools

        public string ExecutableName
        {
            get
            {
                string result = AssemblyHelper.ExecutableName;
                return result;
            }
        }

        public void WaitForEnter()
        {
            Console.Write("Press <Enter>");
            Console.ReadLine();
        }

        #endregion

        #region logic

        // http://msdn.microsoft.com/en-us/library/0fwzzxz2(v=VS.80).aspx - Main() Return Values (C# Programming Guide)
        // http://msdn.microsoft.com/en-us/library/system.diagnostics.process.exitcode(VS.90).aspx - Process.ExitCode Property
        public readonly int DefaultExitCode = int.MinValue;

        protected virtual int logic(string arg)
        {
            return DefaultExitCode;
            // intentionally left blank for descendants to override
        }

        protected virtual int logic(string[] args)
        {
            // for "void" result, it looks really easy:
            //Array.ForEach(
            //    args,
            //    logic
            //);
            // But in fact there is some sort of hidden lambda that translates to "(arg) => logic(arg)":
            //Array.ForEach(
            //    args,
            //    (arg) => logic(arg) 
            //);

            // with "int" result, we need an explicit lamda:
            int result = DefaultExitCode;
            Array.ForEach(
                args,
                (arg) => { result = logic(arg); }
            );
            return result;
        }

        #endregion

        #region main

        protected virtual int regularMain(string[] args)
        {
            try
            {
                return logic(args);
            }
            catch (Exception ex)
            {
                log(ex);
                log(ex.StackTrace);
                throw;
            }
        }

        protected virtual int debugMain(string[] args)
        {
            try
            {
                int result = regularMain(args);
                Console.WriteLine("result = {0}", result);
                return result;
            }
            finally
            {
                WaitForEnter();
            }
        }

        public static int RegularMain<T>(string[] args) where T : ConsoleProgram, new()
        {
            ConsoleProgram instance = new T();
            return instance.regularMain(args);
        }

        public static int DebugMain<T>(string[] args) where T : ConsoleProgram, new()
        {
            ConsoleProgram instance = new T();
            return instance.debugMain(args);
        }

        #endregion

        #region log

        public static IFormatProvider FormatProvider
        {
            get
            {
                return Thread.CurrentThread.CurrentCulture;
            }
        }
        public static void log(string value)
        {
            Console.WriteLine(value);
        }

        public static void log(object value)
        {
            if (value != null)
            {
                IFormattable formattable1 = value as IFormattable;
                if (formattable1 != null)
                {
                    log(formattable1.ToString(null, FormatProvider));
                }
                else
                {
                    log(value.ToString());
                }
            }
        }

        public static void log(string format, object arg0)
        {
            log(string.Format(FormatProvider, format, new object[] { arg0 }));
        }

        public static void log(string format, object arg0, object arg1)
        {
            log(string.Format(FormatProvider, format, new object[] { arg0, arg1 }));
        }

        public static void log(string format, object arg0, object arg1, object arg2)
        {
            log(string.Format(FormatProvider, format, new object[] { arg0, arg1, arg2 }));
        }

        public static void log(string format, params object[] arg)
        {
            log(string.Format(FormatProvider, format, arg));
        }

        public static void log(object[] args)
        {
            foreach (object arg in args)
                log(arg);
        }

        public static void log(List<object> args)
        {
            foreach (object arg in args)
                log(arg);
        }

        protected static void log(List<string> args)
        {
            foreach (string arg in args)
                log(arg);
        }

        public static string ToString(TimeSpan timespan)
        {
            // TODO: take into account the current locale (is the '.' always a '.' ???)
            string result = timespan.ToString();
            while
                (
                (result.Length > 8) &&
                ((result[result.Length - 1] == '0') || (result[result.Length - 1] == '.'))
                )
            {
                result = result.Substring(0, result.Length - 2);
            }
            return result;
        }

        #endregion
    }
}
