using System;
using System.Diagnostics;
using System.Xml;

namespace bo.Xml
{

    public static class XmlNodeExtension
    {
        public static string GetNodeValue(this XmlNode xmlNode)
        {
            XmlNodeType nodeType = xmlNode.NodeType;

            switch (nodeType)
            {
                case XmlNodeType.Attribute:
                case XmlNodeType.Text:
                    return xmlNode.Value;
                case XmlNodeType.Element:
                    return xmlNode.InnerXml;
                default:
                    string assertMessage = string.Format("Invalid XmlNodeType '{0}' for GetNodeValue", nodeType);
                    Debug.Assert(false, assertMessage);
                    return "";
            }
        }
    }

}
