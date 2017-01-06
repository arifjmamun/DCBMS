using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}