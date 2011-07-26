using System;
using bo.Text;

namespace bo.Utf82Windows1252
{
    class Program : BaseReencoder
    {
        public override DefaultToDefaultProcessor CreateProcessor()
        {
            return new Utf8ToWindows1252Processor();
        }

        [STAThread]
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Run(args);
        }
    }
}