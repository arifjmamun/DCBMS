using System.Collections.Generic;
using System.Data;
using DCBMS.DAL;
using DCBMS.DLL.Gateway;
using DCBMS.Model;


namespace DCBMS.BLL
{
    public class TestHelper
    {
        CommonGateway commonGateway = new CommonGateway();
        TestGateway testGateway = new TestGateway();
        public List<string> GetAllTestType()
        {
            return commonGateway.GetAllTestType();
        }

        public bool CheckTestIsExist(Test newTest)
        {
            return testGateway.CheckTestIsExist(newTest);
        }

        public void AddNewTest(Test newTest)
        {
            testGateway.AddNewTest(newTest);
        }

        public DataTable GetAllTestAsTable()
        {
            return testGateway.GetAllTestAsTable();
        }
    }
}