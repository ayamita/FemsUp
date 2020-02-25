<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicCate.aspx.cs" Inherits="BackendFems.UI.Iframes.PublicCate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css"/>    
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>     
    
    <!-- Bootstrap CSS-->
    <link href="../../Resourse/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all"/>

    <!-- Main CSS-->
    <link href="../../Resourse/css/theme.css" rel="stylesheet" media="all"/>
    <link href="../../Resourse/css/sweetalert.css" rel="stylesheet" />
    <script src="../../Resourse/js/sweetalert.min.js" type="text/javascript"></script>
    <script src="../../Resourse/js/sweetalert.js" type="text/javascript"></script>
</head>
<body>
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
    <form id="form1" runat="server">         
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

        <!-- GRAFIC-->
        <div id="piechart_3d" style="width: 1000px; height: 500px;"></div>                            
        <!-- END GRAFIC-->
    </form>
</body>    
</html>

