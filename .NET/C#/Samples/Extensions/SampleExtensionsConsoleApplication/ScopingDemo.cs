using System;

using ScopingExtension.Outer;

namespace SampleExtensionsConsoleApplication
{
    using ScopingExtension.Inner;

    public class ScopingDemo
    {
        public static void Run()
        {
            object o = new object();
            Console.WriteLine(o.ToString());
            o.ShowScope();
        }
    }
}
