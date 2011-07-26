using System;
using bo.Text;

namespace bo.Iso8859_12Utf8
{
    class Program : BaseReencoder
    {
        public override DefaultToDefaultProcessor CreateProcessor()
        {
            return new Iso8859_1ToUtf8Processor();
        }

        [STAThread]
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Run(args);
        }
    }
}
