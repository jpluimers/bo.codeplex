using System;
using System.Text;

namespace bo.Text
{

    public class DefaultToUtf8Processor : DefaultToDefaultProcessor
    {

        public override Encoding GetOutputEncoding()
        {
            return Encoding.UTF8;
        }

    }

}
