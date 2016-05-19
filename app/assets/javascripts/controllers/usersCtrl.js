



angular.module('webforge')

.controller('UsersCtrl', 

function($scope, $http, $rootScope, usersService){

	$scope.usersIndex = function(){
		usersService.getUsers().
			success(function(data){
				$scope.users = data;
				console.log(data)			
			})
		console.log("Caca.");
	};
	$scope.usersIndex();

});
