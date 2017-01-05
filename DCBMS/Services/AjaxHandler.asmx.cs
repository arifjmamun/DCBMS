using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DCBMS.Middleware;

namespace DCBMS.Services
{
    /// <summary>
    /// Summary description for AjaxHandler
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AjaxHandler : System.Web.Services.WebService
    {
        TestRequestEntryHelper testRequestEntry = new TestRequestEntryHelper();
        [WebMethod]
        public string LoadTestFee(string testName)
        {
            return testRequestEntry.GetTestFee(testName).ToString("F");
        }
    }
}
