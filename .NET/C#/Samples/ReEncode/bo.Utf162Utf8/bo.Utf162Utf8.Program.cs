using System;
using bo.Text;

namespace bo.Utf162Utf8
{
    class Program : BaseReencoder
    {
        public override DefaultToDefaultProcessor CreateProcessor()
        {
            return new Windows1252ToUtf8Processor();
        }

        [STAThread]
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Run(args);
        }
    }
}
