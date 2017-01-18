using System.ComponentModel;
using System.Web.Script.Services;
using System.Web.Services;
using DCBMS.BLL;

namespace DCBMS.Services
{
    /// <summary>
    /// Summary description for AjaxHandler
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [ScriptService]
    public class AjaxHandler : WebService
    {
        TestRequestEntryHelper testRequestEntry = new TestRequestEntryHelper();
        [WebMethod]
        public string LoadTestFee(string testName)
        {
            return testRequestEntry.GetTestFee(testName).ToString("F");
        }
    }
}
