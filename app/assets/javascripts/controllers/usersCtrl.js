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

	$scope.setSelectedUser = function(idd) {
	    $scope.selectedUserId = idd;
	    console.log($scope.selectedUserId);
	};
	$scope.submit_edit = function(nameUserEdit,emailUserEdit,rutUserEdit,user_typeUserEdit){
		usersService.editUser(nameUserEdit,emailUserEdit,rutUserEdit,user_typeUserEdit, $scope.selectedUserId)
		.success(function(data){	

			$scope.users = data;
			console.log(data);



		})
	};




});
