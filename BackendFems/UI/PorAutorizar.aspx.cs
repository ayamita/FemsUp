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
    public partial class UsersPorAutorizar : System.Web.UI.Page
    {
        Usuariosbo usu = new Usuariosbo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Radiom.Checked = false;
            Radiof.Checked = false;
            txt_Id.Value = Request.QueryString["ID"];
            txt_Nombre.Value = Request.QueryString["Nombres"];
            txt_apellido.Value = Request.QueryString["Apellidos"];
            txt_correo.Value = Request.QueryString["Correo"];
            txt_telefono.Value = Request.QueryString["Telefono"];
            txt_curp.Value = Request.QueryString["Curp"];
            txt_tusuario.Value = Request.QueryString["Perfil"];
            usu.Sexo = Request.QueryString["Sexo"];
            if (usu.Sexo == "M")
            {
                Radiom.Checked = true;
                Radiof.Checked = false;
            }
            else if (usu.Sexo == "F")
            {
                Radiom.Checked = false;
                Radiof.Checked = true;
            }
        }     

        protected void btn_Aprobar(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_Id.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes seleccionar un registro!', 'warning')</script>");
            }
            else
            {
                usu.Id = int.Parse(txt_Id.Value);
                int estatus = 1; //Cambiara el estatus a Aprobado
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/WebUpUserStatus?iduser=" + usu.Id + "&estatus=" + estatus;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El registro ha sido aprobado correctamente ', 'success')</script>");
            }              
            limpiar();            
        }

        public  void limpiar()
        {
            txt_Id.Value = "";
            txt_Nombre.Value = "";
            txt_apellido.Value = "";
            txt_correo.Value = "";
            txt_telefono.Value = "";
            Radiof.Checked = false;
            Radiom.Checked = false;
            txt_curp.Value = "";
            txt_tusuario.Value = "";
            //Redirige a la otra pagina
            Response.Redirect("PorAutori.aspx");
        }

        protected void btn_rechazar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_Id.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes seleccionar un registro!', 'warning')</script>");
            }
            else
            {
                usu.Id = int.Parse(txt_Id.Value);
                int estatus = 2; //Cambiara el estatus a Rechazado
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/WebUpUserStatus?iduser=" + usu.Id + "&estatus=" + estatus;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El registro ha sido rechazado correctamente ', 'success')</script>");
            }         
            limpiar();

        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}