using System;
using System.Text;

namespace bo.Text
{

    public class Utf8ToWindows1252Processor : Utf8ToDefaultProcessor
    {

        public override Encoding GetOutputEncoding()
        {
            return Encoding.GetEncoding(1252); // construction by CodePage number
        }

    }

}