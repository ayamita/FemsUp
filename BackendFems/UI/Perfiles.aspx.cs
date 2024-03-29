﻿using System;
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
    public partial class Perfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Grid();
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
            txtperfil.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[1].Text);
        }

        public void Grid()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com//Service.asmx/WebPerfiles";
            var json = new WebClient().DownloadString(sUrlRequest);
            DataTable dt = (DataTable)JsonConvert.DeserializeObject(json, (typeof(DataTable)));
            dgvDatos.DataSource = dt;
            dgvDatos.DataBind();     
        }


        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtperfil.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes escribir un perfil!', 'warning')</script>");
            }
            else
            {
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebAddPerfil?perfil=" + txtperfil.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El perfil ha sido creado correctamente ', 'success')</script>");
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
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebUpdatePerfil?id=" + txtid.Value + "&perfil=" + txtperfil.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El perfil ha sido modificado correctamente ', 'success')</script>");
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
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebDeletePerfil?id=" + txtid.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El perfil ha sido eliminado correctamente ', 'success')</script>");
            }
            Grid();
            limpiar();
        }

        public void limpiar()
        {
            txtid.Value = "";
            txtperfil.Value = "";
        }
    }
}