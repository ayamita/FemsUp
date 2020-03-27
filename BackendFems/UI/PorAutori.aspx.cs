using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;
using System.Net;
using BackendFems.BO;

namespace BackendFems.UI
{
    public partial class PorAutori : System.Web.UI.Page
    {
        Usuariosbo usu = new Usuariosbo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid();
            }
            
        }

        public void Grid()
        {
            int estatus = 3; //Mostrara Usuarios por Aprobar
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetUsersEstatus?estatus=" + estatus;
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
            lstusuarios.DataSource = dt;
            lstusuarios.DataBind();
        }

        protected void ListView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lstusuarios_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex,e.MaximumRows,false);
            Grid();
        }
                
    }
}