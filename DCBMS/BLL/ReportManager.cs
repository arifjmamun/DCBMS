using System.Collections.Generic;
using DCBMS.DAL;
using DCBMS.Model;

namespace DCBMS.BLL
{
    public class ReportManager
    {
        ReportGateway _reportGateway = new ReportGateway();

        public List<TestReport> GetTestWiseReport(string fromDate, string toDate)
        {
            return _reportGateway.GetTestWiseReport(fromDate, toDate);
        }

        public List<TestReport> GetTypeWiseReport(string fromDate, string toDate)
        {
            return _reportGateway.GetTypeWiseReport(fromDate, toDate);
        }

        public List<UnpaidBill> GetUnpaidBillReport(string fromDate, string toDate)
        {
            return _reportGateway.GetUnpaidBillReport(fromDate, toDate);
        }
    }
}