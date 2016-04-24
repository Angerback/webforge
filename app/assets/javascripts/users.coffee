# Este codigo se puede refactorizar colocando todas las funciones en un namespace unico de @usuario,
# pero habria que modificar las vistas de usuarios para ejecutar las funciones correctamente
# ------------------------------------------------------------

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
        

# Maneja el click en el boton 'ver mas'
@verMasUser =
	# Guardar el texto original del boton
	textoOriginalBtn: null
	verMas: ->
		# Si el dato es nulo, entonces asignarle un valor (esto es porque este script carga
		# primero que el boton, entonces ese boton no esta disponible inicialmente.)
		@.textoOriginalBtn ?= $("#boton-user-info-extra").html()
		# Alternar entre mostrar/esconder el cuadro de informacion extra
		$("#user-info-extra").toggle()
		# Si el cuadro es visible...
		if $("#user-info-extra").is ':visible'
			# Cambiar el texto del boton por "Ocultar"
			$("#boton-user-info-extra").html 'Ocultar'
		# En caso contrario, cambiarlo al texto original
		else $("#boton-user-info-extra").html @.textoOriginalBtn
