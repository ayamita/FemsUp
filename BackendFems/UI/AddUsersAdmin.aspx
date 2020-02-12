<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="AddUsersAdmin.aspx.cs" Inherits="BackendFems.UI.AddUsersAdmin" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BREADCRUMB-->
        <form runat="server"><br /><br /><br /><br />
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><strong>Crear Usuarios</strong><small> Form</small></div>
                    <div class="card-body card-block">     
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">ID:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_id" runat="server"  name="text-input" placeholder="ID" class="form-control" disabled/></div>
                        </div>     
                        <div class="row form-group">                
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Correo:</label></div>
                            <div class="col-12 col-md-4"><input type="email" ID="txt_correo" runat="server"  name="text-input" placeholder="Correo" class="form-control" /></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Contraseña:</label></div>
                            <div class="col-12 col-md-4"><input type="password" ID="txt_contra" runat="server"  name="text-input" placeholder="Contraseña" class="form-control" /></div>
                        </div>                      
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Nombre:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_Nombre" runat="server"  name="text-input" placeholder="Nombre de usuario" class="form-control" /></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Apellidos:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_apellido" runat="server"  name="text-input" placeholder="Apellidos" class="form-control" /></div>
                        </div>                      
                        <div class="row form-group">                            
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Teléfono:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_telefono" runat="server"  name="text-input" placeholder="Teléfono" class="form-control" /></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Curp:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_curp" runat="server"  name="text-input" placeholder="Curp" class="form-control" /></div>
                        </div>                                                                                                                                                    
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Sexo:</label></div>
                            <div class="col-12 col-md-4">
                                <asp:RadioButton id="Radiof" Text=" Femenino" Checked="True" GroupName="RadioGroup1" runat="server" /> <br />
                                <asp:RadioButton id="Radiom" Text=" Masculino" Checked="True" GroupName="RadioGroup1" runat="server" /> <br /><br />  
                            </div>                                                    
                        </div>                                                                                  
                        <div class="modal-footer"> 
                            <asp:Button ID="btn_add" runat="server" Text="Agregar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_add_Click"  /> 
                            <asp:Button ID="btn_update" runat="server" Text="Modificar"  class="btn" BackColor="#4272d7" ForeColor="White" />
                            <asp:Button ID="btn_limpiar" runat="server" Text="Limpiar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_limpiar_Click"  /> 
                            <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_eliminar_Click" /> 
                        </div>                
                    </div>                
                 </div>
            </div>                        
        <!-- END BREADCRUMB-->                  
            <div class="col-lg-12">
                <div class="card">                 
                    <div class="card-body card-block">
                        <div class="col-lg-10">
                            <asp:GridView ID="dgvDatos" runat="server" CellPadding="4" ForeColor="#ffffff" GridLines="None" OnRowDataBound="dgvDatos_RowDataBound" OnSelectedIndexChanged="dgvDatos_SelectedIndexChanged">
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
