using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace bo.Xml
{
    public class XmlTranscoder
    {
        public static void ConvertXmlFileToNewEncoding(string sourceFileName, string destinationFileName, string encoding)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(sourceFileName);

            XmlDeclaration declaration = null;
            foreach (XmlNode node in doc.ChildNodes)
            {
                if (node is XmlDeclaration)
                {
                    declaration = (XmlDeclaration)node;
                }
            }
            if (null == declaration)
            {
                declaration = doc.CreateXmlDeclaration("1.0", null, null);
                doc.InsertBefore(declaration, doc.DocumentElement);
            }

            declaration.Encoding = encoding;
            declaration.Standalone = "yes";

            if (System.IO.File.Exists(destinationFileName))
            {
                System.IO.FileAttributes originalAttributes = System.IO.File.GetAttributes(destinationFileName);
                System.IO.FileAttributes readWriteAttribytes = originalAttributes & (~(System.IO.FileAttributes.ReadOnly));
                if (originalAttributes != readWriteAttribytes)
                {
                    System.IO.File.SetAttributes(destinationFileName, readWriteAttribytes);
                }
                System.IO.File.Delete(destinationFileName);
            }
            doc.Save(destinationFileName);
        }
    }
}