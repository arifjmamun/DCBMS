using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using DCBMS.DLL.DAO;
using EvoPdf;

namespace DCBMS.UI
{
    public partial class Invoice : Page
    {
        bool convertToPdf = false;
        string billId;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Application.Count > 0)
            {
                convertToPdf = true;
                PatientInfo newPatientInfo = (PatientInfo)Application["Patient"];
                InvoicePanel.Visible = true;
                patientNameLabel.Text = newPatientInfo.PatientName;
                birthDateLabel.Text = newPatientInfo.BirthDate;
                phoneNumberLabel.Text = newPatientInfo.MobileNumber;
                billIdLabel.Text = newPatientInfo.BillInfo.BillId;
                billId = newPatientInfo.BillInfo.BillId;
                billDateLabel.Text = newPatientInfo.BillInfo.BillDate;
                AddTestInfoToGridView(newPatientInfo.BillInfo.TestList);
            }
            else
            {
                errorInfoPanel.Visible = true;
            }
        }
        protected override void Render(HtmlTextWriter writer)
        {
            if (convertToPdf && Application.Count > 0)
            {
                // Get the current page HTML string by rendering into a TextWriter object
                TextWriter outTextWriter = new StringWriter();
                HtmlTextWriter outHtmlTextWriter = new HtmlTextWriter(outTextWriter);
                base.Render(outHtmlTextWriter);

                // Obtain the current page HTML string
                string currentPageHtmlString = outTextWriter.ToString();

                // Create a HTML to PDF converter object with default settings
                HtmlToPdfConverter htmlToPdfConverter = new HtmlToPdfConverter();

                // Set license key received after purchase to use the converter in licensed mode
                // Leave it not set to use the converter in demo mode
                htmlToPdfConverter.LicenseKey = "4W9+bn19bn5ue2B+bn1/YH98YHd3d3c=";

                // Use the current page URL as base URL
                string baseUrl = HttpContext.Current.Request.Url.AbsoluteUri;

                // Convert the current page HTML string a PDF document in a memory buffer
                byte[] outPdfBuffer = htmlToPdfConverter.ConvertHtml(currentPageHtmlString, baseUrl);

                // Send the PDF as response to browser

                // Set response content type
                Response.AddHeader("Content-Type", "application/pdf");

                // Instruct the browser to open the PDF file as an attachment or inline
                Response.AddHeader("Content-Disposition", String.Format("attachment; filename="+billId+".pdf; size={0}", outPdfBuffer.Length.ToString()));

                // Write the PDF document buffer to HTTP response
                Response.BinaryWrite(outPdfBuffer);

                // End the HTTP response and stop the current page processing
                Response.End();
            }
            //else
            //{
            //    base.Render(writer);
            //}
        }

        private void AddTestInfoToGridView(List<TestInfo> testList)
        {
            billGridView.DataSource = testList;
            billGridView.DataBind();
        }
    }
}