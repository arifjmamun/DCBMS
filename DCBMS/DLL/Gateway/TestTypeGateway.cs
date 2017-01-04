using System.Data;
using DCBMS.DLL.DAO;

namespace DCBMS.DLL.Gateway
{
    public class TestTypeGateway : DBconnection
    {
        //Add new TestType to the database
        public void AddNewTestTye(TestTypeDao newTestType)
        {
            try
            {
                const string sqlQuery = @"INSERT INTO test_type_setup(test_type_name) VALUES(@TestTypeName)";
                Conenection.Open();
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@TestTypeName", newTestType.TypeName);
                Command.ExecuteNonQuery();
            }
            finally
            {
                Conenection.Close();
            }
        }

        // Get all TestType info from Database
        public DataTable GetAllTestType()
        {
            try
            {
                const string sqlQuery = @"SELECT * FROM test_type_setup";
                Conenection.Open();
                Command.CommandText = sqlQuery;
                Reader = Command.ExecuteReader();
                DataTable newTable = new DataTable();
                newTable.Load(Reader);
                return newTable;
            }
            finally
            {
                Conenection.Close();
            }
        }

        // Check the given test type exist or not
        public bool CheckTestTypeIsExist()
        {
            // have to do
            return true;
        }
    }
}