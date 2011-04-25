using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Schema;

namespace bo.Xml
{
    public class XmlDumper
    {
        public void DumpXml(string[] xmlFileNames)
        {

            foreach (string xmlFileName in xmlFileNames)
            {
                DumpXml(xmlFileName);
            }

        }

        public void DumpXml(string xmlFileName)
        {
            using (FileStream xmlFile = File.OpenRead(xmlFileName))
            {
                using (XmlReader reader = XmlReader.Create(xmlFile))
                {
                    while (
                        reader.Read()
                    )
                    {
                        string currentNodeAsString = GetCurrentNodeAsString(reader);
                        if (!string.IsNullOrEmpty(currentNodeAsString))
                        {
                            if (null == toString)
                                toString = new StringBuilder();
                            toString.AppendLine(currentNodeAsString);
                        }
                    }
                }
            }
        }

        private StringBuilder toString = null;

        public override string ToString()
        {
            return (null == toString) ? null : toString.ToString();
        }

        private int charCount(char compareValue, string value)
        {
            int result = 0;
            foreach (System.Char item in value)
            {
                if (item == compareValue)
                    result++;
            }
            return result;
        }

        public string GetCurrentNodeAsString(XmlReader reader)
        {
            StringBuilder result = new StringBuilder();

            switch (reader.NodeType)
            {
                case XmlNodeType.Element:
                case XmlNodeType.Text:
                    AppendNodeTypeAndName(reader, result);
                    break;
                /*
                case XmlNodeType.Attribute:
                case XmlNodeType.CDATA:
                case XmlNodeType.Comment:
                case XmlNodeType.Document:
                case XmlNodeType.DocumentFragment:
                case XmlNodeType.DocumentType:
                case XmlNodeType.EndElement:
                case XmlNodeType.EndEntity:
                case XmlNodeType.Entity:
                case XmlNodeType.EntityReference:
                case XmlNodeType.None:
                case XmlNodeType.Notation:
                case XmlNodeType.ProcessingInstruction:
                case XmlNodeType.SignificantWhitespace:
                case XmlNodeType.Whitespace:
                case XmlNodeType.XmlDeclaration:
                 */
                default:
                    break;
            }

            switch (reader.NodeType)
            {
                case XmlNodeType.Text:
                    string value = reader.Value;
                    int lfCount = charCount('\n', value);
                    int crCount = charCount('\r', value);
                    result.AppendFormat(" Length={0} LF-Count={1} CR-Count={2}", value.Length, lfCount, crCount);
                    AppendValueOnNewLine(reader, result);
                    break;
                case XmlNodeType.CDATA:
                case XmlNodeType.ProcessingInstruction:
                case XmlNodeType.Comment:
                case XmlNodeType.DocumentType:
                    AppendValueOnNewLine(reader, result);
                    break;
                default:
                    break;
            }
            return result.ToString();
        }

        private static void AppendNodeTypeAndName(XmlReader reader, StringBuilder result)
        {
            result.AppendFormat("NodeType={0}, NodeName={1}", reader.NodeType, reader.Name);
        }

        private static void AppendValueOnNewLine(XmlReader reader, StringBuilder result)
        {
            result.AppendLine();
            result.Append(reader.Value);
        }
    }
}