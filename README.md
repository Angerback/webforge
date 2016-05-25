[![Build Status](https://semaphoreci.com/api/v1/angerback/webforge/branches/master/badge.svg)](https://semaphoreci.com/angerback/webforge)
#Nota:

Actualmente muestra como pasar la vista "Home" a Angular, sin embargo en el proyecto real solo se pasaran algunas vistas a Angular, y no se puede mezclar un proyecto que use el routing de Rails con el de Angular (se producen muchos conflictos, como que por ejemplo los links .com/heuristics no funciona). Asi que se debe hacer que cada vista implemente Angular de manera separada (sin angular-routing) o buscar otra manera de incorporarlo.

Instalación
===========

Luego de hacer clone: 
```bash
bundle install
rake db:setup
rake db:migrate
```

