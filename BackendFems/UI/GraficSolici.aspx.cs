using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackendFems.UI
{
    public partial class GraficSolici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ifrm.Attributes["src"] = "Grafic/Top3.aspx";
        }
    }
}