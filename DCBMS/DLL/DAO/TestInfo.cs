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

        public TestInfo(int testSerial, string testName, decimal testFee):this()
        {
            TestSerial = testSerial;
            TestName = testName;
            TestFee = testFee;
            
        }
        public TestInfo()
        {
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            TestTypeName = testRequestEntryHelper.GetTestTypeName(TestName);
        }
    }
}