using System;
using System.Text;

namespace bo.Text
{

    public class Utf8ToIso8859_1Processor : Utf8ToDefaultProcessor
    {

        public override Encoding GetOutputEncoding()
        {
            return Encoding.GetEncoding("iso-8859-1"); // construction by encoding name
        }

    }

}
