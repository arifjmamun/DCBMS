using System.Collections.Generic;
using System.Data;
using DCBMS.DLL.DAO;
using DCBMS.DLL.Gateway;

namespace DCBMS.Middleware
{
    public class TestHelper
    {
        CommonGateway commonGateway = new CommonGateway();
        TestGateway testGateway = new TestGateway();
        public List<string> GetAllTestType()
        {
            return commonGateway.GetAllTestType();
        }

        public bool CheckTestIsExist(TestDao newTest)
        {
            return testGateway.CheckTestIsExist(newTest);
        }

        public void AddNewTest(TestDao newTest)
        {
            testGateway.AddNewTest(newTest);
        }

        public DataTable GetAllTestAsTable()
        {
            return testGateway.GetAllTestAsTable();
        }
    }
}