angular.module('ApplicationController', [])

.controller( 'ApplicationController', [ 
	'$cookies',
	'$scope',
	function ( $cookies, $scope ) {

		$scope.scopeLoad = function() {
			$scope.userSession = $cookies.getObject( 'userSession' );
			$scope.userAccount = $cookies.getObject( 'userAccount' );
		};
	}
]);