angular.module('webforge')

.controller('UsersCtrl', 

function($scope, $http, $rootScope, usersService){

	$scope.usersIndex = function(){
		usersService.getUsers()
		.success(function(data){
				$scope.users = data;
				console.log(data)			
			})
		
	};
	$scope.usersIndex();

	$scope.submit = function(nameUser,emailUser,rutUser,passwordUser,user_typeUser,password_confirmationUser) {
	
		usersService.postUser($scope.nameUserNew,$scope.emailUserNew,$scope.rutUserNew,$scope.passwordUserNew,$scope.user_typeUserNew,$scope.password_confirmationUser)
		.success(function(data){
				$scope.users = data;
				console.log(data)

				if (data.success == 'created'){
					$scope.ERRORES == ''
					window.location.reload();
				}else{
					$scope.ERRORES = data.success
				}
			})

		console.log($scope.emailUserNew + ' ' + $scope.nameUserNew+ ' ' + $scope.rutUserNew + ' ' + $scope.passwordUserNew + ' ' + $scope.user_typeUserNew + ' ' + $scope.password_confirmationUser)
	};
});
