using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    public class PatientInfo
    {
        public string PatientName { get; set; }
        public string BirthDate { get; set; }
        public string MobileNumber { get; set; }
        public BillInfo BillInfo { get; set; }
    }
}