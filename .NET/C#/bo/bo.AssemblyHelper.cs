using System;
using System.Diagnostics;
using System.Reflection;

namespace bo
{
    public class AssemblyHelper
    {

        public static string ExecutableName
        {
            get
            {
                string lFullyQualifiedName;

                Assembly lAssembly = Assembly.GetEntryAssembly();
                if (null != lAssembly)
                {
                    lFullyQualifiedName = lAssembly.GetModules()[0].FullyQualifiedName;
                }
                else
                {
                    lFullyQualifiedName = Process.GetCurrentProcess().MainModule.FileName;
                }
                return System.IO.Path.GetFileName(lFullyQualifiedName);
            }
        }

    }
}
