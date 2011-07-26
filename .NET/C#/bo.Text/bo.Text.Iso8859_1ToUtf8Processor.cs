using System;
using System.Text;

namespace bo.Text
{

    public class Iso8859_1ToUtf8Processor : DefaultToUtf8Processor
    {

        public override Encoding GetInputEncoding()
        {
            return Encoding.GetEncoding("iso-8859-1"); // construction by encoding name
        }

    }

}
