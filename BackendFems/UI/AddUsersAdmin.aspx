<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="AddUsersAdmin.aspx.cs" Inherits="BackendFems.UI.AddUsersAdmin" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BREADCRUMB-->
        <form runat="server"><br /><br /><br /><br />
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><strong>Crear Usuarios Administrativos </strong><small> Form</small></div>
                    <div class="card-body card-block">     
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">ID:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_id" runat="server"  name="text-input" placeholder="ID" class="form-control" disabled /></div>
                        </div>     
                        <div class="row form-group">                
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Correo:</label></div>
                            <div class="col-12 col-md-4"><input type="email" ID="txt_correo" runat="server"  name="text-input" placeholder="Correo" class="form-control"  required="required" oninvalid="setCustomValidity('Ingrese una Correo')" oninput="setCustomValidity('')" maxlength="30" /></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Contraseña:</label></div>
                            <div class="col-12 col-md-4"><input type="password" ID="txt_contra" runat="server"  name="password" placeholder="Contraseña" class="form-control" required="required" oninvalid="setCustomValidity('Ingrese una Contraseña')" oninput="setCustomValidity('')" maxlength="20" /></div>
                        </div>                      
                        <div class="row form-group">
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Nombre:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_Nombre" runat="server"  name="text-input" placeholder="Nombre de usuario" class="form-control" required="required" oninvalid="setCustomValidity('Ingrese un Nombre')" oninput="setCustomValidity('')" maxlength="25" /></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Apellidos:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_apellido" runat="server"  name="text-input" placeholder="Apellidos" class="form-control" required="required" oninvalid="setCustomValidity('Ingrese un Apellido')" oninput="setCustomValidity('')" maxlength="25"/></div>
                        </div>                      
                        <div class="row form-group">                            
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Teléfono:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_telefono" runat="server"  name="text-input" placeholder="Teléfono" class="form-control" required="required" oninvalid="setCustomValidity('Ingrese un Télefono')" oninput="setCustomValidity('')" maxlength="10"/></div>
                            <div class="col col-md-2"><label for="text-input" class=" form-control-label">Curp:</label></div>
                            <div class="col-12 col-md-4"><input type="text" ID="txt_curp" runat="server"  name="text-input" placeholder="Curp" class="form-control" required="required" oninvalid="setCustomValidity('Ingrese un CURP')" oninput="setCustomValidity('')" maxlength="18"/></div>
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
                            <asp:Button ID="btn_update" runat="server" Text="Modificar"  class="btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_update_Click" />
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
                            <asp:GridView ID="dgvDatos" runat="server" CellPadding="4" ForeColor="#ffffff" GridLines="None" OnRowDataBound="dgvDatos_RowDataBound" OnSelectedIndexChanged="dgvDatos_SelectedIndexChanged" Width="950px">
                                <AlternatingRowStyle BackColor="White" />
                                <FooterStyle BackColor="#424242" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#424242 " Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFFFFF" ForeColor="#424242" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFFFF" ForeColor="#424242" />
                                <SelectedRowStyle BackColor="#424242" Font-Bold="True" ForeColor="#FFFFFF" />
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
