﻿
using System.Data;

using DCBMS.DAL;


namespace DCBMS.BLL
{
    public class CommonManager
    {
        CommonGateway _gateway = new CommonGateway();

        public DataTable GetDataTestTable()
        {
            return _gateway.GetDataTestTable();
        }

    }
}