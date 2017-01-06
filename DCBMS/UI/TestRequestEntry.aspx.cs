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
            testRequestEntryGridView.DataSource = table;
            testRequestEntryGridView.DataBind();
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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridView();
                LoadAllTestName();
            }
        }

        protected void addRequestEntryBtn_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" &&
                selectTestDropDown.SelectedIndex != 0 && feeTextBox.Text.All(Char.IsNumber))
            {
                testCount++;
                string testName = selectTestDropDown.SelectedValue;
                decimal testFee = Convert.ToDecimal(feeTextBox.Text);
                TestInfo newTest = new TestInfo(testCount,testName,testFee);
                if (ViewState["TestList"] != null)
                {
                    List<TestInfo> testList = (List<TestInfo>)ViewState["TestList"];
                    testList.Add(newTest);
                }
                else
                {
                    List<TestInfo> testList = new List<TestInfo>();
                    testList.Add(newTest);
                    ViewState["TestList"] = testList;
                }
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