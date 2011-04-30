using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace MijnAlbum.NL.Download.ConsoleApplication
{

    // http://keeshink.blogspot.com/2008/09/fotos-downloaden-van-mijnalbumnl.html
    public class MijnAlbumNl
    {
        protected const string ThumbnailPrefix = "http://www.mijnalbum.nl/index.php?m=albumview&a=2&key=";
        protected const string BigJpegUrlMask = "http://www.mijnalbum.nl/GroteFoto-{0}.jpg";

        private static string DownloadString(string url)
        {
            var html = string.Empty;
            using (var webClient = new System.Net.WebClient())
            {
                html = webClient.DownloadString(url);
            }
            return html;
        }

        protected static string DownloadThumbnailsHtml(string AlbumID)
        {
            string url = GetThumbnailsUrl(AlbumID);
            string html = DownloadString(url);
            return html;
        }

        protected static string GetThumbnailsUrl(string AlbumID)
        {
            string url = ThumbnailPrefix + AlbumID;
            return url;
        }

        protected static List<string> getPhotoIds(bool dumpGroups, string html)
        {
            List<string> photoIds = new List<string>();
            /* find strings like these:
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-3ANGJPWW.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-6OKRE67M.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-4OSAXTJM.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-7MFJVO4F.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-YQ4BZ4AD.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-3LKQD6AG.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-O8RUL378.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-7TTFUUCG.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-L6SLLZHO.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-YLSWWFJI.jpg"));
            thumbs.push(new Array("http://www.mijnalbum.nl/MiniFoto-CFWOY8KK.jpg"));
                         * RegEx string:
            thumbs\.push\(new\ Array\("http://www.mijnalbum.nl/MiniFoto-(?<PhotoId>.*?)\.jpg"\)\);
                         */
            // With @, you only have to escape the double quotes with another double quote: http://weblogs.asp.net/lorenh/archive/2004/09/30/236134.aspx
            const string RegExPattern = @"thumbs\.push\(new\ Array\(""http://www.mijnalbum.nl/MiniFoto-(?<PhotoId>.*?)\.jpg\""\)\);";
            const string PhotoIdRegExCaptureGroupName = "PhotoId";
            //const string RegExReplacement = @"${PhotoId}";
            MatchCollection matchCollection = Regex.Matches(html, RegExPattern);
            // Matches uses lazy evaluation, so each match will be evaluated when it is accessed in the loop
            foreach (Match match in matchCollection)
            {
                Group positionIdGroup = match.Groups[PhotoIdRegExCaptureGroupName];
                if (dumpGroups)
                    Console.WriteLine(positionIdGroup.Value);
                photoIds.Add(positionIdGroup.Value);
            }
            return photoIds;
        }

        protected static string GetBigJpegUrl(string photoId)
        {
            string bigJpegUrl = string.Format(BigJpegUrlMask, photoId);
            return bigJpegUrl;
        }

    }

}
