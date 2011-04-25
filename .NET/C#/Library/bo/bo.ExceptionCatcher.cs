using System;
using System.Threading;

namespace bo
{
    public class ExceptionCatcher
    {

        private Exception _Exception;
        public Exception Exception
        {
            get { return _Exception; }
        }

        private bool _Success;
        public bool Success
        {
            get { return _Success; }
        }

        public void Catch(SendOrPostCallback codeBlock)
        {
            _Exception = null;
            try
            {
                // need 1 argument, because it is a SendOrPostCallback
                codeBlock.DynamicInvoke(1);

                _Success = true;
            }
            catch (Exception ex)
            {
#if DEBUG
                System.Diagnostics.Trace.WriteLine("ExceptionCatcher.Succeeded failure", ex.ToString());
#endif
                _Exception = ex;
                _Success = false;
            }
        }

        public bool Failed(SendOrPostCallback codeBlock)
        {
            bool result = !Succeeded(codeBlock);
            return result;
        }

        public bool Failed(out string exceptionString, SendOrPostCallback codeBlock)
        {
            bool result = !Succeeded(out exceptionString, codeBlock);
            return result;
        }

        public bool Succeeded(SendOrPostCallback codeBlock)
        {
            Catch(codeBlock);
            return _Success;
        }

        public bool Succeeded(out string exceptionString, SendOrPostCallback codeBlock)
        {
            bool result = Succeeded(codeBlock);
            if (result)
                exceptionString = this.Exception.ToString();
            else
                exceptionString = string.Empty;
            return result;
        }

    }
}
