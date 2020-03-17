$(function () {
    $("#to").datepicker({ dateFormat: 'yy-mm-dd' });
    $("#from").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change", function () {
        var minValue = $(this).val();
        minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
        minValue.setDate(minValue.getDate() + 1);
        $("#to").datepicker("option", "minDate", minValue);
    })
});

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
        if (c == "PieChart") // Column Charts
            chart = new google.visualization.ColumnChart(document.getElementById('piechart_div'));
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
    var url = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetPublicCategory";
    $.getJSON(url, {
        format: "json"
    })
        .done(function (data) {
            charts(data, "PieChart");
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });

    //Cambiar
    var url1 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetPublicCategory";
    $.getJSON(url1, {
        format: "json"
    })
        .done(function (data1) {
            charts(data1, "ColumnChart");
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });

    var url2 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetAllCategory";
    $.getJSON(url2, {
        format: "json"
    })
        .done(function (data2) {
            $("#solicitudes").val(data2);
        }).fail(function (jqxhr, textStatus, error) {
            var err = textStatus + "," + error;
            console.log("Request Failed:" + err);
        });

    var url3 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetAllPublic";
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
        var url = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetPublicCategoryDate";
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

        var url1 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetPublicCategoryDate";
        $.getJSON(url1, {
            inicio: $("#from").val(),
            final: $("#to").val(),
            format: "json"
        })
            .done(function (data1) {
                charts(data1, "ColumnChart");
            }).fail(function (jqxhr, textStatus, error) {
                var err = textStatus + "," + error;
                console.log("Request Failed:" + err);
            });

        var url2 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetAllCategoryByDate";
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

        var url3 = "http://alexander14-001-site1.dtempurl.com/Service.asmx/WebGetAllPublicByDate";
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