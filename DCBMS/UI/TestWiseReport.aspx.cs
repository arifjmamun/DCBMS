using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestWiseReport : Page
    {
        ReportHelper reportHelper = new ReportHelper();
        private void InitiateGridView()
        {
            List<TestReport> testReports = new List<TestReport>();
            testWiseReportGridView.DataSource = testReports;
            testWiseReportGridView.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitiateGridView();
            }
        }
    }
}