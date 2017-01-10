using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    public class TestReport
    {
        public string Serial { get; set; }
        public string TestName { get; private set; }
        public int TotalTest { get; private set; }
        public decimal TotalAmount { get; private set; }

        public TestReport(string serial, string testName, int totalTest, decimal totalAmount)
        {
            Serial = serial;
            TestName = testName;
            TotalTest = totalTest;
            TotalAmount = totalAmount;
        }
    }
}