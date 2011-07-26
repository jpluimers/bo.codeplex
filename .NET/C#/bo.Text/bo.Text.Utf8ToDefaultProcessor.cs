using System;
using System.Text;

namespace bo.Text
{

    public class Utf8ToDefaultProcessor: DefaultToDefaultProcessor
    {

        public override Encoding GetInputEncoding()
        {
            return Encoding.UTF8;
        }

    }

}
