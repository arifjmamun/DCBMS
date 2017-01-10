using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DCBMS.DLL.Gateway
{
    public class CommonGateway : DBconnection
    {
        public List<string> GetAllTestType()
        {
            try
            {
                List<string> testTypes = new List<string>();
                const string query = @"SELECT test_type_name FROM test_type_setup";
                Connection.Open();
                Command.CommandText = query;
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    testTypes.Add(Reader.GetValue(0).ToString());
                }
                Connection.Close();
                return testTypes;
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

        public DataTable GetDataTestTable()
        {
            DataTable table = new DataTable();
            Connection.Open();
            string query = "SELECT id, test_name, test_fee FROM test_info WHERE bill_id='DCB-1'";
            Command.CommandText = query;
            Adapter = new SqlDataAdapter(Command);
            Adapter.Fill(table);
            Connection.Close();
            return table;
        }
    }
}