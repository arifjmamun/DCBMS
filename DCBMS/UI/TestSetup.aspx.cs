using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI;
using DCBMS.BLL;
using DCBMS.Model;

namespace DCBMS.UI
{
    public partial class TestSetup : Page
    {
        TestHelper testHelper = new TestHelper();

        //Show Gridview as a table
        private void LoadGridView()
        {
            testGridView.DataSource = testHelper.GetAllTestAsTable();
            testGridView.DataBind();
        }

        // Load all TestTypes in Combobox
        private void LoadTestTypes()
        {
            List<string> testTypes = testHelper.GetAllTestType();
            foreach (string testType in testTypes)
            {
                testTypeDropDown.Items.Add(testType);
            }
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
                    ViewState.Clear();
                }
            }
            else
            {
                warningPanel.Visible = false;
            }
            //Regular expression implementation uncompleted
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTestTypes();
                LoadGridView();
            }
        }

        protected void saveTestSetupBtn_Click(object sender, EventArgs e)
        {
            if (testNameTextBox.Text != String.Empty && feeTextBox.Text != String.Empty &&
                testTypeDropDown.SelectedIndex != 0)
            {
                string testName = testNameTextBox.Text;
                decimal testFee = Convert.ToDecimal(feeTextBox.Text);
                string testTypeName = testTypeDropDown.SelectedValue;
                Test newTest = new Test(testName, testFee, testTypeName);
                if (!testHelper.CheckTestIsExist(newTest))
                {
                    testHelper.AddNewTest(newTest);
                    LoadGridView();
                }
                else
                {
                    ViewState["HasError"] = new ArrayList
                    {
                        true,
                        "Test Name exist!",
                        "You cannot add duplicate Test Name! It is already exist, check again."
                    };
                }
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Empty field(s)!",
                    "None of the field(s) cannot be empty and must select a Test Type."
                };
            }
            DisplayWarning();
        }
    }
}