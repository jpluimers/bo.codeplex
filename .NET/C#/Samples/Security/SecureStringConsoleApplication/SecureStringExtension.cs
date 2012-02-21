using System;
using System.Security;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace SecureStringConsoleApplication
{
    public static class SecureStringExtensions
    {
        public static SecureString ToSecureString(this string password)
        {
            SecureString ss = new SecureString();
            foreach (char c in password)
            {
                ss.AppendChar(c);
            }

            return ss;
        }

        public static SecureString FastConvertToSecureString(this string password)
        {
            if (password == null)
                throw new ArgumentNullException("password");

            unsafe
            {
                fixed (char* passwordChars = password)
                {
                    var securePassword = new SecureString(passwordChars, password.Length);
                    securePassword.MakeReadOnly();
                    return securePassword;
                }
            }
        }

        public static string ConvertToUnsecureString(this SecureString securePassword)
        {
            if (securePassword == null)
                throw new ArgumentNullException("securePassword");

            IntPtr unmanagedString = IntPtr.Zero;
            try
            {
                unmanagedString = Marshal.SecureStringToGlobalAllocUnicode(securePassword);
                return Marshal.PtrToStringUni(unmanagedString);
            }
            finally
            {
                Marshal.ZeroFreeGlobalAllocUnicode(unmanagedString);
            }
        }

        private static void requireArguments(SecureString secureString1, SecureString secureString2)
        {
            if (secureString1 == null)
            {
                throw new ArgumentNullException("secureString1");
            }
            if (secureString2 == null)
            {
                throw new ArgumentNullException("s2secureString2");
            }
        }

        // http://stackoverflow.com/questions/4502676/c-compare-two-securestrings-for-equality/4502736#4502736
        // note this compiles without unsafe, but in fact it is very dangerous as it will decrypt the SecureStrings into memory as str1 and str2 leaving a huge security gap
        public static Boolean SafeSecureStringEqual(this SecureString secureString1, SecureString secureString2)
        {
            requireArguments(secureString1, secureString2);

            if (secureString1.Length != secureString2.Length)
            {
                return false;
            }

            IntPtr binaryStringPointer1 = IntPtr.Zero;
            IntPtr binaryStringPointer2 = IntPtr.Zero;

            RuntimeHelpers.PrepareConstrainedRegions();

            try // begin CER (ConstrainedExecutionRegion)
            {
                binaryStringPointer1 = Marshal.SecureStringToBSTR(secureString1);
                binaryStringPointer2 = Marshal.SecureStringToBSTR(secureString2);

                String str1 = Marshal.PtrToStringBSTR(binaryStringPointer1);
                String str2 = Marshal.PtrToStringBSTR(binaryStringPointer2);

                return str1.Equals(str2);
            }
            finally
            {
                if (binaryStringPointer1 != IntPtr.Zero)
                {
                    Marshal.ZeroFreeBSTR(binaryStringPointer1);
                }

                if (binaryStringPointer2 != IntPtr.Zero)
                {
                    Marshal.ZeroFreeBSTR(binaryStringPointer2);
                }
            } // end CER (ConstrainedExecutionRegion)
        }

        public static Boolean UnsafeSecureStringEqual(this SecureString secureString1, SecureString secureString2)
        {
            requireArguments(secureString1, secureString2);

            if (secureString1.Length != secureString2.Length)
            {
                return false;
            }

            IntPtr binaryStringPointer1 = IntPtr.Zero;
            IntPtr binaryStringPointer2 = IntPtr.Zero;

            RuntimeHelpers.PrepareConstrainedRegions();

            try // begin CER (ConstrainedExecutionRegion)
            {
                binaryStringPointer1 = Marshal.SecureStringToBSTR(secureString1);
                binaryStringPointer2 = Marshal.SecureStringToBSTR(secureString2);

                unsafe
                {
                    for (Char* ptr1 = (Char*)binaryStringPointer1.ToPointer(), ptr2 = (Char*)binaryStringPointer2.ToPointer();
                        *ptr1 != 0 && *ptr2 != 0;
                         ++ptr1, ++ptr2)
                    {
                        if (*ptr1 != *ptr2)
                        {
                            return false;
                        }
                    }
                }

                return true;
            }
            finally
            {
                if (binaryStringPointer1 != IntPtr.Zero)
                {
                    Marshal.ZeroFreeBSTR(binaryStringPointer1);
                }

                if (binaryStringPointer2 != IntPtr.Zero)
                {
                    Marshal.ZeroFreeBSTR(binaryStringPointer2);
                }
            } // end CER (ConstrainedExecutionRegion)
        }

    }
}