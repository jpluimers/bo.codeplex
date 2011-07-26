using System;
using bo.Text;

namespace bo.Utf82Iso8859_1
{
    class Program : BaseReencoder
    {
        public override DefaultToDefaultProcessor CreateProcessor()
        {
            return new Utf8ToIso8859_1Processor();
        }

        [STAThread]
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Run(args);
        }
    }
}