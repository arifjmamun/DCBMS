using System.Collections.Generic;
using DCBMS.DAL;
using DCBMS.Model;

namespace DCBMS.BLL
{
    public class TestRequestEntryHelper
    {
        TestRequestEntryGateway _testRequestEntryGateway = new TestRequestEntryGateway();
        public List<string> GetAllTestName()
        {
            return _testRequestEntryGateway.GetAllTestName();
        }

        public decimal GetTestFee(string testName)
        {
            return _testRequestEntryGateway.GetTestFee(testName);
        }

        public string GetBillId()
        {
            return _testRequestEntryGateway.GetBillId();
        }

        public string GetTestTypeName(string testName)
        {
            return _testRequestEntryGateway.GetTestTypeName(testName);
        }

        public void SavePatientBillInfo(PatientInfo newPatientInfo)
        {
            int countPatient = _testRequestEntryGateway.CheckPatientExists(newPatientInfo.MobileNumber);
            bool isPatientExists = (countPatient > 0); 
            if (isPatientExists)
            {
                int countInsertion = _testRequestEntryGateway.SaveBillInfo(newPatientInfo.BillInfo, newPatientInfo.MobileNumber);
                if (countInsertion > 0)
                {
                    _testRequestEntryGateway.SaveTestInfo(newPatientInfo.BillInfo.TestList, newPatientInfo.BillInfo.BillId);
                }
            }
            else
            {
                int countInsertion = _testRequestEntryGateway.SavePatientInfo(newPatientInfo);
                if (countInsertion > 0)
                {
                    countInsertion = _testRequestEntryGateway.SaveBillInfo(newPatientInfo.BillInfo, newPatientInfo.MobileNumber);

                    if (countInsertion > 0)
                    {
                        _testRequestEntryGateway.SaveTestInfo(newPatientInfo.BillInfo.TestList, newPatientInfo.BillInfo.BillId);
                    }
                }
            }
        }
    }
}