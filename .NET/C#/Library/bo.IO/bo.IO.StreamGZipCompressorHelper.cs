using System.IO;
using System.IO.Compression;

namespace bo.IO
{
    public class StreamGZipCompressorHelper: StreamHelper
    {
        public static void Compress(Stream inputStream, Stream outputStream)
        {
            using (GZipStream compressedStream = CreateCompressedStream(outputStream, CompressionMode.Compress))
            {
                Copy(inputStream, compressedStream);
            }
        }

        public static void Decompress(Stream inputStream, Stream outputStream)
        {
            using (GZipStream compressedStream = CreateCompressedStream(inputStream, CompressionMode.Decompress))
            {
                Copy(compressedStream, outputStream);
            }
        }

        protected static GZipStream CreateCompressedStream(Stream stream, CompressionMode compressionMode)
        {
            GZipStream result = new GZipStream(stream, compressionMode, true);
            return result;
        }
    }
}
