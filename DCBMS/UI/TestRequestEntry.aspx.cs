using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestRequest : Page
    {
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

    }
}