using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCBMS.UI
{
    public partial class TypeWiseReport : System.Web.UI.Page
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