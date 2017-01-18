using System.Collections.Generic;
using System.Data;
using DCBMS.DAL;
using DCBMS.Model;

namespace DCBMS.BLL
{
    public class TestTypeHelper
    {
        TestTypeGateway newGateway = new TestTypeGateway();
        CommonGateway commonGateway = new CommonGateway();
        public void AddNewTestTye(TestType newTestType)
        {
            newGateway.AddNewTestType(newTestType);
        }

        public DataTable GetAllTestTypeAsTable()
        {
            return newGateway.GetAllTestTypeAsTable();
        }

        public List<string> GetAllTestType()
        {
            return commonGateway.GetAllTestType();
        }

        public bool CheckTestTypeIsExist(TestType newTestType)
        {
            return newGateway.CheckTestTypeIsExist(newTestType);
        }
    }
}