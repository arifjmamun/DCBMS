using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        public void SavePatientBillInfo(PatientInfo newPatientInfo)
        {
            string patientInfoSqlQuery = @"INSERT INTO patient_info(patient_name, patient_dob, patient_mobile) 
                                                                VALUES(@PatientName, @BirthDate, @MobileNumber)";
            string billInfoSqlQuery = @"INSERT INTO bill_info(bill_id, bill_total, bill_paid, bill_due, bill_date, patient_mobile) 
                                                            VALUES(@BillId, @TotalAmount, @PaidAmount, @DueAmount, @BillDate, @MobileNumber)";
            string testInfoSqlQuery = @"INSERT INTO test_info(bill_id, test_date, test_name, test_fee, test_type_name) 
                                                            VALUES(@BillId, @TestDate, @TestName, @TestFee, @TestTypeName)";
            Connection.Open();
            Command.CommandText = patientInfoSqlQuery;
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("@PatientName", newPatientInfo.PatientName);
            Command.Parameters.AddWithValue("@BirthDate", newPatientInfo.BirthDate);
            Command.Parameters.AddWithValue("@MobileNumber", newPatientInfo.MobileNumber);
            int countInsertion = Command.ExecuteNonQuery();
            Connection.Close();
            if (countInsertion > 0)
            {
                Connection.Open();
                Command.CommandText = billInfoSqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@BillId", newPatientInfo.BillInfo.BillId);
                Command.Parameters.AddWithValue("@TotalAmount", newPatientInfo.BillInfo.TotalAmount);
                Command.Parameters.AddWithValue("@PaidAmount", newPatientInfo.BillInfo.PaidAmount);
                Command.Parameters.AddWithValue("@DueAmount", newPatientInfo.BillInfo.DueAmount);
                Command.Parameters.AddWithValue("@BillDate", newPatientInfo.BillInfo.BillDate);
                Command.Parameters.AddWithValue("@MobileNumber", newPatientInfo.MobileNumber);
                countInsertion = Command.ExecuteNonQuery();
                Connection.Close();
                if (countInsertion > 0)
                {
                    foreach (TestInfo testInfo in newPatientInfo.BillInfo.TestList)
                    {
                        Connection.Open();
                        Command.CommandText = testInfoSqlQuery;
                        Command.Parameters.Clear();
                        Command.Parameters.AddWithValue("@BillId", newPatientInfo.BillInfo.BillId);
                        Command.Parameters.AddWithValue("@TestDate", testInfo.TestDate);
                        Command.Parameters.AddWithValue("@TestName", testInfo.TestName);
                        Command.Parameters.AddWithValue("@TestFee", testInfo.TestFee);
                        Command.Parameters.AddWithValue("@TestTypeName", testInfo.TestTypeName);
                        Command.ExecuteNonQuery();
                        Connection.Close();
                    }
                }
            }
        }
    }
}