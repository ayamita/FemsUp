<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BackendFems.UI.Index" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">        
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
        function drawChart() {            
            var data = google.visualization.arrayToDataTable(<%=obtenerdatos()%>);
        var options = {
          title: 'Publicaciones según su categoría',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>                  
    <br /><br /><br /> <br /> <br />
    <form runat="server">           
        <div class="col-lg-12">                                          
            <div class="card">                 
                <h4 style="text-align:center">Fecha a consultar:</h4>                
                <input type="text" id="datepicker" runat="server"  name="text-input" placeholder="Fecha a consultar" class="date-own form-control" style="text-align:center; "/>
                <asp:Button id="btn_consultar" runat="server" Text="Consultar" OnClick="btn_consultar_Click" />
                <!--<input id="datepicker" style="text-align:center; "class="date-own form-control" type="text"/>-->
	            <script type="text/javascript">
                    $('.date-own').datepicker({
                        minViewMode: 1,
                        format: 'yyyy-mm'
                    });
	            </script>
                <!-- STATISTIC-->
                <section class="statistic statistic2">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--green">
                                    <h2 class="number"><%=AllPublic()%></h2>
                                    <span class="desc">Publicaciones</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--orange">
                                    <h2 class="number"><%=PublicRequest()%></h2>
                                    <span class="desc">Publicaciones Solicitadas</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--blue">
                                    <h2 class="number"><%=Porcentajetotal()%></h2>
                                    <span class="desc">Porcentaje de publicaciones solicitadas</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>            
                        </div>
                    </div>
                </section>
                <!-- END STATISTIC-->
                <div id="piechart_3d" style="width: 1000px; height: 500px;"></div>                
            </div>
        </div>
    </form>    
            
</asp:Content>
