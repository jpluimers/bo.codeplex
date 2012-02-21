using System;
using System.Security;

namespace SecureStringConsoleApplication
{
    class Program : bo.ConsoleProgram
    {

        // http://blogs.msdn.com/b/fpintos/archive/2009/06/12/how-to-properly-convert-securestring-to-string.aspx
        protected override int logic(string[] args)
        {
            const string password = "P@$sW0rd";
            SecureString secureString = password.ToSecureString();

            string secureStringToString = secureString.ToString(); // this wont work: you will get System.Security.SecureString
            bool stringEquals = (password == secureStringToString);

            Console.WriteLine("secureStringToString: {0}", secureStringToString);
            Console.WriteLine("stringEquals: {0}", stringEquals);

            SecureString passwordToSecureString = password.ToSecureString();

            bool safeSecureStringEquals = SecureStringExtensions.SafeSecureStringEqual(passwordToSecureString, secureString);
            Console.WriteLine("safeSecureStringEquals: {0}", safeSecureStringEquals);

            bool unsafeSecureStringEquals = SecureStringExtensions.UnsafeSecureStringEqual(passwordToSecureString, secureString);
            Console.WriteLine("unsafeSecureStringEquals: {0}", unsafeSecureStringEquals);

            string convertToUnsecureString = secureString.ConvertToUnsecureString();
            stringEquals = (password == secureStringToString);
            Console.WriteLine("convertToUnsecureString: {0}", convertToUnsecureString);
            Console.WriteLine("stringEquals: {0}", stringEquals);

            return -1;
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
