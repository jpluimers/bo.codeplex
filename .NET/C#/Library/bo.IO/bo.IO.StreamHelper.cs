using System.IO;
using System.IO.Compression;

namespace bo.IO
{
    public class StreamHelper
    {
        #region sizes

        public const int Ki = 1024;
        public const int Mi = Ki * Ki;
        public const long Gi = Ki * Mi;
        public const long Ti = Ki * Gi;
        public const int DefaultFileStreamBufferSize = 64 * Ki; // 64 kibibyte buffer size; hex 0x10000; decimal 65536

        #endregion

        #region Copy

        public static void Copy(Stream inputStream, Stream outputStream)
        {
            Copy(inputStream, outputStream, DefaultFileStreamBufferSize);
        }

        public static void Copy(Stream inputStream, Stream outputStream, int copyBufferSize)
        {
            byte[] copyBuffer = new byte[copyBufferSize];
            while (true)
            {
                int numberOfBytesRead = inputStream.Read(copyBuffer, 0, copyBufferSize);
                if (0 == numberOfBytesRead)
                    return;
                outputStream.Write(copyBuffer, 0, numberOfBytesRead);
            }
        }

        private static void CopyThatFailsOnCompressedInputStreams(Stream inputStream, Stream outputStream, int copyBufferSize)
        {
            // sometimes, inputStream.Length will result in an UnsupportedException (especially when it is a compressed stream)
            long numberOfBytesToCopy = inputStream.Length;
            byte[] copyBuffer = new byte[copyBufferSize];
            while (numberOfBytesToCopy > 0)
            {
                int actualLength = (numberOfBytesToCopy > copyBufferSize) ?
                    copyBufferSize
                :
                    (int)numberOfBytesToCopy;
                inputStream.Read(copyBuffer, 0, actualLength);
                outputStream.Write(copyBuffer, 0, actualLength);
                numberOfBytesToCopy = (numberOfBytesToCopy - actualLength);
            }
        }

        #endregion

    }
}
