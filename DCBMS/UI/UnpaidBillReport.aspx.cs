using System;
using System.Data;
using System.Web.UI;

namespace DCBMS.UI
{
    public partial class UnpaidBillReport : Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                unpaidBillReportGridView.DataSource = table;
                unpaidBillReportGridView.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}