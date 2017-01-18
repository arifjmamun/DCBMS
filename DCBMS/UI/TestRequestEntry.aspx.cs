using System;
using System.Collections;
using System.Collections.Generic;

using System.Web.UI;
using DCBMS.BLL;
using DCBMS.Model;


namespace DCBMS.UI
{
    public partial class TestRequest : Page
    {
        TestRequestEntryManager testRequestEntryManager = new TestRequestEntryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState.Clear();
                LoadGridView();
                LoadAllTestName();
                feeTextBox.Attributes.Add("readonly", "readonly");
                totalTextBox.Attributes.Add("readonly", "readonly");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void addRequestEntryBtn_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" &&
                selectTestDropDown.SelectedIndex != 0 && feeTextBox.Text != "")
            {
                AddTestToList();
                ShowTestInfoInGridview();
                CalculateTotalAmount();
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Invalid Data!",
                    "None of the field(s) cannot be empty, You have to must select a Test Name & Test Fee should be numeric value."
                };
            }
            DisplayWarning();
        }

        protected void saveEntriesButton_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" && ViewState["TestList"] != null)
            {
                string patientName = patientNameTextBox.Text;
                string birthDate = dobTextBox.Text;
                string mobileNumber = mobileNoTextBox.Text;
                BillInfo newBillInfo = new BillInfo((List<TestInfo>)ViewState["TestList"]);
                PatientInfo newPatientInfo = new PatientInfo(patientName, mobileNumber, birthDate, newBillInfo);
                testRequestEntryManager.SavePatientBillInfo(newPatientInfo);
                OpenPdfFile(newPatientInfo);
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Invalid Data!",
                    "None of the field(s) cannot be empty, You have to must select a Test Name & Test Fee should be numeric value."
                };
            }
            DisplayWarning();
        }

        private void LoadGridView()
        {
            testRequestEntryGridView.DataSource = new List<TestInfo>();
            testRequestEntryGridView.DataBind();
        }

        private void LoadAllTestName()
        {
            List<string> testNameList = testRequestEntryManager.GetAllTestName();
            foreach (string testName in testNameList)
            {
                selectTestDropDown.Items.Add(testName);
            }
        }

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

        private void CalculateTotalAmount()
        {
            decimal totalAmount = 0;
            foreach (TestInfo testInfo in (List<TestInfo>)ViewState["TestList"])
            {
                totalAmount += testInfo.TestFee;
            }
            totalTextBox.Text = totalAmount.ToString("F");
        }

        private bool IsTestAdded(string testName)
        {
            List<TestInfo> testList = (List<TestInfo>)ViewState["TestList"];
            bool isTestAdded = false;
            foreach (TestInfo testInfo in testList)
            {
                if (testInfo.TestName == testName)
                {
                    isTestAdded = true;
                    break;
                }
            }
            return isTestAdded;
        }

        private void AddTestToList()
        {
            string testName = selectTestDropDown.SelectedValue;
            decimal testFee = Convert.ToDecimal(feeTextBox.Text);
            TestInfo testInfo = new TestInfo(testName, testFee);
            if (ViewState["TestList"] != null)
            {
                if (!IsTestAdded(testInfo.TestName))
                {
                    List<TestInfo> testList = (List<TestInfo>)ViewState["TestList"];
                    int testCount = (int)ViewState["TestCount"];
                    testInfo.TestSerial = ++testCount;
                    ViewState["TestCount"] = testCount;
                    testList.Add(testInfo);
                }
                else
                {
                    ViewState["HasError"] = new ArrayList
                    {
                        true,
                        "Test already added!",
                        "The test already added and the test cannot be added multiple time for a patient."
                    };
                }
            }
            else
            {
                List<TestInfo> testList = new List<TestInfo>();
                ViewState["TestCount"] = 1;
                testInfo.TestSerial = 1;
                testList.Add(testInfo);
                ViewState["TestList"] = testList;
            }
        }

        private void ShowTestInfoInGridview()
        {
            List<TestInfo> testList = null;
            if (ViewState["TestList"] != null) testList = (List<TestInfo>)ViewState["TestList"];
            testRequestEntryGridView.DataSource = testList;
            testRequestEntryGridView.DataBind();
        }

        private void ClearInformation()
        {
            ViewState.Clear();
            LoadGridView();
            patientNameTextBox.Text = String.Empty;
            dobTextBox.Text = String.Empty;
            mobileNoTextBox.Text = String.Empty;
            selectTestDropDown.SelectedIndex = 0;
            feeTextBox.Text = String.Empty;
            totalTextBox.Text = String.Empty;
            invoiceWrapper.Visible = false;
        }

        private void OpenPdfFile(PatientInfo newPatientInfo)
        {
            if (Session["PatientInfo"] != null)
            {
                Session.Clear();
                Session["PatientInfo"] = newPatientInfo;
            }
            else
            {
                Session["PatientInfo"] = newPatientInfo;
            }
            ClearInformation();
            //Works very well
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('Download.aspx','_blank')", true);
        }

    }
}