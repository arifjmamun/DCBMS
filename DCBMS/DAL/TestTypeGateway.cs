using System;
using System.Data;
using DCBMS.Model;

namespace DCBMS.DAL
{
    public class TestTypeGateway : CommonGateway
    {
        //Add new TestTypeSetup to the database
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

        // Get all TestTypeSetup info from Database
        public DataTable GetAllTestTypeAsTable()
        {
            try
            {
                const string sqlQuery = @"SELECT * FROM test_type_setup";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                DataTable newTable = new DataTable();
                newTable.Load(Reader);
                return newTable;
            }
            finally
            {
                Connection.Close();
            }
        }

        // Check the given test type exist or not
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