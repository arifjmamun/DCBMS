using System;
using System.Data;
using System.Web.UI;

namespace DCBMS.UI
{
    public partial class TestRequest : Page
    {
        private void InitiateGridView()
        {
            if (!this.IsPostBack)
            {
                DataTable table = new DataTable();
                testRequestEntryGridView.DataSource = table;
                testRequestEntryGridView.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitiateGridView();
        }
    }
}