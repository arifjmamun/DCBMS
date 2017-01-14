using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCBMS.DLL.DAO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Color = System.Drawing.Color;

namespace DCBMS.UI
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
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
                DownloadPdfFile(RenderPdfFile(), patientInfo.BillInfo.BillId);
            }
        }

        private byte[] RenderPdfFile()
        {
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

            using (MemoryStream pdfBill = new MemoryStream())
            {
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                invoiceWrapper.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());

                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, pdfBill);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                return pdfBill.ToArray();
            }
        }

        private void DownloadPdfFile(byte[] fileBytes, string billId)
        {
            Session.Clear();
            invoiceWrapper.Visible = false;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + billId + DateTime.Now + ".pdf");

            Response.BinaryWrite(fileBytes);
            Response.End();
            Response.Flush();
            Response.Clear();
        }
    }
}