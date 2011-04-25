using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

using bo.Logging;

namespace bo.Xml
{

    public class XmlConvert
    {

        #region CastThroughXml

        public static object CastThroughXml(object source, Type targetType, LogCallback logCallback)
        {
            string xml = ToXml(source);
            object result = FromXml(xml, targetType, logCallback);
            return result;
        }

        public static TargetType CastThroughXml<TargetType>(object source)
        {
            TargetType result = CastThroughXml<TargetType>(source, null); // null logCallback does not do any logging at all
            return result;
        }

        public static TargetType CastThroughXml<TargetType>(object source, LogCallback logCallback)
        {
            TargetType result = (TargetType)CastThroughXml(source, typeof(TargetType), logCallback);
            return result;
        }

        #endregion

        #region FromXml

        public static object FromXml(string xml, Type type, LogCallback logCallback)
        {
            if (null == type)
                return null;
            try
            {
                return InnerFromXml(xml, type, logCallback);
            }
            catch (Exception)
            {
                return InnerFromXml(xml, type, logCallback);
            }
        }

        public static T FromXml<T>(string xml)
        {
            T result = FromXml<T>(xml, null); // null logCallback does no logging
            return result;
        }

        public static T FromXml<T>(string xml, LogCallback logCallback)
        {
            T result = (T)FromXml(xml, typeof(T), logCallback);
            return result;
        }

        public static T FromXml<T>(string xml,
            XmlNodeEventHandler UnknownNode, XmlElementEventHandler UnknownElement, XmlAttributeEventHandler UnknownAttribute,
            UnreferencedObjectEventHandler UnreferencedObject)
        {
            T result = (T)FromXml(xml, typeof(T), UnknownNode, UnknownElement, UnknownAttribute, UnreferencedObject);
            return result;
        }

        private static object FromXml(string xml, Type type,
            XmlNodeEventHandler UnknownNode, XmlElementEventHandler UnknownElement, XmlAttributeEventHandler UnknownAttribute,
            UnreferencedObjectEventHandler UnreferencedObject)
        {
            if (null == type)
                return null;
            try
            {
                return InnerFromXmlProvider.InnerFromXml(xml, type, UnknownNode, UnknownElement, UnknownAttribute, UnreferencedObject);
            }
            catch (Exception)
            {
                return InnerFromXmlProvider.InnerFromXml(xml, type, UnknownNode, UnknownElement, UnknownAttribute, UnreferencedObject);
            }
        }

        #endregion

        #region FromXmlElement

        public static object FromXmlElement(XmlElement xmlElement, Type type, LogCallback logCallback)
        {
            if (null == xmlElement)
                return null;
            if (null == type)
                return null;

            string xml = ToXml(xmlElement);
            object result = FromXml(xml, type, logCallback);
            return result;
        }

        public static T FromXmlElement<T>(XmlElement xmlElement)
        {
            T result = FromXmlElement<T>(xmlElement, null); // null logCallback does not do any logging at all
            return result;
        }

        public static T FromXmlElement<T>(XmlElement xmlElement, LogCallback logCallback)
        {
            T result = (T)FromXmlElement(xmlElement, typeof(T), logCallback);
            return result;
        }

        #endregion

        #region InnerFromXml


        private static object InnerFromXml(string xml, Type type, LogCallback logCallback)
        {
            return InnerFromXmlProvider.InnerFromXml(xml, type, logCallback);
        }

        #endregion

        #region ToXml

        public static string ToXml(object value)
        {
            if (null == value)
                return String.Empty;

            XmlSerializer s =
                new XmlSerializer(value.GetType());
            using (TextWriter w = new StringWriter())
            {
                s.Serialize(w, value);
                return w.ToString();
            }
        }

        #endregion
        
        #region ToXmlElement

        public static XmlElement ToXmlElement(object value)
        {
            if (null == value)
                return null;
            string xml = ToXml(value);
            return ToXmlElement(xml);
        }

        public static XmlElement ToXmlElement(string xml)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xml);
            return xmlDocument.DocumentElement;
        }

        #endregion

        #region ToXmlElements

        public static XmlElement[] ToXmlElements(object value)
        {
            if (null == value)
                return null;
            XmlElement xmlElement = ToXmlElement(value);
            XmlElement[] result = { xmlElement };
            return result;
        }

        #endregion

    }

}