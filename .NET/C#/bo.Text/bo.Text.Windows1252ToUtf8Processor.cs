using System;
using System.Text;

namespace bo.Text
{

    public class Windows1252ToUtf8Processor : Utf8ToDefaultProcessor
    {

        public override Encoding GetInputEncoding()
        {
            return Encoding.GetEncoding(1252); // construction by CodePage number
        }

    }

}
