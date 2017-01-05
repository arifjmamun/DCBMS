using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DCBMS.DLL.DAO;

namespace DCBMS.DLL.Gateway
{
    public class TestGateway : CommonGateway
    {
        // Check the given test name exist or not
        public bool CheckTestIsExist(TestDao newTest)
        {
            try
            {
                string sqlQuery = @"SELECT COUNT(test_name) FROM test_setup WHERE test_name='" + newTest.TestName + "'";
                Connection.Open();
                Command.CommandText = sqlQuery;
                int countRow = (int)Command.ExecuteScalar();
                if (countRow > 0)
                {
                    return true;
                }
                return false;
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

        public void AddNewTest(TestDao newTest)
        {
            try
            {
                const string sqlQuery = @"INSERT INTO test_setup(test_name, test_fee, test_type_name) VALUES(@TestName, @TestFee, @TestTypeName)";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@TestName", newTest.TestName);
                Command.Parameters.AddWithValue("@TestFee", newTest.TestFee);
                Command.Parameters.AddWithValue("@TestTypeName", newTest.TestTypeName);
                Command.ExecuteNonQuery();
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

        public DataTable GetAllTestAsTable()
        {
            try
            {
                const string sqlQuery = @"SELECT * FROM test_setup";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                DataTable table = new DataTable();
                table.Load(Reader);
                return table;
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