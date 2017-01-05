using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCBMS.DLL.Gateway;

namespace DCBMS.Middleware
{
    public class TestRequestEntryHelper
    {
        TestRequestEntryGateway testRequestEntryGateway = new TestRequestEntryGateway();
        public List<string> GetAllTestName()
        {
            return testRequestEntryGateway.GetAllTestName();
        }

        public decimal GetTestFee(string testName)
        {
            return testRequestEntryGateway.GetTestFee(testName);
        }
    }
}