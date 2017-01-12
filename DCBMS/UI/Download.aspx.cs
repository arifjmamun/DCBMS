using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCBMS.UI
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DownloadPdfFile();
        }

        private void DownloadPdfFile()
        {
            if (Session["FileBytes"] != null && Session["BillId"] != null)
            {
                EnableViewState = false;
                string billId = Session["BillId"].ToString();
                byte[] fileBytes = (byte[])Session["FileBytes"];
                Session.Clear();
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
}