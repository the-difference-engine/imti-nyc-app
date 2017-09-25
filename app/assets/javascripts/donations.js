
$(function() {   
   $('#check').click(function(event){       
       $('.supplied').toggle();    
       if ($( "#check" ).is("checked")===true) {
       document.getElementById("first_name").value = "Anymous";
       document.getElementById("last_name").value = "Anymous";
       } else {
        document.getElementById("first_name").value = "";
       document.getElementById("last_name").value = "";
       }
       }); 
 });
