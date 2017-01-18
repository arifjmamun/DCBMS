using System.Collections.Generic;
using System.Data;
using DCBMS.DAL;
using DCBMS.Model;

namespace DCBMS.BLL
{
    public class TestTypeManager
    {
        TestTypeGateway _testTypeGateway = new TestTypeGateway();
        CommonGateway commonGateway = new CommonGateway();
        public void AddNewTestTye(TestType newTestType)
        {
            _testTypeGateway.AddNewTestType(newTestType);
        }

        public List<string> GetAllTestType()
        {
            return commonGateway.GetAllTestType();
        }

        public bool CheckTestTypeIsExist(TestType newTestType)
        {
            return _testTypeGateway.CheckTestTypeIsExist(newTestType);
        }

        public List<TestType> GetAllTestTypeInGrid()
        {
            return _testTypeGateway.GetAllTestTypeInGrid();
        }
    }
}