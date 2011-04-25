using System;

namespace bo
{
    public class ExecutionContext
    {

        private static bool? isDesignTime;

        /// <summary>
        /// Gets a value indicating whether you run at DesignTime inside an IDE.
        /// </summary>
        /// <value>
        /// <c>true</c> if this instance is service; otherwise, <c>false</c>.
        /// </value>
        public static bool IsDesignTime
        {
            get
            {
                if (!isDesignTime.HasValue)
                {
                    /// from http://weblogs.asp.net/fmarguerie/archive/2005/03/23/395658.aspx
                    /// alternative: http://social.msdn.microsoft.com/forums/en-US/winformsdesigner/thread/d8c0f10d-691d-42bf-a2cf-b333454562db/
                    /// http://stackoverflow.com/questions/2427381/how-to-detect-that-c-winform-code-is-executed-within-visual-studio

                    /// inside a control, you might want to call something like this:
                    /// return (null != GetService(typeof(IDesignerHost)))
                    /// however, we are not in a control

                    /// Generic way, that should be IDE-neutral
                    isDesignTime =
                        (System.ComponentModel.LicenseManager.UsageMode ==
                        System.ComponentModel.LicenseUsageMode.Designtime);

                    /// VS2003/VS2005/VS2008/VS2010 specific way: is "devenv" the running dotNetProcess.
                    using (System.Diagnostics.Process currentProcess = System.Diagnostics.Process.GetCurrentProcess())
                    {
                        isDesignTime = (bool)isDesignTime ||
                            ("devenv" == currentProcess.ProcessName);
                    }
                }
                return (bool)isDesignTime;
            }
        }

        /// <summary>
        /// Gets a value indicating whether you run inside a windows service.
        /// http://stackoverflow.com/questions/200163/am-i-running-as-a-service/218954#218954
        /// </summary>
        /// <value>
        /// <c>true</c> if this instance is service; otherwise, <c>false</c>.
        /// </value>
        public static bool IsService
        {
            get
            {
                // Determining whether or not the host application is a service is
                // an expensive operation (it uses reflection), so we cache the
                // result of the first call to this method so that we don't have to
                // recalculate it every call.

                // If we have not already determined whether or not the application
                // is running as a service...

                if ((_isService == null))
                {
                    // Get details of the host assembly.
                    System.Reflection.Assembly entryAssembly = System.Reflection.Assembly.GetEntryAssembly();

                    // Get the method that was called to enter the host assembly.
                    System.Reflection.MethodInfo entryPoint = entryAssembly.EntryPoint;

                    // If the base type of the host assembly inherits from the
                    // "ServiceBase" class, it must be a windows service. We store
                    // the result ready for the next caller of this method.
                    _isService = (entryPoint.ReflectedType.BaseType.FullName == "System.ServiceProcess.ServiceBase");

                }

                // Return the cached result.
                return Convert.ToBoolean(_isService);
            }
        }

        private static Nullable<bool> _isService = null;
    }
}
