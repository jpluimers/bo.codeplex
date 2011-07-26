using System;
using System.Text;

namespace bo.Text
{

    public class Utf8ToAsciiProcessor : Utf8ToDefaultProcessor
    {

        public override Encoding GetOutputEncoding()
        {
            return Encoding.ASCII; // built-in construction of the Encoding
        }

    }

}
