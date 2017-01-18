using System;

namespace DCBMS.Model
{
    [Serializable]
    public class Test
    {
        public string TestName { get; set; }
        public decimal TestFee { get; private set; }
        public string TestTypeName { get; set; }

        public Test(string testName, decimal testFee, string testTypeName)
        {
            TestName = testName;
            TestFee = testFee;
            TestTypeName = testTypeName;
        }

    }
}