var webForgeApp = angular.module('webforge', ['ui.router', 'templates'])
.config(function($stateProvider, $urlRouterProvider, $locationProvider){
	$stateProvider
	.state('home', {
		url: '/',
		templateUrl: 'home.html',
		controller: 'HomeCtrl',
		title : 'Inicio'
	}).state('users', {
		url: '/users',
		templateUrl: 'users/index.html',
		controller: 'UsersCtrl',
		title : 'Usuarios del sistema'
	});

	$urlRouterProvider.otherwise('/');

	//$locationProvider.html5Mode(true);
});


// Escucha el cambio de ruta, para asi cambiar de titulo la pagina.
// Por eso todas las rutas deben tener el atributo 'title'.
// Tambien es posible que cada controlador ponga un titulo mas
// "personalizado", para eso el controlador debe hacer
// $rootScope.tituloPagina = "nuevo titulo"
webForgeApp.run(function($rootScope) {
	$rootScope.$on('$stateChangeSuccess',
	function(event, toState, toParams, fromState, fromParams){ 
		$rootScope.tituloPagina = toState.title;
	 })
});
