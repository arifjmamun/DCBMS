using System;
using System.Data;
using System.Web.UI;

namespace DCBMS.UI
{
    public partial class TypeWiseReport : Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                typeWiseReportGridView.DataSource = table;
                typeWiseReportGridView.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}