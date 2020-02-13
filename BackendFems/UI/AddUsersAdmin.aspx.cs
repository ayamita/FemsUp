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
    public partial class AddUsersAdmin : System.Web.UI.Page
    {
        Usuariosbo usu = new Usuariosbo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Radiom.Checked = false;
            Radiof.Checked = true;
            Grid();         
        }
        public void Grid()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetUsersAdmin";
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));            
            dgvDatos.DataSource = dt;
            dgvDatos.DataBind();
            ocultar_columnas();
        }
        public void ocultar_columnas()
        {
            dgvDatos.HeaderRow.Cells[2].Visible = false;         

            for (int i = 0; i < dgvDatos.Rows.Count; i++)
            {
                dgvDatos.Rows[i].Cells[2].Visible = false;                
            }
        }

        protected void dgvDatos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvDatos, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void dgvDatos_SelectedIndexChanged(object sender, EventArgs e)
        {            
            txt_id.Value = Convert.ToString(HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[0].Text));
            txt_correo.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[1].Text);
            txt_contra.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[2].Text);
            txt_Nombre.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[3].Text);
            txt_apellido.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[4].Text);
            txt_telefono.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[5].Text);
            usu.Sexo = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[6].Text);
            txt_curp.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[7].Text);
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

        protected void btn_add_Click(object sender, EventArgs e)
        {        
            string fecha = "20-02-2020 00:00:00";
            string foto = "foto";
            if (Radiom.Checked == true)
            {
                usu.Sexo = "M";
            }
            else
            {
                usu.Sexo = "F";
            }
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/AddUsuarioAdmin?email=" + txt_correo.Value + "&pass=" + txt_contra.Value
                + "&nombre=" + txt_Nombre.Value + "&apellido=" + txt_apellido.Value + "&telefono=" + txt_telefono.Value
            + "&sexo=" + usu.Sexo + "&curp=" + txt_curp.Value + "&fechanacimiento=" + fecha + "&fotoperfil=" + foto;
            var json = new WebClient().DownloadString(sUrlRequest);
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El usuario ha sido creado correctamente ', 'success')</script>");                       
            Grid();
            limpiar();
        }
        public void limpiar()
        {
            txt_id.Value = "";
            txt_correo.Value = "";
            txt_contra.Value = "";
            txt_Nombre.Value = "";
            txt_apellido.Value = "";            
            txt_telefono.Value = "";
            Radiof.Checked = false;
            Radiom.Checked = false;
            txt_curp.Value = "";
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            limpiar();
            Grid();
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {

        }
    }
}