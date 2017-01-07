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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientInfo"] == null)
            {
                errorInfoPanel.Visible = true;
            }
            else
            {
                InvoicePanel.Visible = true;
                convertToPdf = true;
            }
        }
        //protected override void Render(HtmlTextWriter writer)
        //{
        //    if (convertToPdf)
        //    {
        //        // Get the current page HTML string by rendering into a TextWriter object
        //        TextWriter outTextWriter = new StringWriter();
        //        HtmlTextWriter outHtmlTextWriter = new HtmlTextWriter(outTextWriter);
        //        base.Render(outHtmlTextWriter);

        //        // Obtain the current page HTML string
        //        string currentPageHtmlString = outTextWriter.ToString();

        //        // Create a HTML to PDF converter object with default settings
        //        HtmlToPdfConverter htmlToPdfConverter = new HtmlToPdfConverter();

        //        // Set license key received after purchase to use the converter in licensed mode
        //        // Leave it not set to use the converter in demo mode
        //        htmlToPdfConverter.LicenseKey = "4W9+bn19bn5ue2B+bn1/YH98YHd3d3c=";

        //        // Set PDF page margins in points or leave them not set to have a PDF page without margins
        //        htmlToPdfConverter.PdfDocumentOptions.LeftMargin = 0;
        //        htmlToPdfConverter.PdfDocumentOptions.RightMargin = 0;
        //        htmlToPdfConverter.PdfDocumentOptions.TopMargin = 0;
        //        htmlToPdfConverter.PdfDocumentOptions.BottomMargin = 0;

        //        // Use the current page URL as base URL
        //        string baseUrl = HttpContext.Current.Request.Url.AbsoluteUri;

        //        // Convert the current page HTML string a PDF document in a memory buffer
        //        byte[] outPdfBuffer = htmlToPdfConverter.ConvertHtml(currentPageHtmlString, baseUrl);

        //        // Send the PDF as response to browser

        //        // Set response content type
        //        Response.AddHeader("Content-Type", "application/pdf");

        //        // Instruct the browser to open the PDF file as an attachment or inline
        //        Response.AddHeader("Content-Disposition", String.Format("attachment; filename=Convert_Current_Page.pdf; size={0}", outPdfBuffer.Length.ToString()));

        //        // Write the PDF document buffer to HTTP response
        //        Response.BinaryWrite(outPdfBuffer);

        //        // End the HTTP response and stop the current page processing
        //        Response.End();
        //    }
        //    else
        //    {
        //        base.Render(writer);
        //    }
        //}

        private void AddTestInfoToGridView()
        {
            List<TestInfo> testList = (List<TestInfo>)Session["PatientInfo"];
            billGridView.DataSource = testList;
            billGridView.DataBind();
        }
    }
}