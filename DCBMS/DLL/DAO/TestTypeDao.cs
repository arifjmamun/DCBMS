using System;
using System.ComponentModel.DataAnnotations;

namespace DCBMS.DLL.DAO
{
    [Serializable]
    public class TestTypeDao
    {
        [Required]
        public string TypeName { get; set; }

        public TestTypeDao(string typeName)
        {
            TypeName = typeName;
        }
    }
}