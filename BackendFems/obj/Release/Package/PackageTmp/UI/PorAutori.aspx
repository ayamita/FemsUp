<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="PorAutori.aspx.cs" Inherits="BackendFems.UI.PorAutori" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" ></script>
    <link href="../Resourse/css/cardslider.css" rel="stylesheet" />    
      <style type="text/css">
      .PagerNormal
      {
        font: 12pt Verdana;
        color: #424242;
        border: solid 1px #778899;
        padding: 1px 4px;
        text-decoration:none;
      }
      .PagerCurrent
      {
        font: 12pt Verdana;
        border: solid 1px #778899;
        padding: 1px 4px;
        background-color: #F78181;
      }
    </style>
    <script>
        $('#myModal').on('shown.bs.modal', function () {
          $('#myInput').trigger('focus')
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <form runat="server">
        <section class="container p-t-3">
            <div class="row">
                <div class="col-lg-12">
                    <h1><span style="color: crimson">Usuarios</span> por Autorizar</h1>
                </div>
            </div>
        </section>
        <section class="carousel slide" data-ride="carousel" id="postsCarousel">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-right mb-4">
                        <asp:DataPager ID="DataPager1" PagedControlID="lstusuarios" PageSize="9" runat="server">  
                            <Fields>                              
                                <asp:NumericPagerField ButtonType="Button" ButtonCount="6"
                                    CurrentPageLabelCssClass="PagerCurrent"
                                    NextPreviousButtonCssClass="PagerNormal" 
                                    NumericButtonCssClass="PagerNormal"
                                    NextPageText=">>"
                                    PreviousPageText="<<" />
                            </Fields>  
                        </asp:DataPager>  
                    </div>
                </div>
            </div>          
            <div class="container p-t-0 m-t-2 carousel-inner">
                <div class="row row-equal carousel-item active m-t-0">
                    <asp:ListView ID="lstusuarios" runat="server" OnSelectedIndexChanged="ListView_SelectedIndexChanged" OnPagePropertiesChanging="lstusuarios_PagePropertiesChanging">                    
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server">
                            </asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>                            
                            <div class="col-md-4">                        
                                <div class="card">
                                    <div class="card-img-top card-img-top-250">
                                            <img src="<%#Eval("Imagen")%>" alt="Image placeholder" alt="Carousel 1" style="width:400px;height:300px;"/>                            
                                    </div>
                                    <div class="card-block p-t-2">
                                        <div class="card-header"><p style="text-align:center; font-size:larger; color:black;"><%#Eval("Nombres")%>&nbsp;<%#Eval("Apellidos")%></p></div>
                                        <div class="card-text">                                                
                                            <p style="text-align:center; font-size:large;"><%#Eval("Perfil")%></p>            
                                        </div>
                                        <div class="card-footer" style="text-align: center;">                                                   
                                           <p><a href="PorAutorizar.aspx?ID=<%#Eval("ID") %>&Correo=<%# Eval("Correo") %>&Nombres=<%# Eval("Nombres") %>&Apellidos=<%# Eval("Apellidos") %>&Telefono=<%# Eval("Telefono") %>&Sexo=<%# Eval("Sexo")%>&Curp=<%# Eval("Curp")%>&Perfil=<%# Eval("Perfil")%>&Imagen=<%# Eval("Imagen")%>">Ver más</a></p>    
                                        </div>                               
                                    </div>
                                </div>                          
                            </div>                            
                        </ItemTemplate>
                    </asp:ListView>                                          
                </div>           
            </div>            
        </section>
        
  </form>
</asp:Content>
