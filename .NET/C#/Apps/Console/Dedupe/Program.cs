using System;
using System.IO;
using System.Collections.Generic;

namespace DeDupe
{
    class Program
    {
        static void help()
        {
            Console.Error.WriteLine("DeDupe - Dedupes a file into unique lines (only the first occurance of a line is kept) standard output");
            Console.Error.WriteLine("Lines are terminated by CRLF sequences");
            Console.Error.WriteLine("C# implementation januari 5th, 2012 by Jeroen Wiert Pluimers (http://wiert.wordpress.com),");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("DeDupe [-i | --ignore] [-t | --trim] [-f | --flush] [-l | --literal] [-? | --h | --help | /?] [file0] [...]");
            Console.Error.WriteLine("   Example:");
            Console.Error.WriteLine(" DeDupe --trim file0.txt file1.txt");
            Console.Error.WriteLine("   Dedupes the appended content of file0.txt and file1.txt into standard output");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("-t | --trim                  Will trim the lines before considering duplicates");
            Console.Error.WriteLine("-f | --flush                 Flushes files every CRLF");
            Console.Error.WriteLine("                               (setting is per tee instance)");
            Console.Error.WriteLine("-i | --ignore                Ignore cancel Ctrl+C keypress: see UnixUtils tee");
            Console.Error.WriteLine("-l | --literal               Stop recognizing flags, force all following filenames literally");
            Console.Error.WriteLine("-? | --h  | /? | --help      Displays this message and immediately quits");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("Duplicate filenames are quietly ignored.");
            Console.Error.WriteLine("If no input filenames are specified, then standard input is used");
            Console.Error.WriteLine("Press Ctrl+Z (End of File character) then Enter to abort.");
        }

        static void OnCancelKeyPressed(Object sender, ConsoleCancelEventArgs args)
        {
            // Set the Cancel property to true to prevent the process from
            // terminating.
            args.Cancel = true;
        }

        static List<String> filenames = new List<String>();

        static void addFilename(string value)
        {
            if (-1 == filenames.IndexOf(value))
                filenames.Add(value);
        }

        static bool trimLines = false;
        static bool flushFiles = false;
        static bool stopInterpretingFlags = false;
        static bool ignoreCtrlC = false;

        static int Main(string[] args)
        {
            try
            {

                foreach (string arg in args)
                {
                    //Since we're already parsing.... might as well check for flags:
                    if (stopInterpretingFlags)  //Stop interpreting flags, assume is filename
                    {
                        addFilename(arg);
                    }
                    else if (arg.Equals("/?") || arg.Equals("-?") || arg.Equals("-h") || arg.Equals("--help"))
                    {
                        help();
                        return 1; //Quit immediately
                    }
                    else if (arg.Equals("-t") || arg.Equals("--trim"))
                    {
                        trimLines = true;
                    }
                    else if (arg.Equals("-f") || arg.Equals("--flush"))
                    {
                        flushFiles = true;
                    }
                    else if (arg.Equals("-i") || arg.Equals("--ignore"))
                    {
                        ignoreCtrlC = true;
                    }
                    else if (arg.Equals("-l") || arg.Equals("--literal"))
                    {
                        stopInterpretingFlags = true;
                    }
                    else
                    {	//If it isn't any of the above, it's a filename
                        addFilename(arg);
                    }
                    //Add more flags as necessary, just remember to SKIP adding them to the file processing stream!
                }

                if (ignoreCtrlC) //Implement the Ctrl+C fix selectively (mirror UnixUtils tee behavior)
                    Console.CancelKeyPress += OnCancelKeyPressed;

                HashSet<string> keys = new HashSet<string>();
                Int64 index = 0;

                using (StreamWriter writer = new StreamWriter(Console.OpenStandardOutput()))
                {
                    if (filenames.Count == 0)
                        using (StreamReader reader = new StreamReader(Console.OpenStandardInput()))
                        {
                            processInputFileReader(keys, writer, reader, ref index);
                        }
                    else
                        foreach (String filename in filenames)
                        {
                            using (StreamReader reader = new StreamReader(filename))
                            {
                                processInputFileReader(keys, writer, reader, ref index);
                            }
                        }
                    writer.Flush();
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(String.Concat("DeDupe: ", ex.Message));  // Send error messages to stderr
            }

            return 0;
        }

        private static void processInputFileReader(HashSet<string> keys, StreamWriter writer, StreamReader reader, ref Int64 index)
        {
            string line = readLine(reader);
            while (!string.IsNullOrEmpty(line))
            {
                string candidate = line;
                if (keys.Add(candidate))
                {
                    writer.WriteLine(line);
                    index += line.Length + Environment.NewLine.Length;
                    if (flushFiles)
                        writer.Flush();
                }

                line = readLine(reader);
            }
        }

        private static string readLine(StreamReader reader)
        {
            string line = reader.ReadLine();
            if (null != line)
                if (trimLines)
                    line = line.Trim();
            return line;
        }
    }
}