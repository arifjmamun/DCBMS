using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    public class TestInfo
    {
        public string TestSerial { get; set; }
        public string TestName { get; set; }
        public decimal TestFee { get; private  set; }
        public string TestTypeName { get; set; }
    }
}