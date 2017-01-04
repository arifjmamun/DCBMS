using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class Test : Page
    {
        TestHelper testHelper = new TestHelper();
        private void InitiateGridView()
        {
            DataTable table = new DataTable();
            testGridView.DataSource = table;
            testGridView.DataBind();
        }

        private void LoadTestTypes()
        {
            List<string> testTypes = testHelper.GetAllTestType();
            foreach (string testType in testTypes)
            {
                testTypeDropDown.Items.Add(testType);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitiateGridView();
                LoadTestTypes();
            }
        }
    }
}