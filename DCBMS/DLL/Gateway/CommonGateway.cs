using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
                Conenection.Open();
                Command.CommandText = query;
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    testTypes.Add(Reader.GetValue(0).ToString());
                }
                Conenection.Close();
                return testTypes;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Conenection.Close();
            }
        }
    }
}