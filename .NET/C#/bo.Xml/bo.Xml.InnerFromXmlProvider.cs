using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

using bo.Logging;

namespace bo.Xml
{
    class InnerFromXmlProvider
    {
        public static object InnerFromXml(string xml, Type type,
            XmlNodeEventHandler UnknownNode, XmlElementEventHandler UnknownElement, XmlAttributeEventHandler UnknownAttribute,
            UnreferencedObjectEventHandler UnreferencedObject)
        {
            if (string.IsNullOrEmpty(xml))
                return null;
            if (null == type)
                return null;

            XmlSerializer xmlSerializer = new XmlSerializer(type);
            if (UnknownNode != null)
                xmlSerializer.UnknownNode += UnknownNode;
            if (UnknownAttribute != null)
                xmlSerializer.UnknownAttribute += UnknownAttribute;
            if (UnknownElement != null)
                xmlSerializer.UnknownElement += UnknownElement;
            //WriteStringToFile(xml, "synchroon-vanuit-PowerForms.xml");
            using (TextReader r = new StringReader(xml))
            {
                object result = xmlSerializer.Deserialize(r);
                return result;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="xml"></param>
        /// <param name="type"></param>
        /// <param name="logCallback">null does not do any logging at all</param>
        /// <returns></returns>
        public static object InnerFromXml(string xml, Type type, LogCallback logCallback)
        {
            if (string.IsNullOrEmpty(xml))
                return null;
            if (null == type)
                return null;
            InnerFromXmlProvider innerFromXmlProvider = new InnerFromXmlProvider(xml, type, logCallback);
            object result = innerFromXmlProvider.InnerFromXml();
            return result;
        }

        private InnerFromXmlProvider(string xml, Type type, LogCallback logCallback)
        {
            this.xml = xml;
            this.type = type;
            this.logCallback = logCallback;
        }

        private object InnerFromXml()
        {
            object result = InnerFromXml(xml, type, 
                new XmlNodeEventHandler(Deserializer_UnknownNode),
                new XmlElementEventHandler(Deserializer_UnknownElement),
                new XmlAttributeEventHandler(Deserializer_UnknownAttribute),
                new UnreferencedObjectEventHandler(Serializer_UnreferencedObject));
            return result;
        }

        private LogCallback logCallback;
        private string xml;
        private Type type;

        private void log(string logLine)
        {
            if (null != logCallback)
                logCallback(logLine);
        }

        private void log(string format, object arg0)
        {
            string logLine = string.Format(format, arg0);
            log(logLine);
        }

        private void log(string format, object arg0, object arg1)
        {
            string logLine = string.Format(format, arg0, arg1);
            log(logLine);
        }

        private void Deserializer_UnknownNode(object sender, XmlNodeEventArgs e)
        {
            if (e.Name == "xsi:schemaLocation")
            {
                // jpl: see http://www.w3.org/TR/xmlschema-1/#xsi_schemaLocation
                log("UnknownNode -- Skipping {0} hint attribute", e.Name);
                return;
            }
            log("Warning:");
            log("UnknownNode (Line, Position): ({0}, {1})", e.LineNumber, e.LinePosition);
            log("UnknownNode Name: {0}", e.Name);
            log("UnknownNode LocalName: {0}", e.LocalName);
            log("UnknownNode Namespace URI: {0}", e.NamespaceURI);
            log("UnknownNode Text: {0}", e.Text);

            XmlNodeType myNodeType = e.NodeType;
            log("UnknownNode NodeType: {0}", myNodeType);
            log("UnknownNode Classname: {0}", e.ObjectBeingDeserialized.ToString());
        }

        private void Deserializer_UnknownElement(object sender, XmlElementEventArgs e)
        {
            log("UnknownElement (Line, Position): ({0}, {1})", e.LineNumber, e.LinePosition);
            log("UnknownElement ExpectedElements: {0}", e.ExpectedElements);
            log("UnknownElement Name: {0}", e.Element.Name);
            log("UnknownElement LocalName: {0}", e.Element.LocalName);
            log("UnknownElement Namespace URI: {0}", e.Element.NamespaceURI);
            log("UnknownElement InnerXml: {0}", e.Element.InnerXml);
            log("UnknownElement Classname: {0}", e.ObjectBeingDeserialized.ToString());
        }

        private void Deserializer_UnknownAttribute(object sender, XmlAttributeEventArgs e)
        {
            if (e.Attr.Name == "xsi:schemaLocation")
            {
                // jpl: see http://www.w3.org/TR/xmlschema-1/#xsi_schemaLocation
                log("UnknownAttribute -- Skipping {0} hint attribute", e.Attr.Name);
                return;
            }
            log("Warning:");
            log("UnknownAttribute (Line, Position): ({0}, {1})", e.LineNumber, e.LinePosition);
            log("UnknownAttribute ExpectedAttributes: {0}", e.ExpectedAttributes);
            log("UnknownAttribute Name: {0}", e.Attr.Name);
            log("UnknownAttribute LocalName: {0}", e.Attr.LocalName);
            log("UnknownAttribute Namespace URI: {0}", e.Attr.NamespaceURI);
            log("UnknownAttribute InnerXml: {0}", e.Attr.InnerXml);
            log("UnknownAttribute Classname: {0}", e.ObjectBeingDeserialized.ToString());
        }

        private void Serializer_UnreferencedObject(object sender, UnreferencedObjectEventArgs e)
        {
            Console.WriteLine("UnreferencedObject ID: {0}", e.UnreferencedId);
            Console.WriteLine("UnreferencedObject UnreferencedObject: {0}", e.UnreferencedObject);
        }
    }
}
