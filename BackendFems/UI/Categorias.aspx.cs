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
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Grid();
        }
        protected void dgv_categoria_RowDataBound(object sender, GridViewRowEventArgs e)
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
            txtcate.Value = HttpUtility.HtmlDecode(dgvDatos.SelectedRow.Cells[1].Text);
        }

        public void Grid()
        {
            string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/service.asmx/GetCategorias";
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


        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtcate.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Espera!', 'Debes escribir una categoría!', 'warning')</script>");
            }
            else
            {
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebAddCategory?category=" + txtcate.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'La categoria ha sido creada correctamente ', 'success')</script>");
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
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebUpdateCategor?id=" + txtid.Value + "&category=" + txtcate.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'La categoria ha sido modificada correctamente ', 'success')</script>");
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
                string sUrlRequest = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebDeleteCategory?id=" + txtid.Value;
                var json = new WebClient().DownloadString(sUrlRequest);
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Proceso completado', 'El perfil ha sido eliminado correctamente ', 'success')</script>");
            }
            Grid();
            limpiar();
        }

        public void limpiar()
        {
            txtid.Value = "";
            txtcate.Value = "";
        }

    }
}