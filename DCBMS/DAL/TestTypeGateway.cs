using System;
using System.Collections.Generic;
using System.Data;
using DCBMS.Model;

namespace DCBMS.DAL
{
    public class TestTypeGateway : CommonGateway
    {
        public void AddNewTestType(TestType newTestType)
        {
            try
            {
                const string sqlQuery = @"INSERT INTO test_type_setup(test_type_name) VALUES(@TestTypeName)";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@TestTypeName", newTestType.TypeName);
                Command.ExecuteNonQuery();
            }
            finally
            {
                Connection.Close();
            }
        }


        public bool CheckTestTypeIsExist(TestType newTestType)
        {
            try
            {
                string sqlQuery = @"SELECT COUNT(test_type_name) FROM test_type_setup WHERE test_type_name='"+newTestType.TypeName+"'";
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

        public List<TestType> GetAllTestTypeInGrid()
        {
            try
            {
                List<TestType> testTypes = new List<TestType>();
                const string sqlQuery = @"SELECT * FROM test_type_setup ORDER BY test_type_name";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    int serial = 0;
                    while (Reader.Read())
                    {
                        TestType testType = new TestType();
                        testType.Serial = ++serial;
                        testType.TypeName = Reader["test_type_name"].ToString();
                        testTypes.Add(testType);
                    }
                    Reader.Close();
                }
                return testTypes;
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}