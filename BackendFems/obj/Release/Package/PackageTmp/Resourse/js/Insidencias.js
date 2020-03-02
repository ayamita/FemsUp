
function charts(data, ChartType) {
    var c = ChartType;
    var jsonData = data;
    google.load("visualization", "1", { packages: ["corechart"], callback: drawVisualization });
    function drawVisualization() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Usuarios que reportan');
        data.addColumn('number', 'Popularidad');
        $.each(jsonData, function (i, jsonData) {
            var value = jsonData.popularidad;
            var name = jsonData.usuarioreportan;
            data.addRows([[name, value]]);
        });

        var options = {
            title: "",
            width: 800,
            height: 650,
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

        chart.draw(data, options);
    }
}

(function () {
    carga_todos();
})();

function carga_todos() {
    var url = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetUsuariosReportan";
    $.getJSON(url, {
        format: "json"
    })
        .done(function (data) {
            charts(data, "BarChart");
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });

    var url2 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetUsuariosReportados";
    $.getJSON(url2, {
        format: "json"
    })
        .done(function (data2) {
            charts(data2, "ColumnChart");
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });
}

function correo() {
    if ($("#from").val() != "") {                
        var url2 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetCorreoReportados";
        $.getJSON(url2, {
            correo: $("#from").val(),            
            format: "json"
        })
            .done(function (data2) {
                var result = JSON.stringify(data2) 
                $("#reportados").val(data2);
            }).fail(function (jqxhr, textStatus, error) {
                var err = textStatus + "," + error;
                console.log("Request Failed:" + err);
            });

        var url3 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetCorreoReportan";
        $.getJSON(url3, {
            correo: $("#from").val(),            
            format: "json"
        })
            .done(function (data3) {
                var result = JSON.stringify(data3) 
                $("#reportes").val(data3);
            }).fail(function (jqxhr, textStatus, error) {
                var err = textStatus + "," + error;
                console.log("Request Failed:" + err);
            });
    }
    else {
        carga_todos();
    }
} 

