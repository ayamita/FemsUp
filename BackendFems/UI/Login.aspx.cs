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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(txt_correo.Value) || string.IsNullOrEmpty(txt_contra.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Deben de capturar el Email y  laContraseña ', 'warning')</script>");
            }
            else
            {                             
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/Login?email=" + txt_correo.Value + "&pass=" + txt_contra.Value
                    + "&perfil=" + 1;
                var json = new WebClient().DownloadString(sUrlRequest);
                if(json == "\"[{ mensaje : '1' }]\"" || json == "\"[{ mensaje : '1' }]\"")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error!', 'El correo o contraseña son incorrectas, intente de nuevo!', 'error')</script>");      
                }                                
                else
                {
                    DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
                    if (dt.Rows.Count > 0)                    
                        Response.Redirect("GraficPublica.aspx");
                    }
                }
            }
        }
    }
