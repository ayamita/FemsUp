<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="Aprobados.aspx.cs" Inherits="BackendFems.UI.Aprobados" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- BREADCRUMB-->
        <form runat="server"><br /><br /><br /><br />
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><strong>Usuarios Aprobados </strong><small> Form</small></div>
                    <div class="card-body card-block">
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Id:</label></div>
                            <div class="col-12 col-md-4"><input type="text" id="txt_Id"  runat="server"  name="text-input" placeholder="Id de usuario" class="form-control"  disabled/></div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Nombre:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_Nombre" runat="server"  name="text-input" placeholder="Nombre de usuario" class="form-control"  disabled/></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Apellidos:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_apellido" runat="server"  name="text-input" placeholder="Apellidos" class="form-control"  disabled/></div>
                        </div>                      
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Correo:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_correo" runat="server"  name="text-input" placeholder="Correo de Usuario" class="form-control"  disabled/></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Teléfono:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_telefono" runat="server"  name="text-input" placeholder="Teléfono" class="form-control"  disabled/></div>
                        </div>                                                                                                                                                    
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Sexo:</label></div>
                            <div class="col-12 col-md-4">
                                <asp:RadioButton id="Radiof" Text=" Femenino" Checked="True" GroupName="RadioGroup1" runat="server" /> <br />
                                <asp:RadioButton id="Radiom" Text=" Masculino" Checked="True" GroupName="RadioGroup1" runat="server" /> <br />
                            </div>                        
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Curp:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_curp" runat="server"  name="text-input" placeholder="Curp" class="form-control"  disabled/></div>
                        </div>                             
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Tipo de Usuario:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_tusuario" runat="server"  name="text-input" placeholder="Tipo de Usuario" class="form-control"  disabled/></div>
                        </div>                                  
                        <div class="modal-footer">                                                  
                            <asp:Button ID="btn_rechazar" runat="server" Text="Rechazar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_rechazar_Click" />
                            <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_limpiar_Click"  /> 
                        </div>                
                    </div>                
                 </div>
            </div>                        
        <!-- END BREADCRUMB-->                  
            <div class="col-lg-12">
                <div class="card">                 
                    <div class="card-body card-block">
                        <div class="col-lg-10">
                            <asp:GridView ID="dgvDatos" runat="server" CellPadding="4" ForeColor="#ffffff" GridLines="None" OnRowDataBound="dgv_usuario_RowDataBound" OnSelectedIndexChanged="Seleccionar_registro">
                                <AlternatingRowStyle BackColor="White" />
                                <FooterStyle BackColor="#4272d7" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#4272d7 " Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFFFFF" ForeColor="#4272d7" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFFFF" ForeColor="#4272d7" />
                                <SelectedRowStyle BackColor="#BD3D67" Font-Bold="True" ForeColor="#FFFFFF" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                        </div>     
                    </div>
                </div>
            </div>
        </form>         
</asp:Content>
