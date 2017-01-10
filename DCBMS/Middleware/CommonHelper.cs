using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DCBMS.DLL.Gateway;

namespace DCBMS.Middleware
{
    public class CommonHelper
    {
        CommonGateway _gateway = new CommonGateway();

        public DataTable GetDataTestTable()
        {
            return _gateway.GetDataTestTable();
        }

    }
}