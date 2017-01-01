using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCBMS.UI
{
    public partial class TestType : System.Web.UI.Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                testTypeGridView.DataSource = table;
                testTypeGridView.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}