using System.Collections.Generic;
using System.Data;
using DCBMS.DAL;
using DCBMS.DLL.Gateway;
using DCBMS.Model;


namespace DCBMS.BLL
{
    public class TestManager
    {
        CommonGateway _commonGateway = new CommonGateway();
        TestGateway _testGateway = new TestGateway();
        public List<string> GetAllTestType()
        {
            return _commonGateway.GetAllTestType();
        }

        public bool CheckTestIsExist(Test newTest)
        {
            return _testGateway.CheckTestIsExist(newTest);
        }

        public void AddNewTest(Test newTest)
        {
            _testGateway.AddNewTest(newTest);
        }


        public List<Test> GetAllTestInGrid()
        {
            return _testGateway.GetAllTestInGrid();
        }
    }
}