using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCBMS.UI
{
    public partial class UnpaidBillReport : System.Web.UI.Page
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