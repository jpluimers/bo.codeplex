using System;
using System.Data;
using System.Data.Common;
using System.IO;

namespace bo.Xml.Data
{

    public class XmlDataExport : bo.Xml.XmlDataExport
    {

        public static void ExportXml(DbDataAdapter dataAdapter, string xmlOutputFileName)
        {
            using (StreamWriter xmlOutputWriter = File.CreateText(xmlOutputFileName))
            {
                System.Xml.XmlWriter xmlWriter = CreateXmlWriter(xmlOutputWriter);

                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                dataSet.WriteXml(xmlWriter);
            }
        }


    }

}