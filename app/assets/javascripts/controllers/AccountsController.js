angular.module('AccountsController', [])

.controller( 'account#show', [
	'$cookies',
	'$scope',
	'$state',
	function ( $cookies, $scope, $state ) {		
		$scope.scopeLoad();
	}
])

.controller( 'account#edit', [
	'$scope',
	'BankAccount',
	function ( $scope, BankAccount ) {
		
		$scope.update = function ( operation, amount, ownerId, receiverId) {
			BankAccount.get({ userId: ownerId }).$promise
			.then( function ( account ) {
				account.balance += amount;
				account.operation = operation;
				account.owner_id = ownerId;
				account.receiver_id = receiverId;
				account.amount = Math.abs( amount );
				account.$update(); 
			})

			.then( function() {
				console.log('Operación realizada');
			}, function() {
				console.log('Operación fallida');
			});
		};

		$scope.accountStatus = function() {
			var accountStatus;
			if ($scope.userAccount.status == 'Activa') accountStatus = true;
			else accountStatus = false;
			return accountStatus;
		}

		$scope.scopeLoad();
	}
])

.controller( 'account#edit-deposit', [
	'$cookies',
	'$scope',
	function ( $cookies, $scope ) {
		
		$scope.updateDeposit = function ( amount ) {
			if ($scope.accountStatus()) {
				$scope.update( 'deposito', 
							   amount, 
							   $scope.userSession.id, 
							   $scope.userSession.id );
				$scope.userAccount.balance += amount;
				$cookies.putObject( 'userAccount', $scope.userAccount );
			} else console.log( 'Cuenta bloqueada' );
		}  
	}
])

.controller( 'account#edit-withdrawal', [
	'$cookies',
	'$scope',
	function ( $cookies, $scope ) {
		
		$scope.updateWithdrawal = function ( amount ) {
			if ($scope.accountStatus()) {
				$scope.update( 'retiro', 
							   -amount, 
							   $scope.userSession.id, 
							   $scope.userSession.id );
				$scope.userAccount.balance -= amount;
				$cookies.putObject( 'userAccount', $scope.userAccount );
			} else console.log( 'Cuenta bloqueada' );
		}  
	}
])

.controller( 'account#edit-transfer', [
	'$cookies',
	'$scope',
	'BankAccount',
	'input',
	'User',
	function ( $cookies, $scope, BankAccount, input, User ) {

		$scope.updateTransfer = function ( transferData ) {
			if ($scope.accountStatus()) {
				User.get({ userRut: input.urlFormat( transferData.rut )}).$promise
					.then( function ( user ) {
						$scope.receiver = user;
						BankAccount.get({ userId: $scope.receiver.id }).$promise
						.then( function() {
							$scope.update( 'recibe transferencia de', 
									   	transferData.amount, 
									   	user.id, 
								   	   	$scope.userSession.id )

							$scope.update( 'efectua transferencia a', 
								   		-transferData.amount, 
								   		$scope.userSession.id, 
								   		user.id );

							$scope.userAccount.balance -= parseInt(transferData.amount);
							$cookies.putObject( 'userAccount', $scope.userAccount );
						})
					});
			} else console.log( 'Cuenta bloqueada' );	
		}
	}
])

.controller( 'account#edit-lock', [
	'$cookies',
	'$scope',
	'BankAccount',
	function ( $cookies, $scope, BankAccount ) {

		$scope.enabled = $scope.accountStatus();

		$scope.updateLock = function() {
			BankAccount.get({ userId: $scope.userSession.id }).$promise
			.then( function ( account ) {
				if ($scope.enabled) {
					account.status = 'Bloqueada';
					account.operation = 'bloqueo de cuenta';
				} else { 
					account.status = 'Activa';
					account.operation = 'activación de cuenta';
				}
				account.balance += 0;
				account.owner_id = 1;
				account.receiver_id = 1;
				account.amount = 0;
				account.$update();
				return account;
			})
			.then (function ( account ) {
				console.log('Operación realizada');
				$scope.userAccount = account;
				$cookies.putObject('userAccount', $scope.userAccount );
				$scope.enabled = !$scope.enabled;
				
			}, function() {
				console.log('Operación fallida');
			})
		}
	}
])