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
    public partial class Rechazados : System.Web.UI.Page
    {
        Usuariosbo usu = new Usuariosbo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Radiom.Checked = false;
            Radiof.Checked = false;
            Grid();
        }

        protected void dgv_usuario_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvDatos, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void Seleccionar_registro(object sender, EventArgs e)
        {
            txt_Id.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[0].Text);
            txt_correo.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[1].Text);
            txt_Nombre.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[2].Text);
            txt_apellido.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[3].Text);
            txt_telefono.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[4].Text);
            usu.Sexo = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[5].Text);
            txt_curp.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[6].Text);
            txt_tusuario.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[7].Text);
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

        public void Grid()
        {
            int estatus = 2; //Mostrara Usuarios Rechazados
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetUsersEstatus?estatus=" + estatus;
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
            dgvDatos.DataSource = dt;
            dgvDatos.DataBind();
        }

        public void limpiar()
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
        }

        protected void btn_activar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_Id.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes seleccionar un registro!', 'warning')</script>");
            }
            else
            {
                usu.Id = int.Parse(txt_Id.Value);
                int estatus = 3; //Cambiara el estatus a por Autorizar
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/WebUpUserStatus?iduser=" + usu.Id + "&estatus=" + estatus;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El registro se activo nuevamente ', 'success)</script>");
            }
            Grid();
            limpiar();
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}