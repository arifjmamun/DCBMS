using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestWiseReport : Page
    {
        ReportHelper reportHelper = new ReportHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitiateGridView();
            }
        }

        protected void showReportBtn_Click(object sender, EventArgs e)
        {
            DateTime fromDate, toDate;
            bool isFromDate = DateTime.TryParseExact(fromDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out fromDate);
            bool isToDate = DateTime.TryParseExact(toDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out toDate);
            if (isFromDate && isToDate && fromDate.Date < toDate.Date)
            {
                ShowTestWiseReport(fromDate.ToString("yyyy-MM-dd"), toDate.ToString("yyyy-MM-dd"));
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Invalid Date!",
                    "You must enter a valid date and 'From' date must be earlier than 'To' date"
                };
                ClearFields();
            }
            DisplayWarning();
        }

        protected void generatePdfButton_Click(object sender, EventArgs e)
        {

        }

        private void InitiateGridView()
        {
            List<TestReport> testReports = new List<TestReport>();
            testWiseReportGridView.DataSource = testReports;
            testWiseReportGridView.DataBind();
        }

        private void ShowTestWiseReport(string fromDate, string toDate)
        {
            List<TestReport> testReports = reportHelper.GetTestWiseReport(fromDate, toDate);
            testWiseReportGridView.DataSource = testReports;
            testWiseReportGridView.DataBind();
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

        //Clear Fields
        private void ClearFields()
        {
            //fromDateTextBox.Text = String.Empty;
            //toDateTextBox.Text = String.Empty;
            InitiateGridView();
            totalTextBox.Text = String.Empty;
        }
    }
}