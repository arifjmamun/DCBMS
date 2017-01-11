using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DCBMS.DLL.DAO;
using DCBMS.Middleware;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Color = System.Drawing.Color;

namespace DCBMS.UI
{
    public partial class TestRequest : Page
    {
        private int testCount;
        TestRequestEntryHelper testRequestEntryHelper = new TestRequestEntryHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridView();
                LoadAllTestName();
                feeTextBox.Attributes.Add("readonly", "readonly");
                totalTextBox.Attributes.Add("readonly", "readonly");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void addRequestEntryBtn_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" &&
                selectTestDropDown.SelectedIndex != 0 && feeTextBox.Text != "")
            {
                string testName = selectTestDropDown.SelectedValue;
                decimal testFee = Convert.ToDecimal(feeTextBox.Text);
                TestInfo newTest;

                if (ViewState["TestList"] != null)
                {
                    newTest = new TestInfo(testName, testFee);
                    bool isTestAdded = false;
                    foreach (TestInfo testInfo in (List<TestInfo>)ViewState["TestList"])
                    {
                        if (testInfo.TestName == testName)
                        {
                            ViewState["HasError"] = new ArrayList
                            {
                                true,
                                "Test already added!",
                                "The test already added and the test cannot be added multiple time for a patient."
                            };
                            isTestAdded = true;
                            break;
                        }
                    }
                    if (!isTestAdded)
                    {
                        testCount = (ViewState["TestCount"] != null) ? (int)ViewState["TestCount"] : 0;
                        ViewState["TestCount"] = ++testCount;
                        newTest.TestSerial = (int)ViewState["TestCount"];
                        List<TestInfo> testList = (List<TestInfo>)ViewState["TestList"];
                        testList.Add(newTest);
                        ShowTestInfoInGridview(newTest);
                        CalculateTotalAmount();
                    }
                }
                else
                {
                    newTest = new TestInfo(testName, testFee);
                    testCount = (ViewState["TestCount"] != null) ? (int)ViewState["TestCount"] : 0;
                    ViewState["TestCount"] = ++testCount;
                    newTest.TestSerial = (int)ViewState["TestCount"];
                    List<TestInfo> testList = new List<TestInfo>();
                    testList.Add(newTest);
                    ViewState["TestList"] = testList;
                    ShowTestInfoInGridview(newTest);
                    CalculateTotalAmount();
                }
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Invalid Data!",
                    "None of the field(s) cannot be empty, You have to must select a Test Name & Test Fee should be numeric value."
                };
            }
            DisplayWarning();
        }

        protected void saveEntriesButton_Click(object sender, EventArgs e)
        {
            if (patientNameTextBox.Text != "" && dobTextBox.Text != "" && mobileNoTextBox.Text != "" && ViewState["TestList"] != null)
            {
                string patientName = patientNameTextBox.Text;
                string birthDate = dobTextBox.Text;
                string mobileNumber = mobileNoTextBox.Text;
                BillInfo newBillInfo = new BillInfo((List<TestInfo>)ViewState["TestList"]);
                PatientInfo newPatientInfo = new PatientInfo(patientName, mobileNumber, birthDate, newBillInfo);
                testRequestEntryHelper.SavePatientBillInfo(newPatientInfo);
                GeneratePdfFileBill(newPatientInfo);
                ClearInformation();
            }
            else
            {
                ViewState["HasError"] = new ArrayList
                {
                    true,
                    "Invalid Data!",
                    "None of the field(s) cannot be empty, You have to must select a Test Name & Test Fee should be numeric value."
                };
            }
            DisplayWarning();
        }

        //Show Gridview as a table
        private void LoadGridView()
        {
            DataTable table = new DataTable();
            table.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("SL", typeof(string)), 
                new DataColumn("Test", typeof(string)),
                new DataColumn("Fee", typeof(decimal)),
            });
            testRequestEntryGridView.DataSource = table;
            testRequestEntryGridView.DataBind();
            ViewState["DataTable"] = table;
        }

        // Load All Test Name into Dropdown
        private void LoadAllTestName()
        {
            List<string> testNameList = testRequestEntryHelper.GetAllTestName();
            foreach (string testName in testNameList)
            {
                selectTestDropDown.Items.Add(testName);
            }
        }

        //Show warning if the field is empty or has invalid data against Regular expression
        private void DisplayWarning()
        {
            if (ViewState["HasError"] != null)
            {
                ArrayList errorInfo = (ArrayList)ViewState["HasError"];
                if ((bool)errorInfo[0])
                {
                    warningPanel.Visible = true;
                    errorName.InnerHtml = "<i class='icon fa fa-warning'></i>" + (string)errorInfo[1];
                    errorText.InnerText = (string)errorInfo[2];
                    ViewState["HasError"] = null;
                }
            }
            else
            {
                warningPanel.Visible = false;
            }
            //Regular expression implementation uncompleted
        }

        // Calculate Total amount of Test(s)
        private void CalculateTotalAmount()
        {
            decimal totalAmount = 0;
            foreach (TestInfo testInfo in (List<TestInfo>)ViewState["TestList"])
            {
                totalAmount += testInfo.TestFee;
            }
            totalTextBox.Text = totalAmount.ToString("F");
        }

        // Add test info in gridview with button click event
        private void ShowTestInfoInGridview(TestInfo newTest)
        {
            DataTable table = (DataTable)ViewState["DataTable"];
            DataRow newRow = table.NewRow();
            newRow[0] = newTest.TestSerial;
            newRow[1] = newTest.TestName;
            newRow[2] = newTest.TestFee;
            table.Rows.Add(newRow);
            testRequestEntryGridView.DataSource = table;
            testRequestEntryGridView.DataBind();
        }

        // Clear info from ViewState after save the Data to Database
        private void ClearInformation()
        {
            ViewState.Clear();
            testRequestEntryGridView.DataSource = new DataTable();
            testRequestEntryGridView.DataBind();
            patientNameTextBox.Text = String.Empty;
            dobTextBox.Text = String.Empty;
            mobileNoTextBox.Text = String.Empty;
            selectTestDropDown.SelectedIndex = 1;
            feeTextBox.Text = String.Empty;
            totalTextBox.Text = String.Empty;
            //Response.Redirect("TestRequestEntry.aspx");

        }
        private void GeneratePdfFileBill(PatientInfo newPatientInfo)
        {
            invoiceWrapper.Visible = true;
            patientBillGridview.DataSource = newPatientInfo.BillInfo.TestList;
            patientBillGridview.HeaderStyle.BackColor = Color.Silver;
            patientBillGridview.HeaderStyle.Font.Bold = true;
            patientBillGridview.DataBind();

            billIdLabel.Text = newPatientInfo.BillInfo.BillId;
            billdateLabel.Text = newPatientInfo.BillInfo.BillDate;
            patientNameLabel.Text = newPatientInfo.PatientName;
            birthDateLabel.Text = newPatientInfo.BirthDate;
            mobileNumberLabel.Text = newPatientInfo.MobileNumber;
            mobileNumberLabel.Text = newPatientInfo.MobileNumber;
            totalAmountLabel.Text = newPatientInfo.BillInfo.TotalAmount.ToString("F");
            totalAmountLabel.Text = newPatientInfo.BillInfo.TotalAmount.ToString("F");
            RenderPdfFile(newPatientInfo.BillInfo.BillId);
        }

        private void RenderPdfFile(string billId)
        {
            int rowCount = testRequestEntryGridView.Rows.Count;
            if (rowCount > 0)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename="+billId+".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                invoiceWrapper.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
            }
        }

    }
}