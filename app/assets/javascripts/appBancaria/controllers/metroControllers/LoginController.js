angular.module('MetroLoginController', [])

.controller( 'login#index', [ 
	'$cookies',
	'$scope',
	'$state',
	'Flash',
	'input',
	'BankAccount',
	'Session',
	'User',
	function ( $cookies, $scope, $state, Flash, input, BankAccount, Session, User ) {

		if ( $cookies.getObject('logIn?') == true ) 
			$state.go( 'app.accounts-show', { id: $cookies.getObject( 'userAccount' ).id });
		else $cookies.putObject( 'logIn?', false );

		$scope.login = function ( credentials ) {

			var session = new Session ({
								rut: input.urlFormat( credentials.rut ),
								password: credentials.password });
			session.$save()
			.then( function() {
				console.log("logueado");
				$cookies.putObject( 'logIn?', true );
				User.get( ({ userRut: input.urlFormat( credentials.rut )})).$promise
				
				.then( function ( session ) {
					$cookies.putObject ('userSession', session );
					return BankAccount.get({ userId: session.id }).$promise;
				})

				.then( function ( account ) {
					$scope.account = account;
					console.log( "Tiene cuenta" );
				}, function() {
					console.log( "No tiene cuenta" );
					var account = new BankAccount ({
											balance: 0,
											user_id: $cookies.getObject( 'userSession' ).id,
											status: 'Activa' });
					$scope.account = account;
					account.$save();
				})

				.finally( function() {	
					$cookies.putObject('userAccount', $scope.account );
					$state.go("app.accounts-show", 
									{ id: $cookies.getObject( 'userSession' ).id });
				})

			}, function(httpResponse) {
				console.log("combinación erronea rut/contraseña: " + httpResponse.status);
				if (httpResponse.status == "404") 
					Flash.create( 'danger', $scope.msg.rut404, 'error' );
				else 
					Flash.create( 'danger', $scope.msg.aut422, 'error' ); 
			})	
		}
	}
])

.controller( 'login#destroy', [ 
	'$cookies',
	'$scope',
	'$state',
	function ( $cookies, $scope, $state ) {

		$scope.destroy = function () {
			
			$cookies.remove( 'userSession' );
			$cookies.remove( 'userAccount' );
			$cookies.putObject( 'logIn?', false );
			$state.go( 'login.index' );
		}
	}
]);