$(document).ready(function(){
  $("#btnSearch").click(function(){        
       // Realizamos la Petición web
       let url = "http://localhost:51437/SQL.asmx/ShowUsersPorAprobar";
       console.log("HOla");
       $.ajax({
         type:"GET",
         url:url,         
         contentType:"application/json; charset=utf8",
         dataType:"JSON",
         success:function(data){
           alert(data.d);                           
       },
       error: function (result) {
        alert("ERROR " + result.status + ' ' + result.statusText);
        alert("Te pinto un zorro :c");
    }         
    })
 
  });   

  $("#btnReset").click(function(){
       $("#txtFirstName").val("");
       $("#txtLastName").val("");
       $("#txtAge").val("");
       $("#txtPhoneNumber").val("");
       $("#txtAddress").val("");
       $("#txtCountry").val("");        
  });
});