# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
#1
#User.create(name: "Javier", rut: "20.356.594-1", email: "wolfden00@gmail.com", password: "entrar00", password_confirmation: "entrar00", admin: true, user_type: "Profesor")
#2
User.create(name: "Ismael Vicencio", rut: "17.680.797-0", email: "ismael.vicencio@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: true, user_type: "Profesor")

# Alumnos

#3
User.create(name: "Francisco Avello", rut: "18.189.568-3", email: "francisco.avello@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#4
User.create(name: "Alexis Casanueva", rut: "18.204.469-5", email: "alexis.casanueva@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#5
User.create(name: "Gabriel Godoy", rut: "17.308.623-7", email: "gabriel.godoy@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#6
User.create(name: "Claudia Guzman", rut: "17.708.786-6", email: "claudia.guzmans@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#7
User.create(name: "Camila Marin", rut: "18.072.934-8", email: "camila.marin@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#8
User.create(name: "Sergio Medina", rut: "18.120.798-1", email: "sergio.medina@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#9
User.create(name: "Ian Mejías", rut: "17.832.733-k", email: "ian.mejias@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#10
User.create(name: "Daniel Morales", rut: "18.122.672-2", email: "daniel.morales@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#11
User.create(name: "Pablo Salinas", rut: "18.455.374-0", email: "pablo.salinas.cabanas@gmail.com", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#12
User.create(name: "Pablo Salinas", rut: "18.115.904-9", email: "psalinas_m@hotmail.com", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#13
User.create(name: "Alberto Toro", rut: "17.294.586-4", email: "alberto.toro@usach.cl", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#14
User.create(name: "Carolina Vásquez ", rut: "17.958.228-7", email: "caro.vh@live.com", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#15
User.create(name: "Vasco Vergara", rut: "18.210.538-4", email: "vasco_esteban@hotmail.com", password: "entrar00", password_confirmation: "entrar00", admin: false, user_type: "Alumno")

#H1
Heuristic.create(name:"Visibilidad del Estado del Sistema", description:"El sistema siempre debe mantener a los usuarios informados acerca de su estado, con una retroalimentación apropiada y en un tiempo razonable.")

Do.create(heuristic_id: 1, description: "Cada acción u operación debería generar una respuesta perceptible por el usuario, desde el posicionamiento del cursor sobre un ícono al envío de datos mediante formularios. Lo anterior también se aplica para cambios de estado como la liberación de un botón previamente bloqueado o el indicar que una opción ya ha sido seleccionada, por ejemplo, un hipervínculo.")
Do.create(heuristic_id: 1, description: "En general los tiempos de respuesta deben ser apropiados para cada tarea, si existen demoras mayores a 15 segundos en las respuestas del sistema el usuario debería informado del progreso en la concreción de la respuesta.")
Do.create(heuristic_id: 1, description: "Finalmente, un sistema cuenta con buena visibilidad si permite al usuario indicar verbalmente el estado y alternativas de acción en todo momento incluyendo la navegación, como se verá en la tercera heurística.")

Dont.create(heuristic_id:1, description: "Si se utilizan ventanas emergentes (pop-up) para mostrar mensajes de error, estas ventanas no deben bloquear la visualización el error en la interfaz cuando se despliegan, de otro modo la respuesta ocultaría parte del estado del sistema.")

Example.create(heuristic_id:1, description:"Un mensaje de retroalimentación es desplegado cuando una acción ha sido realizada.
", image:"examples/h1/e1.png")
Example.create(heuristic_id:1, description:"Un mensaje e indicador de progreso se muestra mientras la aplicación carga.
", image:"examples/h1/e2.png")
Example.create(heuristic_id:1, description:"La fuerza de la contraseña es mostrada conforme se ingresa la clave.
", image:"examples/h1/e3.jpg")

#Reference.create(heuristic_id:, description:"", link:"")

#H2
Heuristic.create(name:"Correspondencia entre el sistema y el mundo real", description:"El sistema debe hablar el lenguaje de los usuarios, con las palabras, frases y conceptos familiares, en lugar de términos que estén orientados al sistema. Utilizar convenciones del mundo de real, haciendo que la información aparezca en un orden natural y lógico.")

Do.create(heuristic_id: 2, description: "Esta heurística no solo se limita a la comunicación entre el usuario y el sistema a través de mensajes, se persigue la sensación de familiaridad para el usuario en todo momento, es decir, este principio se aplica sobre iconos, colores, nombres de variables y acciones.")
Do.create(heuristic_id: 2, description: "Una buena práctica es utilizar formas de objetos de la interfaz como pistas visuales basándose siempre en las convenciones culturales del usuario.
")
Do.create(heuristic_id: 2, description: "Preguntas e instrucciones que acompañen formularios y operaciones han de escribirse siguiendo la jerga del usuario con la mayor simpleza y claridad posible.
")
Do.create(heuristic_id: 2, description: "Botones que representan acciones reales o teclas existentes deben conservar el nombre de su homólogo real, la misma idea se aplica para las categorías. ")

Dont.create(heuristic_id: 2, description: "Los códigos y tecnicismos computacionales, muy comunes en comandos y errores, deben evitarse en todo momento.")
Dont.create(heuristic_id: 2, description: "Los menús y la información no pueden ser ordenados de la manera más clara para el diseñador o programador, se debe considerar el orden más natural para el usuario.")
Dont.create(heuristic_id: 2, description: "No se debe utilizar nombre ambiguos, todo nombre debe ser unívoco.")
Dont.create(heuristic_id: 2, description: "Otra forma de acercar los valores de campos numéricos a la realidad del usuario es ingresar de manera automática los signos de dólar (o la moneda apropiada) cuando se trate valores monetarios, ingresar automáticamente puntos en valores superiores a 999 o los signos correspondientes a campos que tengan un formato específico como números telefónicos o identificaciones.
")

Example.create(heuristic_id: 2, description:"ITunes se organiza como una librería que contiene tu multimedia separándola por tipo.", image:"examples/h2/e1.png")
Example.create(heuristic_id: 2, description:"En Mindomo las ramas y la jerarquía de un mapa mental pueden reorganizarse fácilmente de una forma no lineal. El servicio implementa perfectamente el paradigma.", image:"examples/h2/e2.png")

#H3
Heuristic.create(name:"Control y libertad para el Usuario", description:"Ocasionalmente los usuarios eligen funciones del sistema por error y a menudo necesitan una salida de emergencia claramente marcada, esto es, salir del estado indeseado sin tener que pasar por un diálogo extendido. Es importante disponer de las funcionalidades de “deshacer” y “rehacer”.")

Do.create(heuristic_id: 3, description: "La heurística es clara respecto a que hacer, implementar una función que permita revertir una acción como “deshacer” y “rehacer” es altamente recomendable.")
Do.create(heuristic_id: 3, description: "Los usuarios deberían ser capaces de cancelar acciones en progreso.")
Do.create(heuristic_id: 3, description: "Se debe solicitar confirmación al usuario ante acciones que tendrán consecuencias drásticas, negativas o destructivas.")
Do.create(heuristic_id: 3, description: "Ante menús, diálogos o cajas de múltiples niveles se debe permitir a los usuarios volver a un punto previo, incluso editar datos o cambiar elecciones anteriormente realizadas; si el orden en que se recibe la información no es crítica el usuario podrá llenar información por adelantado.
")
Do.create(heuristic_id: 3, description: "Ofrecer cierto grado de personalización también se enmarca en la esencia de esta heurística.")
Do.create(heuristic_id: 3, description: "El usuario siempre ha de saber dónde se encuentra y hacia dónde puede ir, es importante apoyar la navegación con etiquetas conceptuales, mapas o marcas.")

Dont.create(heuristic_id: 3, description: "Si el sistema utiliza ventanas superpuestas estas no deben limitar el foco del usuario, deben permitir su libre navegación entre las múltiples ventanas.")

Example.create(heuristic_id: 3, description:"El creador de formularios Wufoo marca con claridad dónde se encuentra la persona y donde puede ir mostrando la selección en cada menú.", image:"examples/h3/e1.png")
Example.create(heuristic_id: 3, description:"La herramienta de maquetación Balsamiq dispone de los botones “rehacer” y “deshacer” en su barra de herramientas, también se puede acceder a ellos a través de los atajos de teclado estándares.", image:"examples/h3/e2.png")

#H4
Heuristic.create(name:"Consistencia y Estándares", description:"Los usuarios no deben tener que preguntarse si las diversas palabras, situaciones, o acciones significan la misma cosa. En general siga las normas y convenciones de la plataforma sobre la que se está implementando el sistema.")

Do.create(heuristic_id: 4, description: "Es importante respetar los formatos de la organización tras el sistema y preservar su consistencia a lo largo de todas las pantallas.")
Do.create(heuristic_id: 4, description: "Considerando lo anterior, el esquema de diseño de los íconos y su estética debe ser consistente en todo el sistema; se aconseja utilizar etiquetas para los íconos.
")
Do.create(heuristic_id: 4, description: "El despliegue de datos comienza en la parte superior izquierda de la pantalla. Cada parte de la interfaz debe comenzar con un título o encabezamiento que describa el contenido de la pantalla.
")
Do.create(heuristic_id: 4, description: "Prefiera la utilización de menús verticales donde el último elemento sea la opción de salir, si existe. Los títulos de dichos menús pueden ir centrados o justificados a la izquierda mientras que los ítems siempre están justificados a la izquierda. Es útil que el texto de los ítems sea precedido por un número o elemento mnemotécnico, los apuntadores, o listas de elementos emergentes, de dichos ítems deben desplegarse a la derecha. Idealmente los deberían ser anchos (muchos ítems) antes que profundos (muchos niveles).")
Do.create(heuristic_id: 4, description: "Las ventanas o campos activos deberían ser identificados con un elemento visual.")
Do.create(heuristic_id: 4, description: "Las instrucciones deben aparecer en un lugar semejante a lo largo de las diferentes pantallas, formularios o menús. El mismo principio se aplica para mensajes de estado y error.")
Do.create(heuristic_id: 4, description: "Las etiquetas de campos y los campos se deben distinguir topográficamente entre sí; las etiquetas deben mantener una forma consistente entre las diferentes pantallas del sistema. Cuando un campo es sencillo su etiqueta puede ir a su izquierda, para listas de campos se recomienda posicionarla arriba.")
Do.create(heuristic_id: 4, description: "Se recomienda variar el tamaño del texto hasta en cuatro niveles, su intensidad en dos y utilizar a lo más tres fuentes distintas.")
Do.create(heuristic_id: 4, description: "Respecto al uso de colores no deberían utilizarse más de cuatro o siete con regularidad y colores adicionales solo ocasionalmente. Los colores altamente cromáticos son una buena alternativa para captar la atención del usuario.")
Do.create(heuristic_id: 4, description: "Los sonidos deben ser suaves para notificar situaciones regulares y bruscos para las críticas.")
Do.create(heuristic_id: 4, description: "Los diferentes componentes de la interfaz deben ser consistentes y mantener un mismo comportamiento a través de las distintas pantallas del sistema.")

Dont.create(heuristic_id: 4, description: "No se debe abusar del uso de letras mayúsculas en las distintas vistas.")
Dont.create(heuristic_id: 4, description: "No utilizar más de 12 a 20 tipos de íconos.")
Dont.create(heuristic_id: 4, description: "Respecto a los colores, se deben evitar los pares espectralmente extremos y altamente cromáticos y nunca utilizar azules saturados para texto u otro elemento pequeño.")

Example.create(heuristic_id: 4, description:"Los distintos programas que componen la suite de Office usan la misma barra de herramientas y el mismo menú primario de opciones: Home, Insert, Page Layout.", image:"examples/h4/e1.png")

#H5
Heuristic.create(name:"Prevención de Errores", description:"Un diseño cuidadoso que prevenga la ocurrencia de errores es incluso mejor que la generación de buenos mensajes para describirlos. Resulta válida tanto la eliminación de condiciones propensas a errores como su detección y presentación ante los usuarios con una opción de confirmación antes de ejecutar la acción.")

Do.create(heuristic_id: 5, description: "Las elecciones disponibles en menús deben ser lógicas, distinguibles entre sí y mutuamente excluyentes.")
Do.create(heuristic_id: 5, description: "El sistema se ha de diseñar de tal manera que las opciones con nombres similares no ejecuten acciones opuestas (y/o potencialmente peligrosas).")
Do.create(heuristic_id: 5, description: "Las entradas de datos deberían ser insensibles a mayúsculas siempre que sea posible. Cuando el número de caracteres es limitado se debe indicar el número de caracteres disponibles. Los campos en las pantallas de entradas de datos y las cajas de diálogo deberían contener valores por defecto cuando corresponda.")
Do.create(heuristic_id: 5, description: "El nombre de una elección en el menú de nivel superior se debe usar como título de menú para el menú de nivel inferior.")

Example.create(heuristic_id: 5, description:"Una acción primaria es resaltada a través de un área mayor, mientras que “Cancelar” y acciones secundarias solo se muestran como vínculos.", image:"examples/h5/e1.png")
Example.create(heuristic_id: 5, description:"Desactivar el botón de actualización tras ser presionado de manera que la persona no pueda actualizar la publicación dos veces por error.", image:"examples/h5/e2.png")
Example.create(heuristic_id: 5, description:"El autofoco previene una fuente común de frustración: Escribir para luego darse cuenta que no se ha seleccionado campo alguno.", image:"examples/h5/e3.png")

#H6
Heuristic.create(name:"Reconocer antes que Recordar", description:"Minimizar la carga de memoria de los usuarios haciendo objetos, acciones y opciones visibles. Él no debería tener que recordar la información de una parte del diálogo a otra. Las instrucciones de uso del sistema deben ser visibles o fácilmente recuperables cuando sea apropiado.")

Do.create(heuristic_id: 6, description: "El usuario debe contar con toda la información que necesita en cada paso de una transacción. Idealmente la primera palabra de cada opción debería ser la más importante.")
Do.create(heuristic_id: 6, description: "El uso de pistas visuales y espacios en blanco ayuda a distinguir diferentes componentes de la interfaz, también se refuerza la idea de grupo al mantener la misma distancia entre los elementos que conforman un conjunto y se aplica una mayor entre estos y los grupos vecinos.")
Do.create(heuristic_id: 6, description: "Las áreas de texto requieren de espacios, denominados de respiración, que las rodeen.")
Do.create(heuristic_id: 6, description: "Las etiquetas de campos deben estar cerca de ellos pero distantes por al menos un espacio en blanco. Es recomendable que los campos en columna que son largos se descompongan en grupos de cinco, separados por una línea en blanco. Si un campo es opcional se debe indicar con claridad.
")
Do.create(heuristic_id: 6, description: "Como se ha mencionado, el uso de títulos para cada sección apoya también la identificación de grupos, otros recursos son colores, líneas de separación y áreas sombreadas.")
Do.create(heuristic_id: 6, description: "Otro uso del espacio en blanco es la creación de simetría para guiar al ojo del usuario, es importante que las pistas visuales y mensajes estén posicionados en lugares de la pantalla en donde es probable que el usuario dirija su mirada.")
Do.create(heuristic_id: 6, description: "Para facilitar el reconocimiento de la importancia de cada ítem en pantalla se pueden usar variaciones al tamaño de letra, realce de fuente, subrayado, color, sombreado o tipografía especial.")
Do.create(heuristic_id: 6, description: "Los colores suaves, brillantes y saturados han de utilizarse para enfatizar datos, mientras que los colores oscuros, opacos y no saturados para des-enfatizar datos.")
Do.create(heuristic_id: 6, description: "Es importante lograr un buen contraste entre de brillo y de color entre los colores usados para imágenes y fondo. ")
Do.create(heuristic_id: 6, description: "Finalmente debería ser fácil para el usuario saber dónde puede realizar una acción o selección.")

Example.create(heuristic_id: 6, description:"Mostrar el estilo de una fuente a elegir en lugar de sólo su nombre. ", image:"examples/h6/e1.png")

#H7
Heuristic.create(name:"Flexibilidad y eficiencia de uso", description:"Los atajos, generalmente ignorados por usuarios inexpertos, a menudo pueden acelerar la interacción para el usuario experto de tal manera que el sistema puede servir tanto a los usuarios novatos y a los experimentados. Se debe permitir a los usuarios adaptarse a las acciones frecuentes.")

Do.create(heuristic_id: 7, description: "Los usuarios pueden reducir el tiempo de entrada de datos si se les permite copiar y pegar datos existentes.")
Do.create(heuristic_id: 7, description: "Los usuarios deberían tener la opción tanto de hacer clic en una lista de ítems como de utilizar atajo usando el teclado. El mismo comportamiento se espera para formularios, cajas de diálogo y scrolling (desplazamiento) vertical u horizontal.")
Do.create(heuristic_id: 7, description: "Es útil definir atajos de teclado para las tareas más frecuentes y permitir a los usuarios cierto grado de personalización de ellas. De existir estos atajos se deben presentar a los usuarios.")
Do.create(heuristic_id: 7, description: "Si el sistema soporta a usuarios novatos y expertos es una buena práctica establecer mensajes para cada nivel de usuario.")
Do.create(heuristic_id: 7, description: "Para pantallas de entrada de datos con muchos campos o en los cuales los documentos fuentes pueden estar incompletos, se debería permitir a los usuarios el grabar una pantalla parcialmente completada.")

Example.create(heuristic_id: 7, description:"Lista de atajos de teclado en un sitio o aplicación.
", image:"examples/h7/e1.png")

#H8
Heuristic.create(name:"Estética de diálogos y Diseño minimalista", description:"Los diálogos no deberían contener información irrelevante o raramente necesaria. Cada unidad de información extra en un diálogo compite con las unidades de información importante y disminuye su visibilidad relativa.")

Do.create(heuristic_id: 8, description: "Solo la información esencial para tomar decisiones (y solo esta información) debe ser mostrada en la pantalla.")
Do.create(heuristic_id: 8, description: "Los íconos deben ser visualmente distinguibles de acuerdo a su significado conceptual. Los objetos extensos, las líneas resaltadas y las áreas simples de la pantalla, se han de distinguir de los iconos: Cada icono debe estar resaltado con respecto a su fondo.")
Do.create(heuristic_id: 8, description: "Cada pantalla de entrada de datos debe incluir un título simple, corto, claro y suficientemente distintivo. Los títulos de los menús deben ser breves pero suficientemente largos como para comunicar su contenido.")

Example.create(heuristic_id: 8, description:"El menú de búsqueda de la imagen ejemplifica los cuatro principios del diseño visual: Contraste, texto acentuado es usado en las dos etiquetas de la búsqueda; Repetición, los colores naranjo, azul y verde representan los diferentes multimedios; Alineamiento, el texto es alineado a la izquierda, mientras la pestaña a la derecha; Proximidad, una delgada línea es usada para separar las diferentes opciones.", image:"examples/h8/e1.png")

#H9
Heuristic.create(name:"Ayuda a los Usuarios en el Reconocimiento, Diagnóstico y Recuperación de Errores", description:"Los mensajes de error se deben expresar en un lenguaje claro (no haya códigos extraños), se debe indicar exactamente el problema, y deben ser constructivos.")

Do.create(heuristic_id: 9, description: "Los mensajes de error deberían informar a los usuarios sobre la severidad del error cometidos, sugerir la causa del problema que los ha ocasionado e indicar qué acción debe realizar el usuario para corregir el error correspondiente.")
Do.create(heuristic_id: 9, description: "Si se detecta un error en un campo de entrada de datos el sistema debería posicionar el cursor en ese campo o resaltarlo de alguna manera.")
Do.create(heuristic_id: 9, description: "Finalmente los mensajes de error deben estar expresados de manera tal que es el sistema, y no el usuario, sea quien se hace cargo de los errores, sin embargo, los mensajes deben colocar al sistema bajo el control del usuario.")

Dont.create(heuristic_id: 9, description: "Nunca utilice palabras violentas u hostiles para describir un error.")
Dont.create(heuristic_id: 9, description: "Si se usan mensajes de error con humor deben ser apropiados y nunca faltar el respeto a la comunidad de usuarios.")

Example.create(heuristic_id: 9, description: "Un mensaje de error cuya única descripción es un código computacional no ofrece información de valor para el usuario.", image:"examples/h9/e1.png")
Example.create(heuristic_id: 9, description: "Se utiliza una imagen graciosa para informar al usuario del error “Página no encontrada” a la vez que se proveen alternativas y un curso de acción.", image:"examples/h9/e2.png")
Example.create(heuristic_id: 9, description: "Se provee una respuesta inmediata con instrucciones específicas.", image:"examples/h9/e3.png")

#H10
Heuristic.create(name:"Ayuda y Documentación", description:"Aunque es mejor si el sistema se puede utilizar sin documentación, puede ser necesario disponer de ayuda y documentación. Esta ha de ser fácil de buscar, centrada en las tareas del usuario, tener información de las etapas a realizar y no ser muy extensa.")

Do.create(heuristic_id: 10, description: "Las instrucciones deben seguir la secuencia de acciones del usuario. Si las opciones de los menús son ambiguas, el sistema ha de proveer información aclaratoria adicional cuando un ítem sea seleccionado.")
Do.create(heuristic_id: 10, description: "Deben existir ayudas de memoria para los comandos y atajos de teclado, por ejemplo, a través de referencias rápidas. ")
Do.create(heuristic_id: 10, description: "La función de ayuda del menú debe ser visible (por ejemplo, una tecla etiquetada AYUDA o un menú especial).")
Do.create(heuristic_id: 10, description: "Desde la perspectiva de la Navegación: la información ¿es fácil de encontrar?
")
Do.create(heuristic_id: 10, description: "Desde la perspectiva de la Presentación: ¿la disposición visual está bien diseñada?
")
Do.create(heuristic_id: 10, description: "Aplique el concepto de Conversación, es decir, ¿la información es exacta, completa y comprensible? ¿La información es relevante? ")
Do.create(heuristic_id: 10, description: "Considere la Orientación a la meta (¿qué puedo hacer yo con este programa?)")
Do.create(heuristic_id: 10, description: "El material de ayuda debe ser Descriptivo (¿para qué es esta cosa?)
")
Do.create(heuristic_id: 10, description: "También debe ser Procedimental (¿cómo hago yo para hacer esta tarea?)
")
Do.create(heuristic_id: 10, description: "El material debe ser Interpretativo (¿por qué sucedió eso?) ")
Do.create(heuristic_id: 10, description: "Y por último, debe ser Navegacional (¿dónde estoy?)
")
Do.create(heuristic_id: 10, description: "Idealmente la ayuda debe ser sensible al contexto y ofrecer más de un nivel de detalle que el usuario pueda elegir; acceder y regresar del sistema de ayuda debe ser fácil.")

Example.create(heuristic_id: 10, description:"Utilizar vídeos para mostrar características a los usuarios novatos es una buena práctica", image:"examples/h10/e1.png")
Example.create(heuristic_id: 10, description:"Se pueden emplear consejos de ayuda que respondan al situar el puntero sobre ellos apuntando preguntas frecuentes acerca del campo de instrucciones que acompañan.", image:"examples/h10/e2.png")

# TOPICS

# Introducción - ID:1
Topic.create( name: "Introducción", path:"introduction_path")

# Introducción a las heurísticas - ID:2
Topic.create( name: "Introducción a las Heurísticas de Nielsen",
			  path: "heuristics_path")

# H1 - ID:3
Topic.create( name: "H1: Visibilidad del Estado del Sistema" ,
			  path: '{:action => "show", :controller => "heuristics", :heuristic_id => 1 }')

# H2 - ID:4
Topic.create( name: "H2: Correspondencia entre el sistema y el mundo real",
			  path: '{:action => "show", :controller => "heuristics", :heuristic_id => 2 }')

# H3 - ID:5
Topic.create( name: "H3: Control y libertad para el Usuario",
			  path: '{:action => "show", :controller => "heuristics", :heuristic_id => 3 }')

# H4 - ID:6
Topic.create( name: "H4: Consistencia y Estándares",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 4 }')

# H5 - ID:7
Topic.create( name: "H5: Prevención de Errores",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 5 }')

# H6 - ID:8
Topic.create( name: "H6: Reconocer antes que Recordar",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 6 }')

# H7 - ID:9
Topic.create( name: "H7: Flexibilidad y eficiencia de uso",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 7 }')

# H8 - ID:10
Topic.create( name: "H8: Estética de diálogos y Diseño minimalista",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 8 }')

# H9 - ID:11
Topic.create( name: "H9: Ayuda a los Usuarios en el Reconocimiento, Diagnóstico y Recuperación de Errores",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 9 }')

# H10 - ID:12
Topic.create( name: "H10: Ayuda y Documentación",
	          path: '{:action => "show", :controller => "heuristics", :heuristic_id => 10 }')

# Evaluación Heurística - ID:13
Topic.create( name: "Evaluación Heurística",
	          path: "heuristic_evaluation_path")

# ANSWERS V F
# ID:1
Alternative.create(question_id: 1, sentence: "Verdadero")
# ID:2
Alternative.create(question_id: 1, sentence: "Falso")

# EVALUATIONS

# Evaluación 1

Evaluation.create(name: "Introducción a las Heurísticas de Nielsen",
				  description: "Esta evaluación mide el conocimiento de las heurísticas de Nielsen y la capacidad de identificar problemas básicos en interfaces a partir de estos principios.",
				  image: "evaluations/evaluation 1/index.png")

# Preguntas
# Verdadero o Falso (1 = V, 2 = F)

Question.create(topic_id: 13,
				sentence: "Las Heurísticas de Nielsen sólo se utilizan en la fase de diseño del ciclo de vida del software.",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 1,
				   number: 1)

Question.create(topic_id: 1,
				sentence: "La adopción de estándares puede disminuir la tasa de rebote de un sitio.",
				answer: 1,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 2,
				   number: 2)

Question.create(topic_id: 4,
				sentence: "La correspondencia entre el sistema y el mundo real se basa en la utilización de mensajes apropiados.",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 3,
				   number: 3)

Question.create(topic_id: 13,
				sentence: "La Heurística 4 tiene una mayor incidencia sobre las demás que cualquier otra heurística.",
				answer: 1,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 4,
				   number: 4)

Question.create(topic_id: 9,
				sentence: "La Heurística 7, Flexibilidad y eficiencia de uso de focaliza en facilitar la navegación para el usuario.",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 5,
				   number: 5)

Question.create(topic_id: 7,
				sentence: "El mejor curso de acción ante errores es que sean comunicados en el lenguaje del usuario (H2) y ayudarle en el reconocimiento, diagnóstico y recuperación (H9).",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 6,
				   number: 6)

Question.create(topic_id: 12,
				sentence: "Todo sistema debe contar con ayuda detallada y tan completa como sea posible para facilitar las tareas del usuario.",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 7,
				   number: 7)

Question.create(topic_id: 8,
				sentence: "Siguiendo las prácticas de la H6, es recomendable minimizar, y si es posible, evitar completamente el uso de espacios en blanco para optimizar los contenidos a mostrar en cada página.",
				answer: 2,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 8,
				   number: 8)

Question.create(topic_id: 5,
				sentence: "La tercera heurística, Control y Libertad para el Usuario, plantea la necesidad de facilitar la salida al usuario de situaciones problemáticas e indeseadas.",
				answer: 1,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 9,
				   number: 9)

Question.create(topic_id: 3,
				sentence: "El uso de indicadores, como barras de progreso, facilita la comunicación del estado del sistema.",
				answer: 1,
				question_type: "VF")
Composition.create(evaluation_id: 1,
				   question_id: 10,
				   number: 10)

# Selección múltiple
# ID:3
Alternative.create(question_id: 11,
				   sentence: "Se utiliza el lenguaje del usuario como indica la H2.",
				   order: "a")
# ID:4
Alternative.create(question_id: 11,
				   sentence: "No se respetan estándares faltando a la H4.",
				   order: "b")
# ID:5
Alternative.create(question_id: 11,
				   sentence: "Se utilizan adecuadamente los estándares de la plataforma siguiendo los principios de la H4.",
				   order: "c")
Question.create(topic_id: 6,
	            sentence: "De los ejemplos de inicio de sesión de la imagen, es correcto que:",
	            answer: 4,
	            question_type: "Selección múltiple",
	            image: "evaluations/evaluation 1/question11.png")
Composition.create(evaluation_id: 1,
				   question_id: 11,
				   number: 11)

# ID:6
Alternative.create(question_id: 12,
				   sentence: "Se utiliza un objeto representativo del mundo real para el ingreso de datos lo que hace innecesario y confuso para el usuario agregar otros mecanismos.",
				   order: "a")
# ID:7
Alternative.create(question_id: 12,
				   sentence: "El ingreso de datos por medio de teclado es prioritario como estándar por sobre el diseño presentado por la interfaz.",
				   order: "b")
# ID:8
Alternative.create(question_id: 12,
				   sentence: "Ninguna de las alternativas anteriores es correcta.",
				   order: "c")
Question.create(topic_id: 6,
	            sentence: "En una interfaz el ingreso de la hora se realiza exclusivamente a través del reloj, respecto a la interfaz es correcto decir:",
	            answer: 7,
	            question_type: "Selección múltiple",
	            image: "evaluations/evaluation 1/question12.png")
Composition.create(evaluation_id: 1,
				   question_id: 12,
				   number: 12)

# ID:9
Alternative.create(question_id: 13,
				   sentence: "La interfaz ofrece múltiples caminos a seguir para el usuario facilitando la flexibilidad y navegación.",
				   order: "a")
# ID:10
Alternative.create(question_id: 13,
				   sentence: "La ayuda se encuentra claramente definida.",
				   order: "b")
# ID:11
Alternative.create(question_id: 13,
				   sentence: "Las opciones presentadas son confusas.",
				   order: "c")
Question.create(topic_id: 7,
	            sentence: "¿Qué evaluación resulta más relevante para el usuario?",
	            answer: 11,
	            question_type: "Selección múltiple",
	            image: "evaluations/evaluation 1/question13.png")
Composition.create(evaluation_id: 1,
				   question_id: 13,
				   number: 13)

# ID:12
Alternative.create(question_id: 14,
				   sentence: "Se utiliza un método de interacción adecuado para el ingreso de información.",
				   order: "a")
# ID:13
Alternative.create(question_id: 14,
				   sentence: "Se presentan las instrucciones con claridad.",
				   order: "b")
# ID:14
Alternative.create(question_id: 14,
				   sentence: "Los elementos son organizados respetando espacios y símbolos para representar el formato del dato a ingresar.",
				   order: "c")
Question.create(topic_id: 6,
	            sentence: "Respecto a la imagen, es falso que:",
	            answer: 12,
	            question_type: "Selección múltiple",
	            image: "evaluations/evaluation 1/question14.png")
Composition.create(evaluation_id: 1,
				   question_id: 14,
				   number: 14)

# ID:15
Alternative.create(question_id: 15,
				   sentence: "Es una implementación inteligente de los calendarios como método de interacción.",
				   order: "a")
# ID:16
Alternative.create(question_id: 15,
				   sentence: "Es difícil para el usuario ingresar el día de su nacimiento a través de este método.",
				   order: "b")
# ID:17
Alternative.create(question_id: 15,
				   sentence: "Es difícil para el usuario indicar el mes y año de su nacimiento a través de la interfaz.",
				   order: "c")
Question.create(topic_id: 6,
	            sentence: "La interfaz de la imagen es utilizada para ingresar la fecha de nacimiento del usuario, al respecto es correcto que:",
	            answer: 17,
	            question_type: "Selección múltiple",
	            image: "evaluations/evaluation 1/question15.png")
Composition.create(evaluation_id: 1,
				   question_id: 15,
				   number: 15)

# Complete con la palabra faltante

Question.create(topic_id: 10,
	            sentence: "La __ explica cómo cada unidad de información compite con el resto para captar la atención del usuario.",
	            answer: 19,
	            question_type: "Palabra faltante")
Composition.create(evaluation_id: 1,
				   question_id: 16,
				   number: 16)
# ID:18
Alternative.create(question_id: 16,
				   sentence: "H4.",
				   order: "a")
# ID:19
Alternative.create(question_id: 16,
				   sentence: "H8.",
				   order: "b")
# ID:20
Alternative.create(question_id: 16,
				   sentence: "H6.",
				   order: "c")

Question.create(topic_id: 11,
	            sentence: "La __ trata acerca del contenido e importancia de los mensajes de error para el usuario.",
	            answer: 22,
	            question_type: "Palabra faltante")
Composition.create(evaluation_id: 1,
				   question_id: 17,
				   number: 17)
# ID:21
Alternative.create(question_id: 17,
				   sentence: "H2.",
				   order: "a")
# ID:22
Alternative.create(question_id: 17,
				   sentence: "H9.",
				   order: "b")
# ID:23
Alternative.create(question_id: 17,
				   sentence: "H5.",
				   order: "c")

Question.create(topic_id: 7,
	            sentence: "Los errores se deben _____ siempre que sea posible a fin de facilitar la experiencia del usuario con la interfaz.",
	            answer: 24,
	            question_type: "Palabra faltante")
Composition.create(evaluation_id: 1,
				   question_id: 18,
				   number: 18)
# ID:24
Alternative.create(question_id: 18,
				   sentence: "Prevenir.",
				   order: "a")
# ID:25
Alternative.create(question_id: 18,
				   sentence: "Explicar.",
				   order: "b")
# ID:26
Alternative.create(question_id: 18,
				   sentence: "Resaltar.",
				   order: "c")

Question.create(topic_id: 9,
	            sentence: "La implementación de atajos y teclas de acceso rápido es parte del principio planteado por la __.",
	            answer: 27,
	            question_type: "Palabra faltante")
Composition.create(evaluation_id: 1,
				   question_id: 19,
				   number: 19)
# ID:27
Alternative.create(question_id: 19,
				   sentence: "H7.",
				   order: "a")
# ID:28
Alternative.create(question_id: 19,
				   sentence: "H4.",
				   order: "b")
# ID:29
Alternative.create(question_id: 19,
				   sentence: "H1.",
				   order: "c")

Question.create(topic_id: 9,
	            sentence: "La heurística 7, Flexibilidad y eficiencia de uso, explica la importancia de crear condiciones tanto para usuarios novatos como para _____.",
	            answer: 32,
	            question_type: "Palabra faltante")
Composition.create(evaluation_id: 1,
				   question_id: 20,
				   number: 20)
# ID:30
Alternative.create(question_id: 20,
				   sentence: "Administradores.",
				   order: "a")
# ID:31
Alternative.create(question_id: 20,
				   sentence: "Casuales.",
				   order: "b")
# ID:32
Alternative.create(question_id: 20,
				   sentence: "Expertos.",
				   order: "c")

# PRACTICES

Practice.create(name: "Login",
				description: "Modulo de identificación de la terminal bancaria",
				plunk: "http://plnkr.co/edit/b4lkrujvYTCcME7bjDyb",
				embed: '<iframe style="width: 100%; height: 150px" src="http://embed.plnkr.co/b4lkrujvYTCcME7bjDyb" frameborder="0" allowfullscren="allowfullscren"></iframe>')

Practice.create(name: "Depósito",
				description: "Modulo de depósito de fondos de la terminal bancaria",
				plunk: "http://plnkr.co/edit/7yzYYyexsBg7B80OFo3b",
				embed: '<iframe style="width: 100%; height: 150px" src="http://embed.plnkr.co/7yzYYyexsBg7B80OFo3b" frameborder="0" allowfullscren="allowfullscren"></iframe>')

Practice.create(name: "Retiro",
				description: "Modulo de retiro de fondos de la terminal bancaria",
				plunk: "http://plnkr.co/edit/KPYCKJicK9wfL5MG1pkE",
				embed: '<iframe style="width: 100%; height: 150px" src="http://embed.plnkr.co/KPYCKJicK9wfL5MG1pkE" frameborder="0" allowfullscren="allowfullscren"></iframe>')

Practice.create(name: "Transferencia",
				description: "Modulo de transferencia de fondos de la terminal bancaria",
				plunk: "http://plnkr.co/edit/orjeIe3Ap1eAXBhIxKc7",
				embed: '<iframe style="width: 100%; height: 150px" src="http://embed.plnkr.co/orjeIe3Ap1eAXBhIxKc7" frameborder="0" allowfullscren="allowfullscren"></iframe>')

# courses

Course.create(
	name: 'Curso nuevo',
	semester: 1)

User.find(2).user_courses.create(course: Course.find(1))
User.find(3).user_courses.create(course: Course.find(1))
