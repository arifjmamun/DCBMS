using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestRequest : Page
    {
        private int testCount;
        TestRequestEntryHelper testRequestEntry = new TestRequestEntryHelper();
        //Show Gridview as a table
        private void LoadGridView()
        {
            DataTable table = new DataTable();
            table.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("SL", typeof(string)), 
                new DataColumn("Test", typeof(string)),
                new DataColumn("Fee", typeof(decimal)),
            });
            testRequestEntryGridView.DataSource = table;
            testRequestEntryGridView.DataBind();
            ViewState["DataTable"] = table;
        }

        // Load All Test Name into Dropdown
        private void LoadAllTestName()
        {
            List<string> testNameList =  testRequestEntry.GetAllTestName();
            foreach (string testName in testNameList)
            {
                selectTestDropDown.Items.Add(testName);
            }
        }

        private void ShowTestInfoInGridview(TestInfo newTest)
        {
            DataTable table = (DataTable) ViewState["DataTable"];
            DataRow newRow = table.NewRow();
            newRow[0] = newTest.TestSerial;
            newRow[1] = newTest.TestName;
            newRow[2] = newTest.TestFee;
            table.Rows.Add(newRow);
            testRequestEntryGridView.DataSource = table;
            testRequestEntryGridView.DataBind();
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridView();
                LoadAllTestName();
                feeTextBox.Attributes.Add("readonly", "readonly");
            }
        }
        protected void addRequestEntryBtn_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" &&
                selectTestDropDown.SelectedIndex != 0 && feeTextBox.Text != "")
            {
                testCount = (ViewState["TestCount"] != null) ? (int)ViewState["TestCount"] : 0;
                testCount++;
                ViewState["TestCount"] = testCount;
                string testName = selectTestDropDown.SelectedValue;
                decimal testFee = Convert.ToDecimal(feeTextBox.Text);
                TestInfo newTest = new TestInfo((int)ViewState["TestCount"], testName, testFee);
                if (ViewState["TestList"] != null)
                {
                    foreach (TestInfo testInfo in (List<TestInfo>)ViewState["TestList"])
                    {
                        if (testInfo.TestName == testName)
                        {
                            // have to implement
                        }
                    }
                    List<TestInfo> testList = (List<TestInfo>)ViewState["TestList"];
                    testList.Add(newTest);
                }
                else
                {
                    List<TestInfo> testList = new List<TestInfo>();
                    testList.Add(newTest);
                    ViewState["TestList"] = testList;
                }
                ShowTestInfoInGridview(newTest);
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
        }

    }
}