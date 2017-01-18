using System;
using System.ComponentModel.DataAnnotations;

namespace DCBMS.Model
{
    [Serializable]
    public class TestType
    {
        public int Serial { get; set; }
        public string TypeName { get; set; }

        public TestType(string typeName)
        {
            TypeName = typeName;
        }

        public TestType()
        {
            
        }
    }
}