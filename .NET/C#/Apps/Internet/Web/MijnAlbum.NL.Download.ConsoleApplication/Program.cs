using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MijnAlbum.NL.Download.ConsoleApplication
{
    class Program : MijnAlbumNl
    {

        static void Main(string[] args)
        {
            bool dumpHtml = false;
            bool dumpGroups = false;

            // http://www.mijnalbum.nl/Album=TYEGMIMD
            const string AlbumID = "TYEGMIMD";

            if (0 == args.Length)
                args = new string[] { AlbumID };

            foreach (string arg in args)
            {
                Console.WriteLine("Thumbnail URL for Album {0}", arg);
                string url = GetThumbnailsUrl(arg);
                Console.WriteLine(url);

                List<string> photoIds = GetPhotoIds(dumpHtml, dumpGroups, arg);
                Console.WriteLine("Photo URLs for Album {0}", arg);
                foreach (string photoId in photoIds)
                {
                    string bigJpegUrl = GetBigJpegUrl(photoId);
                    Console.WriteLine(bigJpegUrl);
                }
            }

            Console.Write("Press <Enter>");
            Console.ReadLine();
        }

        private static List<string> GetPhotoIds(bool dumpHtml, bool dumpGroups, string arg)
        {
            string html = DownloadThumbnailsHtml(arg);

            if (dumpHtml)
                Console.WriteLine(html);

            // when it is not proper XHtml:
            // http://stackoverflow.com/questions/100358/looking-for-c-html-parser
            // http://stackoverflow.com/questions/5359805/problem-while-parsing-html-xml-and-quering-with-xpath
            //for element in htmltree.xpath("body/table/tr/td[@class='thumbfoto']"):
            //System.Xml.XmlDocument xmlDocument = new System.Xml.XmlDocument();
            // alas: the html is not valid XML, so work around it with plain searches
            //xmlDocument.LoadXml(html);
            //xmlDocument.SelectNodes("");
            //          string total = xmlDocument.SelectSingleNode("Surveys/Survey[@name='Beer']/cellName[@name='MatureBlueCollarMen']").Attributes.GetNamedItem("total").Value;

            List<string> photoIds = getPhotoIds(dumpGroups, html);
            return photoIds;
        }

    }
}
