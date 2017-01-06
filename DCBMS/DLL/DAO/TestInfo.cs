using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCBMS.Middleware;

namespace DCBMS.DLL.DAO
{
    [Serializable]
    public class TestInfo
    {
        public int TestSerial { get; set; }
        public string TestName { get; set; }
        public decimal TestFee { get; private  set; }
        public string TestTypeName { get; set; }

        public TestInfo(string testName, decimal testFee):this(testName)
        {
            TestFee = testFee;
        }
        public TestInfo(string testName)
        {
            TestName = testName;
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            TestTypeName = testRequestEntryHelper.GetTestTypeName(TestName);
        }
    }
}