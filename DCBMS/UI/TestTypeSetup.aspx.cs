using System;
using System.Collections;
using System.Web.UI;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;

namespace DCBMS.UI
{
    public partial class TestType : Page
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
            if (ViewState["IsEmpty"] != null)
            {
                ArrayList errorInfo = (ArrayList)ViewState["IsEmpty"];
                if ((bool)errorInfo[0])
                {
                    warningPanel.Visible = true;
                    errorName.InnerHtml = "<i class='icon fa fa-warning'></i>"+(string)errorInfo[1];
                    errorText.InnerText = (string)errorInfo[2];
                    ViewState.Clear();
                }
            }
            else
            {
                warningPanel.Visible = false;
            }
            //Regular expression implementation uncompleted
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadGridView();
            }
        }

        protected void saveTestTypeBtn_Click(object sender, EventArgs e)
        {
            if (typeNameTextBox.Text == String.Empty)
            {
                ViewState["IsEmpty"] = new ArrayList
                {
                    true,
                    "Test Type is empty!",
                    "Test type cannot be empty! Enter valid test type!"
                };
            }
            else
            {
                string testType = typeNameTextBox.Text;
                TestTypeDao newTestType = new TestTypeDao(testType);
                testTypeHelper.AddNewTestTye(newTestType);
                LoadGridView();
            }
            DisplayWarning();
        }
    }
}