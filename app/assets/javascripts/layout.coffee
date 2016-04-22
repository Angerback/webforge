#	Hace que cuando se cliquee en el footer la flecha, se mueva la pantalla hacia abajo
#	para seguir el movimiento de como se abre el footer.

$ ->
	footerIsVisible = false;
	$(".footer-arrow").click ->
		footerIsVisible = !footerIsVisible
		$("html, body").animate({ 
			scrollTop: $(document).height() 
			}, 500) if footerIsVisible
	