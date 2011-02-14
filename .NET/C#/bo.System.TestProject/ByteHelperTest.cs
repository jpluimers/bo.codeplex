using bo.System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace bo.System.TestProject
{
    
    /// <summary>
    ///This is a test class for ByteHelperTest and is intended
    ///to contain all ByteHelperTest Unit Tests
    ///</summary>
    [TestClass()]
    public class ByteHelperTest
    {

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for CLO
        ///</summary>
        [TestMethod()]
        public void CLOTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLO
        ///</summary>
        [TestMethod()]
        public void CLOTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLO
        ///</summary>
        [TestMethod()]
        public void CLOTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLO_Loop
        ///</summary>
        [TestMethod()]
        public void CLO_LoopTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLO_Loop
        ///</summary>
        [TestMethod()]
        public void CLO_LoopTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLO_Loop
        ///</summary>
        [TestMethod()]
        public void CLO_LoopTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ
        ///</summary>
        [TestMethod()]
        public void CLZTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ
        ///</summary>
        [TestMethod()]
        public void CLZTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ
        ///</summary>
        [TestMethod()]
        public void CLZTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZTable
        ///</summary>
        [TestMethod()]
        public void CLZTableTest()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZTable(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ_Loop
        ///</summary>
        [TestMethod()]
        public void CLZ_LoopTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ_Loop
        ///</summary>
        [TestMethod()]
        public void CLZ_LoopTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CLZ_Loop
        ///</summary>
        [TestMethod()]
        public void CLZ_LoopTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CLZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO
        ///</summary>
        [TestMethod()]
        public void CTOTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO
        ///</summary>
        [TestMethod()]
        public void CTOTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO
        ///</summary>
        [TestMethod()]
        public void CTOTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO_Loop
        ///</summary>
        [TestMethod()]
        public void CTO_LoopTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO_Loop
        ///</summary>
        [TestMethod()]
        public void CTO_LoopTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTO_Loop
        ///</summary>
        [TestMethod()]
        public void CTO_LoopTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTO_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ
        ///</summary>
        [TestMethod()]
        public void CTZTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ
        ///</summary>
        [TestMethod()]
        public void CTZTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ
        ///</summary>
        [TestMethod()]
        public void CTZTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZTable
        ///</summary>
        [TestMethod()]
        public void CTZTableTest()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZTable(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ_Loop
        ///</summary>
        [TestMethod()]
        public void CTZ_LoopTest()
        {
            uint value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ_Loop
        ///</summary>
        [TestMethod()]
        public void CTZ_LoopTest1()
        {
            ushort value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CTZ_Loop
        ///</summary>
        [TestMethod()]
        public void CTZ_LoopTest2()
        {
            byte value = 0; // TODO: Initialize to an appropriate value
            byte expected = 0; // TODO: Initialize to an appropriate value
            byte actual;
            actual = ByteHelper.CTZ_Loop(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
