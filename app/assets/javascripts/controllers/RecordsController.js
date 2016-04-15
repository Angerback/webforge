angular.module('RecordsController', [])

.controller( 'record#index', [
	'$scope',
	'Record',
	'User',
	function ( $scope, Record, User ) {

		$scope.userRecords = [];
		$scope.scopeLoad();
		
		User.query().$promise
		.then( function (users) {
			$scope.users = users;
			return Record.query({ ownerId: $scope.userSession.id }).$promise;			
		})
		.then( function ( records ) {
			records.reverse();
			for ( i = 0; i < records.length; i++ ) {

				var name = ''
				 ,  rut  = '';

				switch( records[i].operation ) {
						
						case 'deposito':
							$scope.userRecords.push( records[i].created_at +  
								                     " Deposistaste: " +
								                     records[i].amount + " CLP"
								                     + " en tu cuenta" );
							break;
						
						case 'retiro':
							$scope.userRecords.push( records[i].created_at +  
								                     " Retiraste: " +
								                     records[i].amount + " CLP"
								                     + " de tu cuenta" );
							break;

						case 'efectua transferencia a':
							for ( j = 0; j < $scope.users.length; j++ ) {
								if ($scope.users[j].id == records[i].receiver_id) {
									rut = $scope.users[j].rut;
									name = $scope.users[j].name;
								}
							} 
							$scope.userRecords.push( records[i].created_at +  
								                     " Transferiste: " +
								                     records[i].amount + " CLP a "
								                     + name + " (RUT: " + rut + ")" );
							break;
						
						case 'recibe transferencia de':
							for ( j = 0; j < $scope.users.length; j++ ) {
								if ($scope.users[j].id == records[i].receiver_id) {
									rut = $scope.users[j].rut;
									name = $scope.users[j].name;
								}
							} 
							$scope.userRecords.push( records[i].created_at +  
								                     " Recibiste: " +
								                     records[i].amount + " CLP de " 
								                     + name + " (RUT: " + rut + ")" );
							break;			
				}
				console.log($scope.userRecords);
			}
		})
	}
])