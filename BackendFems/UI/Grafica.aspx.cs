using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;

namespace BackendFems.UI
{
    public partial class Grafica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string AllPublic()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetAllPublic";
            var json = new WebClient().DownloadString(sUrlRequest);
            return json;
        }
    }
}