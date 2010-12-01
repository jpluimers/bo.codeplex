using System;
using System.IO;

namespace bo.Xml.SqlClient
{
    class ExportXmlFromDb_Program : bo.ConsoleProgram
    {
        protected void help()
        {
            log("Syntax: {0} connectionStringFileName sqlQueryFileName xmlOutputFileName [xmlEncoding]",
                ExecutableName);
            log("where xmlEncoding is for instance windows-1252");
        }

        protected override int logic(string[] args)
        {
            if (3 > args.Length)
            {
                help();
                return -1;
            }
            else
            {
                if (3 == args.Length)
                    bo.Xml.SqlClient.XmlDataExport.ExportXml(new FileInfo(args[0]), args[1], args[2]);
                else
                    bo.Xml.SqlClient.XmlDataExport.ExportXml(new FileInfo(args[0]), args[1], args[2], args[3]);
                return 0;
            }
        }

        static void Main(string[] args)
        {
#if DEBUG
            new ExportXmlFromDb_Program().debugMain(args);
#else
            new ExportXmlFromDb_Program().regularMain(args);
#endif
        }
    }
}