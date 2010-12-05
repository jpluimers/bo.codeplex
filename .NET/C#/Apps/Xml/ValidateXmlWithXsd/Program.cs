using System;
using System.Xml;
using bo.Xml;

namespace ValidateXmlWithXsd
{
    class Program
    {
        static void Main(string[] args)
        {
            if (2 > args.Length)
            {
                Console.WriteLine("use two parameters: XmlFile and XsdFile");
            }
            else
            {
                logic instance = new logic();
                try
                {
                    bool debug = (args.Length > 2);
                    instance.Run(
                        args[0], args[1], debug
                    );
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }
    }

    class logic
    {
        public bool Debug { get; private set; }

        private XmlNodeType lastXmlNodeType { get; set; }
        private string lastValue { get; set; }

        public void Run(string xmlFileName, string xsdFileName, bool debug)
        {
            this.Debug = debug;

            bo.Xml.XmlValidator validator = new bo.Xml.XmlValidator();

            validator.XmlReadEventHandler += new bo.Xml.XmlReadEventHandler(validator_XmlReadEventHandler);
            validator.XmlValidationEventHandler += new bo.Xml.XmlValidationEventHandler(validator.ValidationResultEventHandler);
            validator.ValidateXml(xmlFileName, xsdFileName);
            string result = validator.ToString();
            if (string.IsNullOrEmpty(result))
            {
                result = "OK.";
            }
            else
            {
                if (Debug)
                {
                    Console.WriteLine("last node={0}: {1}", lastXmlNodeType, lastValue);
                }
            }
            Console.WriteLine(result);
        }

        void validator_XmlReadEventHandler(object sender, bo.Xml.XmlReadEventArgs e)
        {
            if (Debug)
            {
                if (e.Reader.NodeType == XmlNodeType.Text)
                    Console.WriteLine(e.Reader.Value);
                lastXmlNodeType = e.Reader.NodeType;
                lastValue = e.Reader.Value;
            }
        }

    }

}
