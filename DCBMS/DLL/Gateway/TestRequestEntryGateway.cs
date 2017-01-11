using System;
using System.Collections.Generic;
using DCBMS.DLL.DAO;

namespace DCBMS.DLL.Gateway
{
    public class TestRequestEntryGateway : CommonGateway
    {

        public List<string> GetAllTestName()
        {
            try
            {
                List<string> testNameList = new List<string>();
                const string sqlQuery = @"SELECT test_name FROM test_setup";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    testNameList.Add(Reader.GetValue(0).ToString());
                }
                Connection.Close();
                return testNameList;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Connection.Close();
            }
        }

        public decimal GetTestFee(string testName)
        {
            try
            {
                string sqlQuery = @"SELECT test_fee FROM test_setup WHERE test_name='"+testName+"'";
                Connection.Open();
                Command.CommandText = sqlQuery;
                decimal testFee = (decimal) Command.ExecuteScalar();
                return testFee;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Connection.Close();
            }
        }

        public string GetBillId()
        {
            try
            {
                const string sqlQuery = @"SELECT COUNT(*) FROM bill_info";
                Connection.Open();
                Command.CommandText = sqlQuery;
                int countBillId = (int) Command.ExecuteScalar() + 1;
                string billId = "DCB-" + countBillId;
                return billId;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Connection.Close();
            }
        }

        public string GetTestTypeName(string testName)
        {
            try
            {
                string sqlQuery = @"SELECT test_type_name FROM test_setup WHERE test_name='" + testName + "'";
                Connection.Open();
                Command.CommandText = sqlQuery;
                string testTypeName = (string)Command.ExecuteScalar();
                return testTypeName;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Connection.Close();
            }
        }

        public int CheckPatientExists(string mobileNumber)
        {
            try
            {
                const string sqlQuery = @"SELECT COUNT(*) FROM patient_info WHERE patient_mobile = @MobileNumber";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                int countPatient = (int) Command.ExecuteScalar();
                return countPatient;
            }
            finally
            {
                Connection.Close();
            }
        }

        public int SavePatientInfo(PatientInfo newPatientInfo)
        {
            try
            {
                const string patientInfoSqlQuery = @"INSERT INTO patient_info(patient_name, patient_dob, patient_mobile) 
                                                                VALUES(@PatientName, @BirthDate, @MobileNumber)";
                Connection.Open();
                Command.CommandText = patientInfoSqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@PatientName", newPatientInfo.PatientName);
                Command.Parameters.AddWithValue("@BirthDate", newPatientInfo.BirthDate);
                Command.Parameters.AddWithValue("@MobileNumber", newPatientInfo.MobileNumber);
                int countInsertion = Command.ExecuteNonQuery();
                return countInsertion;
            }
            finally
            {
                Connection.Close();
            }
        }

        public int SaveBillInfo(BillInfo billInfo, string mobileNumber)
        {
            try
            {
                const string billInfoSqlQuery = @"INSERT INTO bill_info(bill_id, bill_total, bill_paid, bill_due, bill_date, patient_mobile) 
                                                            VALUES(@BillId, @TotalAmount, @PaidAmount, @DueAmount, @BillDate, @MobileNumber)";
                Connection.Open();
                Command.CommandText = billInfoSqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@BillId", billInfo.BillId);
                Command.Parameters.AddWithValue("@TotalAmount", billInfo.TotalAmount);
                Command.Parameters.AddWithValue("@PaidAmount", billInfo.PaidAmount);
                Command.Parameters.AddWithValue("@DueAmount", billInfo.DueAmount);
                Command.Parameters.AddWithValue("@BillDate", billInfo.BillDate);
                Command.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                int countInsertion = Command.ExecuteNonQuery();
                return countInsertion;
            }
            finally
            {
                Connection.Close();
            }
        }

        public void SaveTestInfo(List<TestInfo> testList, string billId)
        {
            try
            {
                const string testInfoSqlQuery = @"INSERT INTO test_info(bill_id, test_date, test_name, test_fee, test_type_name) 
                                                            VALUES(@BillId, @TestDate, @TestName, @TestFee, @TestTypeName)";
                Connection.Open();
                foreach (TestInfo testInfo in testList)
                {
                    Command.CommandText = testInfoSqlQuery;
                    Command.Parameters.Clear();
                    Command.Parameters.AddWithValue("@BillId", billId);
                    Command.Parameters.AddWithValue("@TestDate", testInfo.TestDate);
                    Command.Parameters.AddWithValue("@TestName", testInfo.TestName);
                    Command.Parameters.AddWithValue("@TestFee", testInfo.TestFee);
                    Command.Parameters.AddWithValue("@TestTypeName", testInfo.TestTypeName);
                    Command.ExecuteNonQuery();
                }
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}