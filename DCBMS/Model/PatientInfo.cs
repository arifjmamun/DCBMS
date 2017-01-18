using System;
using DCBMS.Model;

namespace DCBMS.Model
{
    [Serializable]
    public class PatientInfo
    {
        public string PatientName { get; private set; }
        public string BirthDate { get; private set; }
        public string MobileNumber { get; private set; }
        public BillInfo BillInfo { get; private set; }

        public PatientInfo(string patientName, string mobileNumber, string birthDate, BillInfo billInfo)
        {
            PatientName = patientName;
            MobileNumber = mobileNumber;
            BirthDate = birthDate;
            BillInfo = billInfo;
        }
    }
}