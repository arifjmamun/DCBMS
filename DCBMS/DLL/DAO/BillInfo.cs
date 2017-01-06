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
        public string BillDate { get; private set; }
        public List<TestInfo> TestList { get; private set; }

        public BillInfo(List<TestInfo> testList) 
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
                BillDate = DateTime.Now.ToString("yyyy-MM-dd");
                TestList = testList;
            }
        }

        private string GenerateBillId()
        {
            TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();
            return  testRequestEntryHelper.GetBillId();
        }
    }
}