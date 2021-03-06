﻿using System;
using System.Collections.Generic;
using DCBMS.BLL;

namespace DCBMS.Model
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

        // For Setting Value [Inserting Value to Database]
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

        // For Getting Value through the constructor
        public BillInfo(string billId, decimal totalAmount, decimal paidAmount, decimal dueAmount, string billDate, List<TestInfo> testList)
        {
            BillId = billId;
            TotalAmount = totalAmount;
            PaidAmount = paidAmount;
            DueAmount = dueAmount;
            BillDate = billDate;
            TestList = testList;
        }

        private string GenerateBillId()
        {
            TestRequestEntryManager testRequestEntryHelper = new TestRequestEntryManager();
            return  testRequestEntryHelper.GetBillId();
        }
    }
}