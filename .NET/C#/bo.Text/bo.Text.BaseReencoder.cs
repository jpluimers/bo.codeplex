using System;
using System.IO;

namespace bo.Text
{
    public abstract class BaseReencoder : BaseTextProcessor
    {

        public abstract DefaultToDefaultProcessor CreateProcessor();

        public virtual void Run(string[] args)
        {
            Stream input;
            Stream output;

            if (args.Length > 0)
                input = GetInputStream(args[0]);
            else
                input = Console.OpenStandardInput();

            if (args.Length > 1)
                output = GetOutputStream(args[1]);
            else
                output = Console.OpenStandardOutput();

            try
            {
                Run(input, output);
            }
            finally
            {
                if (args.Length > 1)
                    output.Close();
                if (args.Length > 0)
                    input.Close();
            }
        }

        public virtual void Run(Stream input, Stream output)
        {
            DefaultToDefaultProcessor processor = CreateProcessor();
            Run(input, output, processor);
        }

        public virtual void Run(Stream input, Stream output, DefaultToDefaultProcessor processor)
        {
            processor.Process(input, output);
        }
    }
}