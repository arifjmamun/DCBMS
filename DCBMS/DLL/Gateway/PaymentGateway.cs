using System;
using System.Collections.Generic;
using DCBMS.DLL.DAO;

namespace DCBMS.DLL.Gateway
{
    public class PaymentGateway : CommonGateway
    {

        public int IsBillIdExists(string billId)
        {
            try
            {
                string sqlQuery = @"SELECT COUNT(*) FROM bill_info WHERE bill_id='" + billId + "'";
                Connection.Open();
                Command.CommandText = sqlQuery;
                int countBillId = (int)Command.ExecuteScalar();
                return countBillId;
            }
            finally
            {
                Connection.Close();
            }
        }

        public int IsDueAmountExists(string billId)
        {
            try
            {
                string sqlQuery = @"SELECT COUNT(*) FROM bill_info WHERE bill_id='" + billId + "' AND bill_due>0";
                Connection.Open();
                Command.CommandText = sqlQuery;
                int countBillId = (int)Command.ExecuteScalar();
                return countBillId;
            }
            finally
            {
                Connection.Close();
            }
        }

        public BillInfo GetTestInfoOfTheBill(string billId)
        {
            try
            {
                List<TestInfo> testList = null;
                BillInfo billInfo = null;
                string sqlSubQuery = @"SELECT * FROM test_info WHERE bill_id ='" + billId + "'";
                string mainSqlQuery = @"SELECT * FROM bill_info WHERE bill_id ='" + billId + "'";
                Connection.Open();
                Command.CommandText = sqlSubQuery;
                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    int serial = 0;
                    testList = new List<TestInfo>();
                    while (Reader.Read())
                    {
                        TestInfo testInfo = new TestInfo();
                        testInfo.TestSerial = ++serial;
                        testInfo.TestName = Reader["test_name"].ToString();
                        testInfo.TestFee = (Decimal)Reader["test_fee"];
                        testList.Add(testInfo);
                    }
                    Reader.Close();
                }
                if (testList != null)
                {

                    Command.CommandText = mainSqlQuery;
                    Reader = Command.ExecuteReader();
                    if (Reader.HasRows)
                    {
                        Reader.Read();
                        string billNo = Reader["bill_id"].ToString();
                        decimal totalAmount = (Decimal)Reader["bill_total"];
                        decimal paidAmount = (Decimal)Reader["bill_paid"];
                        decimal dueAmount = (Decimal)Reader["bill_due"];
                        string billDate = String.Format("{0:dd-MM-yyyy}", Reader["bill_date"]);
                        billInfo = new BillInfo(billNo, totalAmount, paidAmount, dueAmount, billDate, testList);
                        Reader.Close();
                    }
                }
                return billInfo;
            }
            finally
            {
                Connection.Close();
            }
        }

        public int UpdateDueAmount(string billId, decimal amount)
        {
            try
            {
                const string sqlQuery = @"UPDATE bill_info SET bill_paid=bill_paid+@AddAmount, bill_due=bill_due-@SubAmount WHERE bill_id=@BillId";
                Connection.Open();
                Command.CommandText = sqlQuery;
                Command.Parameters.Clear();
                Command.Parameters.AddWithValue("@BillId", billId);
                Command.Parameters.AddWithValue("@AddAmount", amount);
                Command.Parameters.AddWithValue("@SubAmount", amount);
                int countAffectedRow = Command.ExecuteNonQuery();
                return countAffectedRow;
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}