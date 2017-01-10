using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCBMS.DLL.DAO;

namespace DCBMS.DLL.Gateway
{
    public class ReportGateway : CommonGateway
    {

        public List<TestReport> GetTestWiseReport(string fromDate, string toDate)
        {
            try
            {
                List<TestReport> testReports = new List<TestReport>();
                const string sqlQuery = @"SELECT test_setup.test_name, COUNT(test_info.test_name) AS total_test, SUM(test_info.test_fee) as total_amount 
                                        FROM test_setup
                                        FULL OUTER JOIN test_info 
                                        ON test_setup.test_name = test_info.test_name AND test_info.test_date BETWEEN @FromDate AND @ToDate
                                        GROUP BY test_setup.test_name, test_info.test_name";
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@FromDate", fromDate);
                Command.Parameters.AddWithValue("@ToDate", toDate);
                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    while (Reader.Read())
                    {
                        
                    }
                }
                Connection.Open();
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}