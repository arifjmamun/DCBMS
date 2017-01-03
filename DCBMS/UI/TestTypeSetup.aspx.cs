using System;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestType : System.Web.UI.Page
    {
        TestTypeHelper testTypeHelper = new TestTypeHelper();
        //Show Gridview as a table
        private void LoadGridView()
        {
            testTypeGridView.DataSource = testTypeHelper.GetAllTestType();
            testTypeGridView.DataBind();
        }

        //Show warning if the field is empty or has invalid data against Regular expression
        private void DisplayWarning()
        {
            if (Session["IsEmpty"] != null)
            {
                ArrayList errorInfo = (ArrayList)Session["IsEmpty"];
                if ((bool)errorInfo[0])
                {
                    warningPanel.Visible = true;
                    errorName.InnerHtml += (string)errorInfo[1];
                    errorText.InnerText = (string)errorInfo[2];
                    Session.Remove("IsEmpty");
                }
            }
            //Regular expression implementation uncompleted
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadGridView();
                DisplayWarning();
            }
        }

        protected void saveTestTypeBtn_Click(object sender, EventArgs e)
        {
            if (typeNameTextBox.Text == String.Empty)
            {
                Session["IsEmpty"] = new ArrayList
                {
                    true,
                    "Test Type is empty!",
                    "Test type cannot be empty! Enter valid test type!"
                };
                Response.Redirect("TestTypeSetup.aspx");
            }
            else
            {
                string testType = typeNameTextBox.Text;
                TestTypeDao newTestType = new TestTypeDao(testType);
                testTypeHelper.AddNewTestTye(newTestType);
                LoadGridView();
            }
        }
    }
}