using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DCBMS.BLL;
using DCBMS.Model;

namespace DCBMS.UI
{
    public partial class TestTypeSetup : Page
    {
        TestTypeHelper testTypeHelper = new TestTypeHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadGridView();
            }
        }

        protected void saveTestTypeBtn_Click(object sender, EventArgs e)
        {
            if (typeNameTextBox.Text == String.Empty)
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "TestSetup Type is empty!",
                    "TestSetup type cannot be empty! Enter valid test type!"
                };
            }
            else
            {
                string testType = typeNameTextBox.Text;
                TestType newTestType = new TestType(testType);
                if (!testTypeHelper.CheckTestTypeIsExist(newTestType))
                {
                    testTypeHelper.AddNewTestTye(newTestType);
                    LoadGridView();
                }
                else
                {
                    ViewState["HasError"] = new ArrayList
                    {
                        true,
                        "TestSetup Type is exist!",
                        "You cannot add duplicate test type! It already exist, check again."
                    };
                }
            }
            DisplayWarning();
        }

        //Show Gridview as a table
        private void LoadGridView()
        {
            DataTable table = new DataTable();
            table.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("SL", typeof(string)), 
                new DataColumn("Type Name", typeof(string))
            });
            List<string> listOfTestTypes = testTypeHelper.GetAllTestType();
            for (int i = 0; i < listOfTestTypes.Count; i++)
            {
                DataRow newRow = table.NewRow();
                for (int j = 0; j < 2; j++)
                {
                    if (j == 0)
                    {
                        newRow["SL"] = (i + 1).ToString();
                    }
                    else
                    {
                        newRow["Type Name"] = listOfTestTypes[i];
                    }
                }
                table.Rows.Add(newRow);
            }
            testTypeGridView.DataSource = table;
            testTypeGridView.DataBind();
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

    }
}