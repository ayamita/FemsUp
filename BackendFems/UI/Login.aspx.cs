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
                Response.Write("<script>alert('Deben de capturar los campo Email y Contraseña')</script>");
            }
            else
            {                             
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/Login?email=" + txt_correo.Value + "&pass=" + txt_contra.Value
                    + "&perfil=" + 1;
                var json = new WebClient().DownloadString(sUrlRequest);
                if(json == "\"[{ mensaje : '1' }]\"" || json == "\"[{ mensaje : '1' }]\"")
                {
                    Response.Write("<script>alert('El correo o contraseña son incorrectas, intente de nuevo')</script>");                    
                }                                
                else
                {
                    DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("Index.aspx");
                    }
                }
            }
        }
    }
}