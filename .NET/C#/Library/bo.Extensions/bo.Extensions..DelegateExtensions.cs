using System;
using System.Reflection;

namespace bo.Extensions.DelegateExtensions
{
    public static class DelegateExtensions
    {

        public static string DelegateSignature(this Delegate eventHandler)
        {
            string result;

            MethodInfo method = eventHandler.Method;
            if (method == null)
                result = "";
            else
                result = method.ToString();

            if (eventHandler.Target == null)
                result = "static " + result;

            return result;
        }
    }
}
