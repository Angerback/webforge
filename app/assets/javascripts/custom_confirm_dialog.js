/*
*
* Este codigo sirve para reemplazar los dialogos de JQuery UJS, el cual
* utiliza la funcion nativa de Javascript "confirm()", la cual tiene la desventaja
* de ser fea, y el usuario puede clicar "no mostrar mas de estos dialogos", lo cual
* elimina esta funcionalidad. 
*
*
*
*/


$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");

  bootbox.confirm(message, function(result){
    if(result == true){
      $.rails.confirmed(link); 
    }     
  });
}