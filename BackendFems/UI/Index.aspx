<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BackendFems.UI.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = google.visualization.arrayToDataTable([
              ['Nombre', 'popularidad'],
              ['Limpieza Domestica', 1],
              ['NiÃ±era', 1],
              ['perros', 4]
          ]);
        var options = {
          title: 'My Daily Activities',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>            

    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
            
</asp:Content>
