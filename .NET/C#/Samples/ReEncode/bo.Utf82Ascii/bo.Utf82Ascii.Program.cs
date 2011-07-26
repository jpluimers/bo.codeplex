using System;
using System.IO;
using bo.Text;

namespace bo.utf82ascii
{
    class Program : BaseReencoder
    {
        public override DefaultToDefaultProcessor CreateProcessor()
        {
            return new Utf8ToAsciiProcessor();
        }

        [STAThread]
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Run(args);
        }
    }
}