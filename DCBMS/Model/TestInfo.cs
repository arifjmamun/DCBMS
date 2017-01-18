using System;
using DCBMS.BLL;

namespace DCBMS.Model
{
    [Serializable]
    public class TestInfo
    {
        public int TestSerial { get; set; }
        public string TestName { get; set; }
        public decimal TestFee { get;  set; }
        public string TestTypeName { get; set; }
        public string TestDate { get; set; }

        public TestInfo(string testName, decimal testFee):this(testName)
        {
            TestFee = testFee;
            TestDate = DateTime.Now.ToString("yyyy-MM-dd");
        }
        public TestInfo(string testName):this()
        {
            TestName = testName;
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            TestTypeName = testRequestEntryHelper.GetTestTypeName(TestName);
        }

        public TestInfo()
        {

        }
    }
}