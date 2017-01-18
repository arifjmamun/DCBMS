using System;

namespace DCBMS.Model
{
    [Serializable]
    public class Test
    {
        public int Serial { get; set; }
        public string TestName { get; set; }
        public decimal TestFee { get; set; }
        public string TestTypeName { get; set; }

        public Test(string testName, decimal testFee, string testTypeName)
        {
            TestName = testName;
            TestFee = testFee;
            TestTypeName = testTypeName;
        }

        public Test()
        {

        }
    }
}