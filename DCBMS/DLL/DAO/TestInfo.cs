using System;
using DCBMS.Middleware;

namespace DCBMS.DLL.DAO
{
    [Serializable]
    public class TestInfo
    {
        public int TestSerial { get; set; }
        public string TestName { get; private set; }
        public decimal TestFee { get; private  set; }
        public string TestTypeName { get; private set; }
        public string TestDate { get; private set; }

        public TestInfo(string testName, decimal testFee):this(testName)
        {
            TestFee = testFee;
            TestDate = DateTime.Now.ToString("yyyy-MM-dd");
        }
        public TestInfo(string testName)
        {
            TestName = testName;
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            TestTypeName = testRequestEntryHelper.GetTestTypeName(TestName);
        }
    }
}