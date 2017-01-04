using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCBMS.DLL.Gateway;

namespace DCBMS.Middleware
{
    public class TestHelper
    {
        CommonGateway commonGateway = new CommonGateway();
        TestGateway testGateway = new TestGateway();
        public List<string> GetAllTestType()
        {
            return commonGateway.GetAllTestType();
        }
    }
}