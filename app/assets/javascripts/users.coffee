# Realiza la confirmacion de eliminacion de usuario 

@deleteUserDialog =
	showDialog: (usuario, id) ->
		# Muestra el nombre de usuario a borrar
    		$("#delete-user-name").html(usuario)
    		# Hace que el boton cambie su direccion hacia /users/id
    		$("#delete-user-button").attr("href", "/users/#{id}")
    		# Abrir el dialogo
    		$("#dialog").data('dialog').open()
    		
	hideDialog: ->
		hideMetroDialog("#dialog")
        
