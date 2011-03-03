using System;
using System.Configuration;

namespace bo.Configuration
{
    public class AppConfig
    {
        public static string Entry(string key)
        {
            string result = ConfigurationManager.AppSettings[key];
            return result;
        }

        public static bool Entry(string key, bool defaultValue)
        {
            bool result = defaultValue;
            Entry(key, ref result);
            return result;
        }

        public static int Entry(string key, int defaultValue)
        {
            int result = defaultValue;
            Entry(key, ref result);
            return result;
        }

        public static bool Entry(string key, ref bool value)
        {
            bool? result;
            Entry(key, out result);
            bool haveResult = result.HasValue;
            if (haveResult)
                value = result.Value;
            return haveResult;
        }

        public static bool Entry(string key, ref int value)
        {
            int? result;
            Entry(key, out result);
            bool haveResult = result.HasValue;
            if (haveResult)
                value = result.Value;
            return haveResult;
        }

        public static void Entry(string key, out bool? value)
        {
            string entry = Entry(key);

            if (string.IsNullOrEmpty(entry))
                value = null;
            else
            {
                bool actualValue;
                if (bool.TryParse(entry, out actualValue))
                    value = actualValue;
                else
                    value = null;
            }
        }

        public static void Entry(string key, out int? value)
        {
            string entry = Entry(key);

            if (string.IsNullOrEmpty(entry))
                value = null;
            else
            {
                int actualValue;
                if (int.TryParse(entry, out actualValue))
                    value = actualValue;
                else
                    value = null;
            }
        }

    }
}
