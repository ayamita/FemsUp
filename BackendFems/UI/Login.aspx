<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BackendFems.UI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('../ResourseLogin/images/bg-01.jpg');"></div>
			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">				
					<span class="login100-form-title p-b-59">
						Sign Up
					</span>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<input type="text" ID="txt_correo" runat="server"  name="text-input" placeholder="Correo de Usuario" class="form-control" />
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input type="password" ID="txt_contra" runat="server"  name="text-input" placeholder="Contraseña" class="form-control" />
						<span class="focus-input100"></span>
					</div>

					<div class="flex-m w-full p-b-33">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								<span class="txt1">
									Recordar contraseña
								</span>
							</label>
						</div>						
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<asp:Button ID="btn_login" runat="server" Text="Login"  class="login100-form-btn" BackColor="#4272d7" ForeColor="White" OnClick="btn_login_Click" /> 							
						</div>						
					</div>				
				</div>
			</div>
		</div>
	
</asp:Content>
