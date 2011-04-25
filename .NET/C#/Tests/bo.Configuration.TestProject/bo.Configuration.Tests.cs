using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using bo.Extensions.StringExtensions;

namespace bo.Configuration.TestProject
{
    [TestClass]
    public class Tests
    {
        string appSettingsConfig = "AppSettings.config";

        private string completeAssertMessage(string value)
        {
            string result = "'{0}' then the inclusion of the config file '{1}' did not succeed; make sure you marked 'Copy to Output Directory' of '{1}' to 'Copy if newer' or 'Copy Always'".With(
                value, appSettingsConfig);
            return result;
        }

        [TestMethod]
        public void TestMethod_KeyToOverride()
        {
            string unexpectedValue = "Original";
            string expectedValue = "Overridden";
            string keyToOverrideValue = bo.Configuration.AppConfig.Entry("KeyToOverride");
            Assert.AreNotEqual(unexpectedValue, keyToOverrideValue, "When value is " + completeAssertMessage(unexpectedValue));
            Assert.AreEqual(expectedValue, keyToOverrideValue);
        }

        [TestMethod]
        public void TestMethod_KeyToNotOverride()
        {
            string expectedValue = "Standard";
            string keyToOverrideValue = bo.Configuration.AppConfig.Entry("KeyToNotOverride");
            Assert.AreEqual(expectedValue, keyToOverrideValue);
        }

        [TestMethod]
        public void TestMethod_KeyToBeAdded()
        {
            string expectedValue = "EntirelyNew";
            string keyToOverrideValue = bo.Configuration.AppConfig.Entry("KeyToBeAdded");
            Assert.AreEqual(expectedValue, keyToOverrideValue, "When value is not " + completeAssertMessage(expectedValue));
        }
    }
}
