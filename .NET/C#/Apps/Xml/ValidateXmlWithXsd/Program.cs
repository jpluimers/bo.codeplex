using System;
using bo.Xml;

namespace ValidateXmlWithXsd
{
    class Program
    {
        static void Main(string[] args)
        {
            if (2 != args.Length)
            {
                Console.WriteLine("use two parameters: XmlFile and XsdFile");
            }
            else
            {
                logic instance = new logic();
                try
                {
                    instance.Run(
                        args[0], args[1]
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
        public void Run(string xmlFileName, string xsdFileName)
        {
            bo.Xml.XmlValidator validator = new bo.Xml.XmlValidator();

            validator.XmlReadEventHandler += new bo.Xml.XmlReadEventHandler(validator_XmlReadEventHandler);
            validator.XmlValidationEventHandler += new bo.Xml.XmlValidationEventHandler(validator.ValidationResultEventHandler);
            validator.ValidateXml(xmlFileName, xsdFileName);
            string result = validator.ToString();
            if (string.IsNullOrEmpty(result))
            {
                result = "OK.";
            }
            Console.WriteLine(result);
        }

        void validator_XmlReadEventHandler(object sender, bo.Xml.XmlReadEventArgs e)
        {
            //if (reader.NodeType == XmlNodeType.Text)
            //    Console.WriteLine(reader.Value);
        }

    }

}
