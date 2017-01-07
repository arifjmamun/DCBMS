using System;
using System.Collections.Generic;

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
    }
}