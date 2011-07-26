using System;
using System.IO;

namespace bo.IO
{
    public class MemoryStreamHelper
    {
        /// <summary>
        /// Work around a 64Mb limit when writing streams to files.
        /// <seealso cref="http://groups.google.co.uk/group/microsoft.public.dotnet.framework/browse_thread/thread/ba3582b0a6e45517/03e8d3c8718a9c44"/>
        /// </summary>
        public static void WriteMemoryStreamToFile(string filename, MemoryStream memory)
        {
            //// old code:
            //using (Stream 
            //    file = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.ReadWrite),
            //    fileBuffer = new BufferedStream(file)
            //)
            //{
            //    byte[] memoryBuffer = memory.GetBuffer();
            //    int memoryLength = (int)memory.Length; 
            //    fileBuffer.Write(memoryBuffer, 0, memoryLength); //##jpl: drawback: works only up to 2 gigabyte!
            //    fileBuffer.Close();
            //    file.Close();
            //}

            using (System.IO.Stream file = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.ReadWrite))
            {
                using (Stream buffer = new System.IO.BufferedStream(file))
                {
                    byte[] memoryBuffer = memory.GetBuffer();
                    long memoryLength = memory.Length;
                    int index = 0;
                    // writing everything at once fails for writing memory streams larger than 64 megabyte 
                    // to a file stream on the network
                    //buffer.Write(memoryBuffer, 0, memoryLength);
                    // so we introduce a temporary buffer
                    const int copyBufferSize = 65536;
                    byte[] copyBuffer = new byte[copyBufferSize];
                    while (memoryLength > 0)
                    {
                        int actualLength;
                        if (memoryLength > copyBufferSize) 
                            actualLength = copyBufferSize;
                        else
                            actualLength = (int)memoryLength; //jpl: this cast is valid, as now memoryLength <= copyBufferSize
                        Array.Copy(memoryBuffer, index, copyBuffer, 0, actualLength);
                        buffer.Write(copyBuffer, 0, actualLength);
                        memoryLength = memoryLength - actualLength;
                        index = index + actualLength;
                    }
                    buffer.Flush();
                    buffer.Close();
                }
            }
        }
    }
}