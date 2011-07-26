using System;
using System.Text;

namespace bo.Text
{
    public class Utf162Utf8Processor : DefaultToUtf8Processor
    {
        public override Encoding GetOutputEncoding()
        {
            return Encoding.Unicode;
        }
    }
}
