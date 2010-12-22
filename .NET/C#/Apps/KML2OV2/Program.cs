using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using bo.Xml;
//using schemas.opengis.net.kml.version_2_2_0;
//using bo.POI.KML;
using bo.POI.KML.atom;

namespace KML2OV2
{
    class Program : bo.ConsoleProgram
    {
        private int help()
        {
            log("Syntax: {0} compressedFileName uncompressedFileName",
                this.ExecutableName
            );
            return DefaultExitCode;
        }

        protected override int logic(string kmlFileName)
        {
            Console.WriteLine(kmlFileName);

            string kmlXml = System.IO.File.ReadAllText(kmlFileName);

            //schemas.opengis.net.kml.version_2_2_0.KmlType
            /// Old import using XSD.EXE:
            //KmlType kml = XmlConvert.FromXml<KmlType>(kmlXml);
            //AbstractFeatureType feature = kml.Item;
            /// New import using Xsd2Code
            //KmlType kml = KmlType.LoadFromFile(kmlFileName);
            //AbstractFeatureType feature = kml.Item;
            atomPersonConstruct atomPersonConstruct = new atomPersonConstruct();
            atomPersonConstruct.SaveToFile(@"..\..\atomfile.xml");

            return DefaultExitCode;
            //using (Stream inputStream = File.OpenRead(compressedFileName))
            //{
            //    using (Stream outputStream = File.Create(uncompressedFileName))
            //    {
            //        log("GUnzipping...");
            //        StreamGZipCompressorHelper.Decompress(inputStream, outputStream);
            //        log("Done!");
            //    }
            //}
        }

        private int logic(string kmlFileName, string ov2FileName)
        {
            return DefaultExitCode;
            //using (Stream inputStream = File.OpenRead(compressedFileName))
            //{
            //    using (Stream outputStream = File.Create(uncompressedFileName))
            //    {
            //        log("GUnzipping...");
            //        StreamGZipCompressorHelper.Decompress(inputStream, outputStream);
            //        log("Done!");
            //    }
            //}
        }

        //protected override int logic(string[] args)
        //{
        //    switch (args.Length)
        //    {
        //        case 0:
        //            return help();
        //        case 1:
        //            return logic(args[0]);
        //        default:
        //            return logic(args[0], args[1]);
        //    }
        //}

        static int Main(string[] args)
        {
#if DEBUG
            args = new string[] { @"..\..\kpn-hotspots.kml.xml" }; // { "foo", "bar" };
            return DebugMain<Program>(args);
#else
            return RegularMain<Program>(args);
#endif
        }
    }
}
