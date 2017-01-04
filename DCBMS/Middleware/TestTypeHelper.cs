using System.Collections.Generic;
using System.Data;
using DCBMS.DLL.DAO;
using DCBMS.DLL.Gateway;

namespace DCBMS.Middleware
{
    public class TestTypeHelper
    {
        TestTypeGateway newGateway = new TestTypeGateway();
        CommonGateway commonGateway = new CommonGateway();
        public void AddNewTestTye(TestTypeDao newTestType)
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

        public bool CheckTestTypeIsExist(TestTypeDao newTestType)
        {
            return newGateway.CheckTestTypeIsExist(newTestType);
        }
    }
}