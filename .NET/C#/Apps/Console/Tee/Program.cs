using System;
using System.IO;
using System.Collections.Generic;
// Sends standard input to standard output and to all files in command line.
// C# implementation april 4th, 2010 by Jeroen Wiert Pluimers (http://wiert.wordpress.com),
// based on tee Chip Camden, Camden Software Consulting, November 2005
// 	... and Anonymous Cowards everywhere!
//
// TEE [-a | --append] [-i | --ignore] [--help | /?] [-f] [file1] [...]
//    Example:
// 	tee --append file0.txt -f --help file2.txt
//    will append to file0.txt, --help, and file2.txt
//
// -a | --append	Appends files instead of overwriting
// 			  (setting is per tee instance)
// -f | --flush 	Flushes files every CRLF or every 4096 bytes
// 			  (setting is per tee instance)
// -i | --ignore	Ignore cancel Ctrl+C keypress: see UnixUtils tee
// /? | --help		Displays this message and immediately quits
// -f			Stop recognizing flags, force all following filenames literally
//
// Duplicate filenames are quietly ignored.
// Press Ctrl+Z (End of File character) then Enter to abort.
namespace Tee
{
    class Program
    {
        static void help()
        {
            Console.Error.WriteLine("Sends standard input to standard output and to all files in command line.");
            Console.Error.WriteLine("C# implementation april 4th, 2010 by Jeroen Wiert Pluimers (http://wiert.wordpress.com),");
            Console.Error.WriteLine("Chip Camden, Camden Software Consulting, November 2005");
            Console.Error.WriteLine("	... and Anonymous Cowards everywhere!");
            Console.Error.WriteLine("http://www.camdensoftware.com");
            Console.Error.WriteLine("http://chipstips.com/?tag=cpptee");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("tee [-a | --append] [-i | --ignore] [--help | /?] [-f] [file1] [...]");
            Console.Error.WriteLine("   Example:");
            Console.Error.WriteLine(" tee --append file0.txt -f --help file2.txt");
            Console.Error.WriteLine("   will append to file0.txt, --help, and file2.txt");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("-a | --append    Appends files instead of overwriting");
            Console.Error.WriteLine("                 (setting is per tee instance)");
            Console.Error.WriteLine("-f | --flush 	Flushes files every CRLF or every 4096 bytes");
            Console.Error.WriteLine("                 (setting is per tee instance)");
            Console.Error.WriteLine("-i | --ignore    Ignore cancel Ctrl+C keypress: see UnixUtils tee");
            Console.Error.WriteLine("/? | --help      Displays this message and immediately quits");
            Console.Error.WriteLine("-f               Stop recognizing flags, force all following filenames literally");
            Console.Error.WriteLine("");
            Console.Error.WriteLine("Duplicate filenames are quietly ignored.");
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

        static int Main(string[] args)
        {
            try
            {
                bool appendToFiles = false;
                bool flushFiles = false;
                bool stopInterpretingFlags = false;
                bool ignoreCtrlC = false;

                foreach (string arg in args)
                {
                    //Since we're already parsing.... might as well check for flags:
                    if (stopInterpretingFlags)  //Stop interpreting flags, assume is filename
                    {
                        addFilename(arg);
                    }
                    else if (arg.Equals("/?") || arg.Equals("-h") || arg.Equals("--help"))
                    {
                        help();
                        return 1; //Quit immediately
                    }
                    else if (arg.Equals("-a") || arg.Equals("--append"))
                    {
                        appendToFiles = true;
                    }
                    else if (arg.Equals("-f") || arg.Equals("--flush"))
                    {
                        flushFiles = true;
                    }
                    else if (arg.Equals("-i") || arg.Equals("--ignore"))
                    {
                        ignoreCtrlC = true;
                    }
                    else if (arg.Equals("-f"))
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
                    Console.CancelKeyPress += new ConsoleCancelEventHandler(OnCancelKeyPressed);

                List<BinaryWriter> binaryWriters = new List<BinaryWriter>(filenames.Count); //Add only as many streams as there are distinct files
                try
                {
                    foreach (String filename in filenames)
                    {
                        FileStream fileStream = new FileStream(filename,
                            appendToFiles ? FileMode.Create : FileMode.OpenOrCreate,
                            FileAccess.Write,
                            FileShare.Read);
                        /* appendToFiles ?
                        File.AppendText(filename).BaseStream :
                        File.Create(filename)
                        */
                        binaryWriters.Add(new BinaryWriter(fileStream));  // Open the files specified as arguments
                    }
                    using (BinaryReader stdin = new BinaryReader(Console.OpenStandardInput()))
                    {
                        using (BinaryWriter stdout = new BinaryWriter(Console.OpenStandardOutput()))
                        {
                            Byte b;
                            Byte previous = 0;
                            Int64 index = 0;
                            while (true)
                            {
                                try
                                {
                                    b = stdin.ReadByte();  // Read standard in
                                }
                                catch (EndOfStreamException)
                                {
                                    break;
                                }
                                // The actual tee:
                                stdout.Write(b); // Write standard out
                                bool isCRLF = (previous == 13) && (b == 10);
                                previous = b;
                                foreach (BinaryWriter binaryWriter in binaryWriters)
                                {
                                    binaryWriter.Write(b); // Write to each file
                                    index++;
                                    if (flushFiles)
                                        if ((isCRLF) || (0 == index % 4096))
                                            binaryWriter.Flush();
                                }
                            }
                        }
                    }
                }
                finally
                {
                    foreach (BinaryWriter binaryWriter in binaryWriters)
                    {
                        binaryWriter.Flush();  // Flush and close each file
                        binaryWriter.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(String.Concat("tee: ", ex.Message));  // Send error messages to stderr
            }

            return 0;
        }
    }
}
