#	Hace que cuando se cliquee en el footer la flecha, se mueva la pantalla hacia abajo
#	para seguir el movimiento de como se abre el footer.
#	Cuando se cierra el footer, tambien se ejecuta la funcion, pero no tiene ningun
#	efecto indeseado visible al usuario.

$ ->
	$(".footer-arrow").click ->
		$("html, body").animate({ 
			scrollTop: $(document).height() 
			}, 500);
	