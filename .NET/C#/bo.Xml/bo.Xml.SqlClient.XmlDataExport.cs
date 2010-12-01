using System;
using System.Data.SqlClient;
using System.IO;
using System.Xml;

namespace bo.Xml.SqlClient
{
    public class XmlDataExport : bo.Xml.XmlDataExport
    {
        public static readonly string xmlEncodingDefault = "";

        public static void ExportXml(SqlCommand command, string xmlOutputFileName)
        {
            XmlReader xmlReader = command.ExecuteXmlReader();

            ExportXml(xmlReader, xmlOutputFileName);
        }

        public static void ExportXml(SqlConnection connection, string sqlQueryString, string xmlOutputFileName, string xmlEncoding)
        {
            SqlCommand command = new SqlCommand(sqlQueryString, connection);
            command.CommandTimeout = connection.ConnectionTimeout;

            if (xmlEncodingDefault == xmlEncoding)
            {
                ExportXml(command, xmlOutputFileName);
                return;
            }

            string tempFileNameWithUnicodeXml = Path.GetTempFileName();
            try
            {
                ExportXml(command, tempFileNameWithUnicodeXml);

                bo.Xml.XmlTranscoder.ConvertXmlFileToNewEncoding(tempFileNameWithUnicodeXml, xmlOutputFileName, xmlEncoding);
            }
            finally
            {
                File.Delete(tempFileNameWithUnicodeXml);
            }
        }

        public static void ExportXml(SqlConnection connection, string sqlQueryString, string xmlOutputFileName)
        {
            ExportXml(connection, sqlQueryString, xmlOutputFileName, xmlEncodingDefault);
        }

        public static void ExportXml(string connectionString, string sqlQueryFileName, string xmlOutputFileName, int connectionTimeoutSeconds)
        {
            ExportXml(connectionString, sqlQueryFileName, xmlOutputFileName, connectionTimeoutSeconds, xmlEncodingDefault);
        }

        public static void ExportXml(string connectionString, string sqlQueryFileName, string xmlOutputFileName, int connectionTimeoutSeconds, string xmlEncoding)
        {
            SqlConnectionStringBuilder connectionStringBuilder = new SqlConnectionStringBuilder(connectionString);
            if (connectionTimeoutSeconds > 0)
                connectionStringBuilder.ConnectTimeout = connectionTimeoutSeconds;
            string builtConnectionString = connectionStringBuilder.ConnectionString;
            using (SqlConnection connection = new SqlConnection(builtConnectionString))
            {
                connection.Open();

                using (StreamReader sqlQueryReader = File.OpenText(sqlQueryFileName))
                {
                    string sqlQueryString = sqlQueryReader.ReadToEnd();
                    try
                    {
                        ExportXml(connection, sqlQueryString, xmlOutputFileName, xmlEncoding);
                    }
                    catch (System.Reflection.TargetInvocationException error)
                    {
                        if (null != error.InnerException)
                            if (error.InnerException is System.Data.SqlTypes.SqlNullValueException)
                            {
                                // no data to be exported
                                return;
                            }
                            else
                                throw;
                        else
                            throw;
                    }
                }
            }
        }

        public static void ExportXml(string connectionString, string sqlQueryFileName, string xmlOutputFileName)
        {
            ExportXml(connectionString, sqlQueryFileName, xmlOutputFileName, xmlEncodingDefault);
        }

        public static void ExportXml(string connectionString, string sqlQueryFileName, string xmlOutputFileName, string xmlEncoding)
        {
            int defaultConnectionTimeOutSeconds = -1;
            ExportXml(connectionString, sqlQueryFileName, xmlOutputFileName, defaultConnectionTimeOutSeconds, xmlEncoding);
        }

        public static void ExportXml(FileInfo connectionStringFile, string sqlQueryFileName, string xmlOutputFileName)
        {
            ExportXml(connectionStringFile, sqlQueryFileName, xmlOutputFileName, xmlEncodingDefault);
        }

        public static void ExportXml(FileInfo connectionStringFile, string sqlQueryFileName, string xmlOutputFileName, string xmlEncoding)
        {
            using (StreamReader connectionStringReader = File.OpenText(connectionStringFile.FullName))
            {
                string connectionString = connectionStringReader.ReadToEnd();
                ExportXml(connectionString, sqlQueryFileName, xmlOutputFileName, xmlEncoding);
            }
        }

    }
}