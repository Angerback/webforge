angular.module('MetroApplicationController', [])

.controller( 'ApplicationController', [ 
	'$cookies',
	'$scope',
	'$rootScope',
	function ( $cookies, $scope, $rootScope ) {

		$scope.msg = {
			rut404: '<div class="error">Este Rut no esta registrado, ingresa otro rut</div>',
			aut422: 'La contraseña es incorrecta. Asegúrate de usar la contraseña de tu cuenta',
			dep200: 'Depósito realizado exitosamente',
			acc401: 'Imposible realizar la operación. Tu cuenta esta bloqueada',
			wit200: 'Retiro realizado exitosamente',
			fns401: 'No dispones de fondos suficientes',
			trf200: 'Transferencia realizada exitosamente',
			des404: 'El destinatario no tiene cuenta en nuestro banco',
			lck200: 'Cuenta bloqueada',
			ulk200: 'Cuenta activa',
			lck400: 'Fallamos en la actualización de tu cuenta'
		};

		$scope.scopeLoad = function() {
			$scope.userSession = $cookies.getObject( 'userSession' );
			$scope.userAccount = $cookies.getObject( 'userAccount' );
		};
	}
]);