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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }
        protected string obtenerdatos()
        {
            string sUrlRequest = "https://localhost:44317/Service.asmx/chartsAllPublic";
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable Datos = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));

            string strDatos;
            strDatos = "[['Nombre','popularidad'],";

            foreach(DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'" + dr[0] + "'" + "," + dr[1];         
                strDatos = strDatos + "],";
            }            

            strDatos = strDatos + "]";
            return strDatos;
        }
    }
}