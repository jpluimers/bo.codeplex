using System;

namespace bo
{
    public static class DesignTime
    {
        private static bool? isDesignTime;
        public static bool IsDesignTime
        {
            get
            {
                if (!isDesignTime.HasValue)
                {
                    /// from http://weblogs.asp.net/fmarguerie/archive/2005/03/23/395658.aspx

                    /// inside a control, you might want to call something like this:
                    /// return (null != GetService(typeof(IDesignerHost)))
                    /// however, we are not in a control

                    /// Generic way, that should be IDE-neutral
                    isDesignTime =
                        (System.ComponentModel.LicenseManager.UsageMode ==
                        System.ComponentModel.LicenseUsageMode.Designtime);

                    /// VS2003/VS2005/VS2008/VS2010 specific way: is "devenv" the running dotNetProcess.
                    isDesignTime = (bool)isDesignTime ||
                        ("devenv" == System.Diagnostics.Process.GetCurrentProcess().ProcessName);
                }
                return (bool)isDesignTime;
            }
        }
    }
}
