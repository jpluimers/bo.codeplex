using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Schema;

namespace bo.Xml
{
    public class XmlReadEventArgs : EventArgs
    {
        public XmlReadEventArgs(XmlReader reader)
            : base()
        {
            this.reader = reader;
        }

        private XmlReader reader;
        public XmlReader Reader
        {
            get { return reader; }
        }
    }

    public class XmlValidationEventArgs : EventArgs
    {
        public XmlValidationEventArgs(XmlReader reader, System.Xml.Schema.ValidationEventArgs e)
            : base()
        {
            this.e = e;
            this.reader = reader;
        }

        private System.Xml.Schema.ValidationEventArgs e;
        public System.Xml.Schema.ValidationEventArgs E
        {
            get { return e; }
        }

        private XmlReader reader;
        public XmlReader Reader
        {
            get { return reader; }
        }
    }

    public delegate void XmlReadEventHandler(Object sender, XmlReadEventArgs e);
    public delegate void XmlValidationEventHandler(Object sender, XmlValidationEventArgs e);

    public class XmlValidator
    {
        public event XmlReadEventHandler XmlReadEventHandler;
        public event XmlValidationEventHandler XmlValidationEventHandler;

        public void ValidateXml(string xmlFileName, string xsdFileName)
        {
            ValidateXml(xmlFileName, new string[] { xsdFileName });
        }

        public void ValidateXml(string xmlFileName, string[] xsdFileNames)
        {
            List<FileStream> xsdFileStreamsToDispose = new List<FileStream>();

            try
            {

                XmlReaderSettings settings = new XmlReaderSettings();
                settings.ValidationType = ValidationType.Schema;

                foreach (string xsdFileName in xsdFileNames)
                {
                    // resolve the relative SchemaLocation of the included Xsd's using the
                    // base path of the xsdFileName
                    // see http://www.hanselman.com/blog/ValidatingXMLSchemasThatHaveBeenXsimportedAndHaveSchemaLocation.aspx
                    // Refactoring idee: in de toekomst oplossen met een resolver (die recursief werkt)
                    // see http://www.hanselman.com/blog/ValidatingThatXmlSchemasAndTheirImportsAreValidAndAllGoodWithAnXmlResolver.aspx

                    FileStream xsdFileStream = File.OpenRead(xsdFileName);
                    xsdFileStreamsToDispose.Add(xsdFileStream);
                    XmlSchema schema = XmlSchema.Read(
                        xsdFileStream,
                        null);

                    string baseDirectory = Path.GetDirectoryName(xsdFileName);
                    foreach (XmlSchemaInclude include in schema.Includes)
                    {
                        // if include.SchemaLocation is an absolute path, Path.Combine returns that,
                        // otherwise it appends the relative path to the baseDirectory
                        include.SchemaLocation = Path.Combine(baseDirectory, include.SchemaLocation);
                    }

                    settings.Schemas.Add(schema);
                }

                settings.ValidationEventHandler +=
                    new ValidationEventHandler(reader_ValidationEventHandler);

                using (FileStream xmlFile = File.OpenRead(xmlFileName))
                {
                    using (reader = XmlReader.Create(xmlFile, settings))
                    {
                        while (
                            reader.Read()
                        )
                        {
                            currentLine = GetCurrentNodeAsString(reader);
                            OnReadEventHandler();
                        }
                    }
                }
            }
            finally
            {
                foreach (IDisposable fileStream in xsdFileStreamsToDispose)
                {
                    fileStream.Dispose();
                }
            }
        }

        protected void OnReadEventHandler()
        {
            if (null != XmlReadEventHandler)
            {
                XmlReadEventHandler(this, new XmlReadEventArgs(reader));
            }
        }

        private XmlReader reader;
        private string currentLine;

        private void reader_ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            if (null != XmlValidationEventHandler)
            {
                XmlValidationEventHandler(this, new XmlValidationEventArgs(reader, e));
            }
        }

        private StringBuilder toString = null;

        public override string ToString()
        {
            return (null == toString) ? null : toString.ToString();
        }

        /// <summary>
        /// Hook this up to XmlValidationEventArgs if you want to fill ValidationResult
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void ValidationResultEventHandler(object sender, XmlValidationEventArgs e)
        {
            if (null == toString)
            {
                toString = new StringBuilder();
            }

            toString.AppendFormat("{0}: {1}", e.E.Severity.ToString(), e.E.Message);
            toString.AppendLine();

            if (!string.IsNullOrEmpty(currentLine))
                toString.AppendLine(currentLine);

            string line = GetCurrentNodeAsString(e.Reader);
            if (!string.IsNullOrEmpty(line))
                toString.AppendLine(line);
        }

        public string GetCurrentNodeAsString(XmlReader reader)
        {
            string result = "";
            switch (reader.NodeType)
            {
                case XmlNodeType.Element:
                    result = string.Format("<{0}>", reader.Name);
                    break;
                case XmlNodeType.Text:
                    result = reader.Value;
                    break;
                case XmlNodeType.CDATA:
                    result = string.Format("<![CDATA[{0}]]>", reader.Value);
                    break;
                case XmlNodeType.ProcessingInstruction:
                    result = string.Format("<?{0} {1}?>", reader.Name, reader.Value);
                    break;
                case XmlNodeType.Comment:
                    result = string.Format("<!--{0}-->", reader.Value);
                    break;
                case XmlNodeType.XmlDeclaration:
                    result = string.Format("<?{0} {1}?>", reader.Name, reader.Value);
                    break;
                case XmlNodeType.Document:
                    break;
                case XmlNodeType.DocumentType:
                    result = string.Format("<!DOCTYPE {0} [{1}]", reader.Name, reader.Value);
                    break;
                case XmlNodeType.EntityReference:
                    toString.Append(reader.Name);
                    break;
                case XmlNodeType.EndElement:
                    result = string.Format("</{0}>", reader.Name);
                    break;
                default:
                    break;
            }
            return result;
        }
    }
}