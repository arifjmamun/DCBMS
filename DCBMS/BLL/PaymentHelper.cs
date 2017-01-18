
using DCBMS.DLL.Gateway;
using DCBMS.Model;

namespace DCBMS.Middleware
{
    public class PaymentHelper
    {
        PaymentGateway _paymentGateway = new PaymentGateway();
        
        public BillInfo GetTestInfoOfTheBill(string billId)
        {
            return _paymentGateway.GetTestInfoOfTheBill(billId);
        }

        private bool IsBillIdExists(string billId)
        {
            int countBillId = _paymentGateway.IsBillIdExists(billId);
            if (countBillId > 0)
            {
                return true;
            }
            return false;
        }

        private bool IsDueAmountExists(string billId)
        {
            int countBillId = _paymentGateway.IsDueAmountExists(billId);
            if (countBillId > 0)
            {
                return true;
            }
            return false;
        }

        public bool UpdateDueAmount(string billId, decimal amount)
        {
            int countAffectedRow = _paymentGateway.UpdateDueAmount(billId, amount);
            if (countAffectedRow > 0)
            {
                return true;
            }
            return false;
        }
    }
}