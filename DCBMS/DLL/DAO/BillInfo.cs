using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    public class BillInfo
    {
        public string BillId { get; set; }
        public decimal TotalAmount { get; private set; }
        public decimal PaidAmount { get; private set; }
        public decimal DueAmount { get; private set; }
        public string BillDate { get; set; }
        public List<TestInfo> TestList { get; set; }
    }
}