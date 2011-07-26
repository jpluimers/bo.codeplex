using System;
//using System.Collections.Generic;
using System.IO;
//using System.Text;

namespace bo.Text
{
    public class SpecificToSpecificReencoder : BaseReencoder
    {
        public virtual void Run(string inputEncodingName, string outputEncodingName)
        {
            SpecificToSpecificProcessor specificToSpecificProcessor = new SpecificToSpecificProcessor(inputEncodingName, outputEncodingName);
            Run(Console.OpenStandardInput(), Console.OpenStandardOutput(), specificToSpecificProcessor);
        }

        public virtual void Run(string inputEncodingName, string outputEncodingName, string inputFileName)
        {
            SpecificToSpecificProcessor specificToSpecificProcessor = new SpecificToSpecificProcessor(inputEncodingName, outputEncodingName);
            using (Stream inputStream = GetInputStream(inputFileName))
            {
                Run(inputStream, Console.OpenStandardOutput(), specificToSpecificProcessor);
            }
        }

        public virtual void Run(string inputEncodingName, string outputEncodingName, string inputFileName, string outputFileName)
        {
            using (Stream inputStream = GetInputStream(inputFileName))
            {
                using (Stream outputStream = GetOutputStream(outputFileName))
                {
                    Run(inputEncodingName, outputEncodingName, inputStream, outputStream);
                }
            }
        }

        public virtual void Run(string inputEncodingName, string outputEncodingName, Stream inputStream, Stream outputStream)
        {
            SpecificToSpecificProcessor specificToSpecificProcessor = new SpecificToSpecificProcessor(inputEncodingName, outputEncodingName);
            Run(inputStream, outputStream, specificToSpecificProcessor);
        }

        public override DefaultToDefaultProcessor CreateProcessor()
        {
            throw new NotImplementedException();
        }
    }
}
