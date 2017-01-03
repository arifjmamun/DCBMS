using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DCBMS.DLL.DAO
{
    [Serializable]
    public class TestTypeDao
    {
        public string TypeName { get; set; }

        public TestTypeDao(string typeName)
        {
            TypeName = typeName;
        }
    }
}