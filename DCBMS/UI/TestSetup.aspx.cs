using System;
using System.Data;
using System.Web.UI;

namespace DCBMS.UI
{
    public partial class Test : Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                testGridView.DataSource = table;
                testGridView.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}