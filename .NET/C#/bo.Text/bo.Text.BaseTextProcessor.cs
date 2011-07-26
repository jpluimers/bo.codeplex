using System;
using System.IO;

namespace bo.Text
{
    public class BaseTextProcessor
    {

        public static Stream GetInputStream(string inputFileName)
        {
            Stream input;
            input = new FileStream(inputFileName, FileMode.Open, FileAccess.Read);
            return input;
        }

        public static Stream GetOutputStream(string outputFileName)
        {
            Stream output;
            output = new FileStream(outputFileName, FileMode.OpenOrCreate, FileAccess.Write);
            return output;
        }

    }
}
