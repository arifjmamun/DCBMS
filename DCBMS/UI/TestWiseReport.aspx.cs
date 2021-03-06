﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using System.Text;
using DCBMS.BLL;
using DCBMS.Model;
using Color = System.Drawing.Color;

namespace DCBMS.UI
{
    public partial class TestWiseReport : Page
    {
        ReportManager reportManager = new ReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitiateGridView();
                totalTextBox.Attributes.Add("readonly", "readonly");
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void showReportBtn_Click(object sender, EventArgs e)
        {
            DateTime fromDate, toDate;
            bool isFromDate = DateTime.TryParseExact(fromDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out fromDate);
            bool isToDate = DateTime.TryParseExact(toDateTextBox.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out toDate);
            if (isFromDate && isToDate && fromDate.Date <= toDate.Date)
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

        // Working
        protected void generatePdfButton_Click(object sender, EventArgs e)
        {
            int rowCount = testWiseReportGridView.Rows.Count;
            if (rowCount > 0)
            {
                SetGridviewStyles();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition",
                 "attachment;filename=TestWiseReport.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                gridViewWrapper.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
                ResetGridviewStyles();
            }
        }

        private void InitiateGridView()
        {
            List<TestReport> testReports = new List<TestReport>();
            testWiseReportGridView.DataSource = testReports;
            testWiseReportGridView.DataBind();
        }

        private void ShowTestWiseReport(string fromDate, string toDate)
        {
            List<TestReport> testReports = reportManager.GetTestWiseReport(fromDate, toDate);
            testWiseReportGridView.DataSource = testReports;
            testWiseReportGridView.DataBind();
            decimal totalAmount = 0;
            foreach (TestReport testReport in testReports)
            {
                totalAmount = totalAmount + testReport.TotalAmount;
            }
            totalTextBox.Text = totalAmount.ToString("F");
            fromDateLabel.Text = fromDate;
            toDateLabel.Text = toDate;
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
                    ViewState.Clear();
                }
            }
            else
            {
                warningPanel.Visible = false;
            }
            //Regular expression implementation uncompleted
        }

        private void ClearFields()
        {
            //fromDateTextBox.Text = String.Empty;
            //toDateTextBox.Text = String.Empty;
            InitiateGridView();
            totalTextBox.Text = String.Empty;
        }

        private void SetGridviewStyles()
        {
            reportHeading.Visible = true;
            dateRangeLabel.Visible = true;
            testWiseReportGridView.GridLines = GridLines.Both;
            testWiseReportGridView.HeaderStyle.BackColor = Color.Silver;
            testWiseReportGridView.HeaderStyle.Font.Bold = true;
        }

        private void ResetGridviewStyles()
        {
            reportHeading.Visible = false;
            dateRangeLabel.Visible = false;
            testWiseReportGridView.GridLines = GridLines.None;
            testWiseReportGridView.HeaderStyle.BackColor = Color.Empty;
            testWiseReportGridView.HeaderStyle.Font.Bold = false;
        }

    }
}