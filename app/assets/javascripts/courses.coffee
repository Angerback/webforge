# Realiza la confirmacion de eliminacion de usuario 

@deleteCourseDialog =
	showDialog: (course, id) ->
		# Muestra el curso a borrar
    		$("#delete-course-name").html(course)
    		# Hace que el boton cambie su direccion hacia /courses/id
    		$("#delete-course-button").attr("href", "/courses/#{id}")
    		# Abrir el dialogo
    		$("#dialog").data('dialog').open()
    		
	hideDialog: ->
		hideMetroDialog("#dialog")



        