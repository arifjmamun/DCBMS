using System;
using System.IO;
using System.Text;
using System.Web.UI;
using DCBMS.Model;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.pipeline.html;
using Color = System.Drawing.Color;

namespace DCBMS.UI
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            //LoadEmptyData();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        private void LoadData()
        {
            if (Session["PatientInfo"] != null)
            {
                PatientInfo patientInfo = (PatientInfo)Session["PatientInfo"];
                invoiceWrapper.Visible = true;
                patientBillGridview.HeaderStyle.BackColor = Color.Silver;
                patientBillGridview.HeaderStyle.Font.Bold = true;
                patientBillGridview.DataSource = patientInfo.BillInfo.TestList;
                patientBillGridview.DataBind();

                billIdLabel.Text = patientInfo.BillInfo.BillId;
                billdateLabel.Text = patientInfo.BillInfo.BillDate;
                patientNameLabel.Text = patientInfo.PatientName;
                birthDateLabel.Text = patientInfo.BirthDate;
                mobileNumberLabel.Text = patientInfo.MobileNumber;
                totalAmountLabel.Text = patientInfo.BillInfo.TotalAmount.ToString("F");
                DownloadPdf(GenerateMemoryStream(), patientInfo.BillInfo.BillId);
            }
        }

        private byte[] GenerateMemoryStream()
        {
            var stringWriter = new StringWriter();
            var htmlTextWriter = new HtmlTextWriter(stringWriter);
            invoiceWrapper.RenderControl(htmlTextWriter);
            var innerString = stringWriter.GetStringBuilder().ToString(); 

            var output = new MemoryStream();
            var input = new MemoryStream(Encoding.UTF8.GetBytes(innerString));
            var document = new Document();
            var writer = PdfWriter.GetInstance(document, output);
            writer.CloseStream = false;

            document.Open();
            var htmlContext = new HtmlPipelineContext(null);
            htmlContext.SetTagFactory(iTextSharp.tool.xml.html.Tags.GetHtmlTagProcessorFactory());
            ICSSResolver cssResolver = XMLWorkerHelper.GetInstance().GetDefaultCssResolver(false);
            cssResolver.AddCssFile(System.Web.HttpContext.Current.Server.MapPath("~/Template/bootstrap/css/bootstrap.min.css"), true);
            cssResolver.AddCssFile(System.Web.HttpContext.Current.Server.MapPath("~/Template/Bootstrap/css/custom.css"), true);

            var pipeline = new CssResolverPipeline(cssResolver, new HtmlPipeline(htmlContext, new PdfWriterPipeline(document, writer)));
            var worker = new XMLWorker(pipeline, true);
            var parser = new XMLParser(worker);
            parser.Parse(input);
            document.Close();
            return output.ToArray();
        }

        private void DownloadPdf(byte[] fileBytes, string billId)
        {
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + billId +"-"+ DateTime.Now + ".pdf");

            Response.BinaryWrite(fileBytes);
            Response.End();
            Response.Flush();
            Response.Clear();
        }

        //private void LoadEmptyData()
        //{
        //    List<TestInfo> testList = new List<TestInfo>();
        //    TestInfo testInfo = new TestInfo();
        //    testInfo.TestFee = 500;
        //    testInfo.TestSerial = 1;
        //    testInfo.TestName = "Blood";
        //    testList.Add(testInfo);
        //    patientBillGridview.DataSource = testList;
        //    patientBillGridview.DataBind();
        //}
    }
}