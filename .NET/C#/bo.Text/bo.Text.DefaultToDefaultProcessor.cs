using System;
using System.IO;
using System.Text;

namespace bo.Text
{

    public class DefaultToDefaultProcessor
    {

        public virtual void Process(Stream inputStream, Stream outputStream)
        {
            StreamReader inputStreamReader = CreateStreamReader(inputStream);
            StreamWriter outputStreamWriter = CreateStreamWriter(outputStream);
            Process(inputStreamReader, outputStreamWriter);
            outputStreamWriter.Flush();
        }

        public virtual void Process(StreamReader input, StreamWriter output)
        {
            string inputLine;
            inputLine = input.ReadLine();
            while (inputLine != null)
            {
                string outputLine;

                outputLine = ProcessLine(inputLine);
                output.WriteLine(outputLine);

                inputLine = input.ReadLine();
            }
        }

        public virtual string ProcessLine(string inputLine)
        {
            return inputLine;
        }

        public virtual StreamReader CreateStreamReader(Stream input)
        {
            return new StreamReader(input, GetInputEncoding());
        }

        public virtual StreamWriter CreateStreamWriter(Stream output)
        {
            return new StreamWriter(output, GetOutputEncoding());
        }

        public virtual Encoding GetInputEncoding()
        {
            return Encoding.Default;
        }

        public virtual Encoding GetOutputEncoding()
        {
            return Encoding.Default;
        }

    }

}
