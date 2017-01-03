using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.Gateway
{
    abstract public class DBconnection
    {
        protected SqlCommand Command;
        protected SqlConnection Conenection;
        protected SqlDataAdapter Adapter;
        protected SqlDataReader Reader;
        protected DBconnection()
        {
            Conenection = new SqlConnection(ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString);
            Command = new SqlCommand();
            Command.Connection = Conenection;
        }
    }
}