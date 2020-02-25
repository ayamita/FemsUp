<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Backend.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BackendFems.UI.Index" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">           
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    
    <br /><br /><br /><br />
    <!--<div class="col-lg-4">
        <script type="text/javascript">
            $('.date-own').datepicker({
                minViewMode: 1,
                format: 'yyyy-mm'
            });
	    </script>
        <h4>Fecha a consultar:</h4>                
        <input type="text" id="datepicker" runat="server"  name="text-input" placeholder="Fecha a consultar" class="date-own form-control"/>
    </div><br />-->
    <div class="col-lg-12">
        <div class="card">
            <iframe id="MyIFrame" runat="server"  src="Iframes/PublicCate.aspx"  frameborder="0" style=" width: 100%; height: 800px;  overflow: hidden;"></iframe>
        </div>
    </div>

</asp:Content>
