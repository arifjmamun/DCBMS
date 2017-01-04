using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    public class TestDao
    {
        public string TestName { get; set; }
        public decimal TestFee { get; private set; }
        public string TestTypeName { get; set; }

        public TestDao(string testName, decimal testFee, string testTypeName)
        {
            TestName = testName;
            TestFee = testFee;
            TestTypeName = testTypeName;
        }

    }
}