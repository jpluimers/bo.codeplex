using System;
using System.Text;

namespace bo.ShowEncodings
{
    class MainProgram
    {
        static void Main(string[] args)
        {
            ShowEncodings();
            Console.Write("Press <Enter>");
            Console.ReadLine();
        }

        private static void ShowEncodings()
        {
            Console.WriteLine("System.Text.Encoding.GetEncodings();");
            EncodingInfo[] encodings = Encoding.GetEncodings();
            int count = 0;
            foreach (EncodingInfo encodingInfo in encodings)
            {
                count++;
                Console.WriteLine("CodePage=0x{0:X4}({0}), Name={1}, DisplayName={2};",
                    encodingInfo.CodePage, encodingInfo.Name, encodingInfo.DisplayName);
            }
        }
    }
}