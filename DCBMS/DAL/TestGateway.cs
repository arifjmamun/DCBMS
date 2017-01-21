using System.Collections.Generic;
using DCBMS.DAL;
using DCBMS.Model;

namespace DCBMS.DLL.Gateway
{
    public class TestGateway : CommonGateway
    {
        public bool CheckTestIsExist(Test newTest)
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
            finally
            {
                Connection.Close();
            }
        }

        public void AddNewTest(Test newTest)
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
            finally
            {
                Connection.Close();
            }
        }


        public List<Test> GetAllTestInGrid()
        {
            try
            {
                List<Test> tests = new List<Test>();
                const string sqlQuery = @"SELECT * FROM test_setup ORDER BY test_name";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    int serial = 0;
                    while (Reader.Read())
                    {
                        Test test = new Test();
                        test.Serial = ++serial;
                        test.TestName = Reader["test_name"].ToString();
                        test.TestFee = (decimal)Reader["test_fee"];
                        test.TestTypeName = Reader["test_type_name"].ToString();
                        tests.Add(test);
                    }
                    Reader.Close();
                }
                return tests;
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}