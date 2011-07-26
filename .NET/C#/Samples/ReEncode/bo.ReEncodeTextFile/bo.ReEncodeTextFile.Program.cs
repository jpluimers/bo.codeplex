using System;
using System.Text;
using bo.Text;

namespace bo.ReEncodeTextFile
{
    class Program : SpecificToSpecificReencoder
    {
        private static void ShowEncodings()
        {
            Console.WriteLine("Possible encodings in the form 'name (description)':");
            EncodingInfo[] encodings = Encoding.GetEncodings();
            int count = 0;
            foreach (EncodingInfo encodingInfo in encodings)
            {
                count++;
                Console.WriteLine("  {0} ({1})", encodingInfo.Name, encodingInfo.DisplayName);
            }
        }

        static void Help()
        {
            Console.WriteLine("Syntax: {0} source-encoding target-encoding source-filename target-filename",
                AssemblyHelper.ExecutableName);
            ShowEncodings();
        }

        [STAThread]
        static void Main(string[] args)
        {
            try
            {
                if (args.Length < 4)
                    Help();
                else
                {
                    Program program = new Program();
                    program.Run(args[0], args[1], args[2], args[3]);
                }

            }
            finally
            {
                Console.Write("Press <Enter>");
                Console.ReadLine();
            }
        }
    }
}
