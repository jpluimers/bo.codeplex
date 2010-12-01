using System;
using System.IO;
using System.Xml;

namespace bo.Xml
{

    public class XmlDataExport
    {

        public static XmlWriter CreateXmlWriter(StreamWriter xmlOutputWriter)
        {
            System.Xml.XmlTextWriter xmlWriter = new System.Xml.XmlTextWriter(xmlOutputWriter);
            // for those environments that don't understand the XML all on one line:
            xmlWriter.Formatting = Formatting.Indented;
            xmlWriter.Indentation = 0;

            return xmlWriter;
        }

        public static void ExportXml(XmlReader xmlReader, XmlWriter xmlWriter)
        {
            while (xmlReader.Read())
            {
                xmlWriter.WriteNode(xmlReader, true);
            }
        }

        public static void ExportXml(XmlReader xmlReader, string xmlOutputFileName)
        {
            using (StreamWriter xmlOutputWriter = File.CreateText(xmlOutputFileName))
            {
                System.Xml.XmlWriter xmlWriter = CreateXmlWriter(xmlOutputWriter);

                ExportXml(xmlReader, xmlWriter);
            }
        }

    }

}