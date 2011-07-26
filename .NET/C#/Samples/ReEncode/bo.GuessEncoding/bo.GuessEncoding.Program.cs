using System;
using System.IO;
using System.Text;

using bo.Text;
using bo.IO;

namespace bo.GuessEncoding
{
    class Program : BaseTextProcessor
    {
        static void Help()
        {
            Console.WriteLine("Syntax: {0} textFileName",
                AssemblyHelper.ExecutableName);
            Console.WriteLine("  checks if textFileName is valid UTF-8");
        }

        [STAThread]
        static void Main(string[] args)
        {
            try
            {
                if (args.Length < 1)
                    Help();
                else
                {
                    Program program = new Program();
                    using (Stream stream = Program.GetInputStream(args[0]))
                    {
                        bool validUtf8 = IsValidUtf8(stream);
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                Console.Write("Press <Enter>");
                Console.ReadLine();
            }
        }

        private static bool IsValidUtf8(Stream stream)
        {
            Decoder decoder = Encoding.UTF8.GetDecoder();
            int bufferSize = StreamHelper.DefaultFileStreamBufferSize;
            byte[] bytes = new byte[bufferSize];
            while (true)
            {
                int numberOfBytesRead = stream.Read(bytes, 0, bufferSize);
                if (0 == numberOfBytesRead)
                    return true;
                int charachterCount = decoder.GetCharCount(bytes, 0, numberOfBytesRead);
                char[] characters = new char[charachterCount];
                decoder.GetChars(bytes, 0, numberOfBytesRead, characters, 0, false);
            }
        }

        private static bool IsValidUtf8_A(Stream stream)
        {
            // see http://en.wikipedia.org/wiki/UTF-8
            /*
 binary	hex	decimal	notes
 00000000-01111111	00-7F	0-127	US-ASCII (single byte)
 10000000-10111111	80-BF	128-191	Second, third, or fourth byte of a multi-byte sequence
*11000000-11000001	C0-C1	192-193	Overlong encoding: start of a 2-byte sequence, but code point <= 127
 11000010-11011111	C2-DF	194-223	Start of 2-byte sequence
 11100000-11101111	E0-EF	224-239	Start of 3-byte sequence
 11110000-11110100	F0-F4	240-244	Start of 4-byte sequence
*11110101-11110111	F5-F7	245-247	Restricted by RFC 3629: start of 4-byte sequence for codepoint above 10FFFF
*11111000-11111011	F8-FB	248-251	Restricted by RFC 3629: start of 5-byte sequence
*11111100-11111101	FC-FD	252-253	Restricted by RFC 3629: start of 6-byte sequence
*11111110-11111111	FE-FF	254-255	Invalid: not defined by original UTF-8 specification
             */
            byte[] buffer = new byte[1];
            int bufferLength = buffer.Length;
            int readLength = stream.Read(buffer, 0, bufferLength);
            long position = -1;
            byte buffer0 = 0;
            byte buffer1 = 0;
            byte buffer2 = 0;
            byte buffer3 = 0;
            byte buffer4 = 0;
            while (readLength == bufferLength)
            {
                position++;
                buffer4 = buffer3;
                buffer3 = buffer2;
                buffer2 = buffer1;
                buffer1 = buffer0;
                buffer0 = buffer[0];

                byte a2CharLeadByteMask = 0xC0; // note that 0xC0 and 0xC1 are invalid though!
                byte a3CharLeadByteMask = 0xE0;
                byte a4CharLeadByteMask = 0xE0;

                bool isAlwaysInvalid = (buffer0 == 0xC0) || (buffer0 == 0xC1) || ((buffer0 >= 0xF5) && (buffer0 <= 0xFF));
                if (isAlwaysInvalid)
                    return false;

                bool isBuffer1A2CharLeadByte = (buffer1 & a2CharLeadByteMask) == a2CharLeadByteMask;
                bool isBuffer2A3CharLeadByte = (buffer2 & a3CharLeadByteMask) == a3CharLeadByteMask;
                bool isBuffer3A4CharLeadByte = (buffer3 & a4CharLeadByteMask) == a4CharLeadByteMask;

                bool isValidASCII = buffer0 < 128;

                if (!isValidASCII)
                {
                    return false;
                }
                readLength = stream.Read(buffer, 0, bufferLength);
            }
            return true;
        }

    }
}
