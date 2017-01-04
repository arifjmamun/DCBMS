using System;
using System.Data;
using System.Web.UI;

namespace DCBMS.UI
{
    public partial class TestWiseReport : Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                testWiseReportGridView.DataSource = table;
                testWiseReportGridView.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}