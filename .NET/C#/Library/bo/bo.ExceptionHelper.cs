using System;
using System.Threading;

namespace bo
{
    public class ExceptionHelper
    {
        public static void Catch(SendOrPostCallback codeBlock)
        {
            ExceptionCatcher exceptionCatcher = new ExceptionCatcher();
            exceptionCatcher.Catch(codeBlock);
        }

        public static bool Failed(SendOrPostCallback codeBlock)
        {
            ExceptionCatcher exceptionCatcher = new ExceptionCatcher();
            bool result = exceptionCatcher.Failed(codeBlock);
            return result;
        }

        public static bool Succeeded(SendOrPostCallback codeBlock)
        {
            ExceptionCatcher exceptionCatcher = new ExceptionCatcher();
            bool result = exceptionCatcher.Succeeded(codeBlock);
            return result;
        }

    }
}
