using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BackendFems.UI
{
    public partial class Estatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid();
            }
               
        }
        protected void dgv_perfiles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvDatos, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void Seleccionar_registro(object sender, EventArgs e)
        {
            txtid.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[0].Text);            
            txtactividad.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[2].Text);            
            dropub.SelectedValue = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[3].Text);
        }

        public void Grid()
        {
            string sUrlRequest1= "https://localhost:44317/Service.asmx/GetCategorias";
            var json1 = new WebClient().DownloadString(sUrlRequest1);
            DataTable dt1 = (DataTable)JsonConvert.DeserializeObject(json1, (typeof(DataTable)));
            dropub.DataSource = dt1;
            dropub.DataTextField = "nombre";
            dropub.DataValueField = "id";
            dropub.DataBind();
            dropub.Items.Insert(0, "Seleccionar");
            dropub.SelectedIndex = 0;

            string sUrlRequest = "https://localhost:44317/Service.asmx/WebActividades";
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
            dgvDatos.DataSource = dt;
            dgvDatos.DataBind();
        }

        public void ocultar_columnas()
        {
            dgvDatos.HeaderRow.Cells[4].Visible = false;

            for (int i = 0; i < dgvDatos.Rows.Count; i++)
            {
                dgvDatos.Rows[i].Cells[4].Visible = false;
            }
        }


        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtactividad.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes escribir una Acitividad!', 'warning')</script>");
            }
            else
            {
                string sUrlRequest = "https://localhost:44317/Service.asmx/WebAddActividades?idcate="+ dropub.SelectedValue + "&actividad=" + txtactividad.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'La actividad ha sido creado correctamente ', 'success')</script>");
            }
            Grid();
            limpiar();
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtid.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes seleccionar un registro!', 'warning')</script>");
            }
            else
            {
                string sUrlRequest = "https://localhost:44317/Service.asmx/WebUpdateActividad?id=" + txtid.Value + "&idcate=" + dropub.SelectedValue + "&actividades=" + txtactividad.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'La actividad ha sido modificado correctamente ', 'success')</script>");
            }
            Grid();
            limpiar();
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtid.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes seleccionar un registro!', 'warning')</script>");
            }
            else
            {
                string sUrlRequest = "https://localhost:44317/Service.asmx/WebDeleteActividad?id=" + txtid.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'La actividad ha sido eliminado correctamente ', 'success')</script>");
            }
            Grid();
            limpiar();
        }

        public void limpiar()
        {
            txtid.Value = "";
            dropub.SelectedIndex = 0;
            txtactividad.Value = "";
        }
    }
}
