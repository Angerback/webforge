angular.module('WebforgeUsersController', [])

.controller( 'users#index', [
	'$cookies',
	'$scope',
	'$state',
	'WebforgeUser',
	function ( $cookies, $scope, $state, WebforgeUser ) {		
		WebforgeUser.getUsers()
		.succes(function(data){
			$scope.users = data;
		})
		.error(function(error){
			$scope.status = 'Error';		
		})
	}
])
