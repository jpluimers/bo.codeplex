using System;
using System.Collections.Generic;
using System.Text;

namespace bo.Text
{
    public class SpecificToSpecificProcessor : Utf8ToDefaultProcessor
    {
        public SpecificToSpecificProcessor(string inputEncodingName, string outputEncodingName)
        {
            this.inputEncodingName = inputEncodingName;
            this.outputEncodingName = outputEncodingName;
        }

        private string inputEncodingName;

        public string InputEncodingName
        {
            get { return inputEncodingName; }
        }
        private string outputEncodingName;

        public string OutputEncodingName
        {
            get { return outputEncodingName; }
        }

        public override Encoding GetInputEncoding()
        {
            return Encoding.GetEncoding(InputEncodingName); // construction by encoding name
        }

        public override Encoding GetOutputEncoding()
        {
            return Encoding.GetEncoding(OutputEncodingName); // construction by encoding name
        }

    }
}
