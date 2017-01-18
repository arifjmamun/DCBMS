
using System.Data;

using DCBMS.DAL;


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