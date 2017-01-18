using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCBMS.BLL;
using DCBMS.Model;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Color = System.Drawing.Color;

namespace DCBMS.UI
{
    public partial class UnpaidBillReport : Page
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
                ShowUnpaidBillReport(fromDate.ToString("yyyy-MM-dd"), toDate.ToString("yyyy-MM-dd"));
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
            int rowCount = unpaidBillReportGridView.Rows.Count;
            if (rowCount > 0)
            {
                SetGridviewStyles();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=UnpaidBillReport.pdf");
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
            List<UnpaidBill> unpaidBills = new List<UnpaidBill>();
            unpaidBillReportGridView.DataSource = unpaidBills;
            unpaidBillReportGridView.DataBind();
        }

        private void ShowUnpaidBillReport(string fromDate, string toDate)
        {
            List<UnpaidBill> unpaidBills = reportManager.GetUnpaidBillReport(fromDate, toDate);
            unpaidBillReportGridView.DataSource = unpaidBills;
            unpaidBillReportGridView.DataBind();
            decimal totalAmount = 0;
            foreach (UnpaidBill unpaidBill in unpaidBills)
            {
                totalAmount = totalAmount + unpaidBill.BillAmount;
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
            unpaidBillReportGridView.GridLines = GridLines.Both;
            unpaidBillReportGridView.HeaderStyle.BackColor = Color.Silver;
            unpaidBillReportGridView.HeaderStyle.Font.Bold = true;
        }

        private void ResetGridviewStyles()
        {
            reportHeading.Visible = false;
            dateRangeLabel.Visible = false;
            unpaidBillReportGridView.GridLines = GridLines.None;
            unpaidBillReportGridView.HeaderStyle.BackColor = Color.Empty;
            unpaidBillReportGridView.HeaderStyle.Font.Bold = false;
        }
    }
}
