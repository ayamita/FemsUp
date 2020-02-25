using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net;

namespace BackendFems.UI.Iframes
{
    public partial class PublicCate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string obtenerdatos()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetPublicCategory";
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable Datos = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
            string strDatos;
            strDatos = "[['Nombre','popularidad'],";
            int contenedor = Datos.Rows.Count;
            foreach (DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'" + dr[0] + "'" + "," + dr[1];

                contenedor = contenedor - 1;
                if (contenedor == 0)
                {
                    strDatos = strDatos + "]";
                }
                else
                {
                    strDatos = strDatos + "],";
                }
            }

            strDatos = strDatos + "]";
            return strDatos;
        }
        protected string AllPublic()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetAllPublic";
            var json = new WebClient().DownloadString(sUrlRequest);
            return json;
        }
        protected string AllPublicbyfecha(string inicio, string final)
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetAllPublicByDate?inicio=" + inicio + "&final=" + final;
            var json = new WebClient().DownloadString(sUrlRequest);
            return json;
        }
        protected string PublicRequest()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetPublicRequested";
            var json = new WebClient().DownloadString(sUrlRequest);
            return json;
        }
        protected string PublicRequestbyFecha(string inicio, string final)
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetPublicRequestedByDate?inicio=" + inicio + "&final=" + final;
            var json = new WebClient().DownloadString(sUrlRequest);
            return json;
        }
        protected string Porcentajetotal()
        {
            int pt = int.Parse(AllPublic());
            int ps = int.Parse(PublicRequest());
            decimal porcentaje = (ps * 100) / pt;
            return porcentaje + "%";
        }
        /*
        protected void btn_consultar_Click(object sender, EventArgs e)
        {
            string inicio = datepicker.Value + "-01";
            string final = datepicker.Value + "-31";

            AllPublicbyfecha(inicio, final);
            PublicRequestbyFecha(inicio, final);
            Porcentajetotal();

        }*/
    }
}