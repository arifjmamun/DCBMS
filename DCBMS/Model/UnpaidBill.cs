using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.Model
{
    [Serializable]
    public class UnpaidBill
    {
        public int Serial { get; set; }
        public string BillId { get; set; }
        public string ContactNumber { get; set; }
        public string PatientName { get; set; }
        public decimal BillAmount { get; set; }
    }
}