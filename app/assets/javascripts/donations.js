
$(function() {   
   $('#check').click(function(event){       
       $('.supplied').toggle();    
       if ($( "#check" ).is("checked")) {
       document.getElementById("first_name").value = "Anymous";
       document.getElementById("last_name").value = "Anymous";
       }
       }); 
 });