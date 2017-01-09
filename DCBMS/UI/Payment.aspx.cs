using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class Payment : Page
    {
        PaymentHelper paymentHelper = new PaymentHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitiateGridView();
            }
        }

        protected void searchBillInfoBtn_Click(object sender, EventArgs e)
        {
            string billId = billNoTextBox.Text;
            if (billId != String.Empty)
            {
                BillInfo billInfo = paymentHelper.GetTestInfoOfTheBill(billId);
                if (billInfo != null)
                {
                    ShowTestInfoInGridView(billInfo.TestList);
                    ShowBillInfo(billInfo);
                }
                else
                {
                    ViewState["HasError"] = new ArrayList
                    {
                        true,
                        "Bill Id not found!",
                        "Bill Id not match or not exist or inavalid! Check Again."
                    };
                    ClearInformation();
                }
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Bill Id is Empty!",
                    "Bill Id cannot be empty! You must have to add a valid Bill Id."
                };
                ClearInformation();
            }
            DisplayWarning();
        }

        protected void payBillButton_Click(object sender, EventArgs e)
        {

        }

        private void InitiateGridView()
        {
            List<TestInfo> testList = new List<TestInfo>();
            testInfoGridView.DataSource = testList;
            testInfoGridView.DataBind();
        }

        private void ShowTestInfoInGridView(List<TestInfo> testList)
        {
            testInfoGridView.DataSource = testList;
            testInfoGridView.DataBind();
        }

        private void ShowBillInfo(BillInfo billInfo)
        {
            billDateLabel.Text = billInfo.BillDate;
            totalFeeLabel.Text = billInfo.TotalAmount.ToString("F");
            paidAmountLabel.Text = billInfo.PaidAmount.ToString("F");
            dueAmountLabel.Text = billInfo.DueAmount.ToString("F");
        }

        //Show warning if the field is empty or has invalid data against Regular expression
        private void DisplayWarning()
        {
            if (ViewState["HasError"] != null)
            {
                ArrayList errorInfo = (ArrayList)ViewState["HasError"];
                if ((bool)errorInfo[0])
                {
                    warningPanel.Visible = true;
                    errorName.InnerHtml = "<i class='icon fa fa-warning'></i>" + (string)errorInfo[1];
                    errorText.InnerText = (string)errorInfo[2];
                    ViewState["HasError"] = null;
                }
            }
            else
            {
                warningPanel.Visible = false;
            }
            //Regular expression implementation uncompleted
        }

        private void ClearInformation()
        {
            billNoTextBox.Text = String.Empty;
            InitiateGridView();
            billDateLabel.Text = String.Empty;
            totalFeeLabel.Text = String.Empty;
            paidAmountLabel.Text = String.Empty;
            dueAmountLabel.Text = String.Empty;
            amountTextBox.Text = String.Empty;
        }
    }
}