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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[2]
                {
                    new DataColumn("Sl", typeof(int)), 
                    new DataColumn("Type Name", typeof(string))
                });
                dt.Rows.Add(1, "Blood");
                dt.Rows.Add(2, "X-Ray");
                testTypeGridView.DataSource = dt;
                testTypeGridView.DataBind();
            }
        }
    }
}