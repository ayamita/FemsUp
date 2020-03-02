function charts(data, ChartType) {
    var c = ChartType;
    var jsonData = data;
    google.load("visualization", "1", { packages: ["corechart"], callback: drawVisualization });
    function drawVisualization() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Tipo perfil');
        data.addColumn('number', 'Popularidad');
        $.each(jsonData, function (i, jsonData) {
            var value = jsonData.popularidad;
            var name = jsonData.tipoperfil;
            data.addRows([[name, value]]);
        });

        var options = {
            title: "",
            width: 850,
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
        else if (c == "GeoChart") // Geo Charts
            chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
    }
}

(function () {
    carga_todos();
})();

function carga_todos() {
    var url = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetPerfilUsu";
    $.getJSON(url, {
        format: "json"
    })
        .done(function (data) {
            charts(data, "ColumnChart");
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });


    var url2 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetAllPerfiles";
    $.getJSON(url2, {
        format: "json"
    })
        .done(function (data2) {
            $("#perfiles").val(data2);
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });

    var url3 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/GetAllUsers";
    $.getJSON(url3, {
        format: "json"
    })
        .done(function (data3) {
            $("#usuarios").val(data3);
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });
}