using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCBMS.Middleware;

namespace DCBMS.DLL.DAO
{
    [Serializable]
    public class BillInfo
    {
        public string BillId { get; set; }
        public decimal TotalAmount { get; private set; }
        public decimal PaidAmount { get; private set; }
        public decimal DueAmount { get; private set; }
        public string BillDate { get; set; }
        public List<TestInfo> TestList { get; set; }

        public BillInfo(List<TestInfo> testList) :this()
        {
            if (testList.Count > 0)
            {
                foreach (TestInfo newTest in testList)
                {
                    TotalAmount += newTest.TestFee;
                }
                DueAmount = TotalAmount;
                PaidAmount = 0;
                BillId = GenerateBillId();
            }
        }

        public BillInfo()
        {
            TestList = new List<TestInfo>();
        }

        private string GenerateBillId()
        {
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            return  testRequestEntryHelper.GetBillId();
        }
    }
}