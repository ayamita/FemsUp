<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafica.aspx.cs" Inherits="BackendFems.UI.Grafica" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>        

    <!-- Fontfaces CSS-->
    <link href="../Resourse/css/font-face.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all"/>

    <!-- Bootstrap CSS-->
    <link href="../Resourse/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all"/>

    <!-- Vendor CSS-->    
    <link href="../Resourse/vendor/animsition/animsition.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/wow/animate.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/slick/slick.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/select2/select2.min.css" rel="stylesheet" media="all"/>
    <link href="../Resourse/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all"/>

    <!-- Main CSS-->
    <link href="../Resourse/css/theme.css" rel="stylesheet" media="all"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="/resources/demos/style.css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" ></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
    <script>
        $(function () {
            $("#to").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#from").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change", function () {
                var minValue = $(this).val();
                minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
                minValue.setDate(minValue.getDate() + 1);
                $("#to").datepicker("option", "minDate", minValue);
            })
        });
    </script>       
    <script>    
        function charts(data, ChartType) {
            var c = ChartType;
            var jsonData = data;
            google.load("visualization", "1", { packages: ["corechart"], callback: drawVisualization });
            function drawVisualization() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Nombre');
                data.addColumn('number', 'Popularidad');
                $.each(jsonData, function (i, jsonData) {
                    var value = jsonData.popularidad;
                    var name = jsonData.nombre;
                    data.addRows([[name, value]]);
                });

                var options = {
                    title: "Publicaciones según su categoria",
                    width: 1200,
                    height: 600,
                    animation: {
                        duration: 3000,
                        easing: 'out',
                        startup: true
                    },
                    colorAxis: { colors: ['#54C492', '#cc0000'] },
                    datalessRegionColor: '#dedede',
                    defaultColor: '#dedede'
                };

                var chart;
                if (c == "ColumnChart") // Column Charts
                    chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                else if (c == "PieChart") // Pie Charts
                    chart = new google.visualization.PieChart(document.getElementById('piechart_div'));
                else if (c == "BarChart") // Bar Charts
                    chart = new google.visualization.BarChart(document.getElementById('bar_div'));
                else if (c == "GeoChart") // Geo Charts
                    chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

                chart.draw(data, options);
            }
        }
        (function () {
            carga_todos();       
        })();

        function carga_todos() {
            var url = "http://localhost/Service/Service.asmx/GetPublicCategory";
            $.getJSON(url, {
                format: "json"
            })
                .done(function (data) {
                    charts(data, "PieChart");
                }).fail(function (jqxhr, textStatus, error) {
                    var err = textStatus + "," + error;
                    console.log("Request Failed:" + err);
                });

            var url2 = "http://localhost/Service/Service.asmx/GetPublicRequested";
            $.getJSON(url2, {
                format: "json"
            })
                .done(function (data2) {
                    $("#solicitudes").val(data2);
                }).fail(function (jqxhr, textStatus, error) {
                    var err = textStatus + "," + error;
                    console.log("Request Failed:" + err);
                });

            var url3 = "http://localhost/Service/Service.asmx/GetAllPublic";
            $.getJSON(url3, {
                format: "json"
            })
                .done(function (data3) {
                    $("#publicaciones").val(data3);
                }).fail(function (jqxhr, textStatus, error) {
                    var err = textStatus + "," + error;
                    console.log("Request Failed:" + err);
                });
        }
     
        function fecha() {
            if ($("#from").val() != "" && $("#to").val() != "") {
                var url = "http://localhost/Service/Service.asmx/GetPublicCategoryDate";  
                $.getJSON(url, {
                    inicio: $("#from").val(),
                    final: $("#to").val(),
                    format: "json"
                })
                    .done(function (data) {
                        charts(data, "PieChart");
                    }).fail(function (jqxhr, textStatus, error) {
                        var err = textStatus + "," + error;
                        console.log("Request Failed:" + err);
                    });

                var url2 = "http://localhost/Service/Service.asmx/GetPublicRequestedByDate";
                $.getJSON(url2, {
                    inicio: $("#from").val(),
                    final: $("#to").val(),
                    format: "json"
                })
                    .done(function (data2) {
                        $("#solicitudes").val(data2);
                    }).fail(function (jqxhr, textStatus, error) {
                        var err = textStatus + "," + error;
                        console.log("Request Failed:" + err);
                    });

                var url3 = "http://localhost/Service/Service.asmx/GetAllPublicByDate";
                $.getJSON(url3, {
                    inicio: $("#from").val(),
                    final: $("#to").val(),
                    format: "json"
                })
                    .done(function (data3) {
                        $("#publicaciones").val(data3);
                    }).fail(function (jqxhr, textStatus, error) {
                        var err = textStatus + "," + error;
                        console.log("Request Failed:" + err);
                    });
            }
            else {
                carga_todos();
            }

        }

    </script>

</head>
<body>
    <form id="form1" name="form1" runat="server">   
        <div class="row">
            <div class="col-lg-3">
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <strong>Filtar por Fecha</strong>
                    </div>
                    <div class="card-body card-block">                
                        <div class="form-group">
                            <label for="exampleInputName2" class="pr-1  form-control-label">Fecha inicio:</label>
                            <input type="text" id="from" placeholder="Jane Doe" required="" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName2" class="pr-1  form-control-label">Fecha final:</label>
                            <input type="text" id="to" placeholder="Jane Doe" required="" class="form-control"/>
                        </div>              
                    </div>
                    <div class="card-footer">
                        <button type="button" class="btn btn-primary" onclick="fecha()">Buscar</button>                
                    </div>
                </div>
            </div>     
        </div>           
        <!-- STATISTIC-->
            <section class="statistic statistic2">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="statistic__item statistic__item--green">
                                <input type="text" class="number" name="publicaciones" id="publicaciones" style="background: transparent; color:#fff";/>
                                <span class="desc">Publicaciones</span>
                            <div class="icon">
                                <i class="zmdi zmdi-account-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="statistic__item statistic__item--orange">
                            <input type="text" class="number" name="solicitudes" id="solicitudes" style="background: transparent; color:#fff;"/>
                            <span class="desc">Publicaciones Solicitadas</span>
                            <div class="icon">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                        </div>
                    </div>                        
                </div>
            </div>
        </section>
        <!-- END STATISTIC-->                
        <div id="piechart_div"></div>                                                                   	                           
    </form>
</body>
</html>
