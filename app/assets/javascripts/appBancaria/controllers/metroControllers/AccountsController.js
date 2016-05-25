angular.module('MetroAccountsController', [])

.controller( 'account#show', [
	'$scope',
	function ( $scope ) {		
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
				account.balance += parseInt(amount);
				account.operation = operation;
				account.owner_id = ownerId;
				account.receiver_id = receiverId;
				account.amount = Math.abs( amount );
				account.$update(); 
			})

			.then( function() {
				console.log('Operación realizada');
				return true;
			}, function() {
				console.log('Operación fallida');
				return false;
			});
		};

		$scope.activeAccount = function() {
			if ($scope.userAccount.status == 'Activa') return true;
			else return false;
		}

		$scope.sufficientFunds = function ( amount ) {
			if (( $scope.userAccount.balance - amount >= 0 )) return true;
			else return false;
		} 
		
		$scope.scopeLoad();
	}
])

.controller( 'account#edit-deposit', [
	'$cookies',
	'$scope',
	'Flash',
	function ( $cookies, $scope, Flash ) {
		
		$scope.updateDeposit = function ( amount ) {
			if ($scope.activeAccount()) {
				$scope.update( 'deposito', 
							   amount, 
							   $scope.userSession.id, 
							   $scope.userSession.id );
				$scope.userAccount.balance += parseInt(amount);
				$cookies.putObject( 'userAccount', $scope.userAccount );
				Flash.create( 'success', $scope.msg.dep200, 'success'  );
			} else {
				console.log( 'Cuenta bloqueada' );
				Flash.create( 'danger', $scope.msg.acc401, 'error'  );
			}
		}  
	}
])

.controller( 'account#edit-withdrawal', [
	'$cookies',
	'$scope',
	'Flash',
	function ( $cookies, $scope, Flash ) {
		
		$scope.updateWithdrawal = function ( amount ) {
			if ( $scope.activeAccount()) {
				if ( $scope.sufficientFunds ( amount )) { 
					$scope.update( 'retiro', 
								   -amount, 
								   $scope.userSession.id, 
								   $scope.userSession.id );
					$scope.userAccount.balance -= parseInt( amount );
					$cookies.putObject( 'userAccount', $scope.userAccount );
					Flash.create( 'success', $scope.msg.wit200, 'success' );
				} else {
					console.log ('Fondos insuficientes');
					Flash.create( 'danger', $scope.msg.fns401, 'error' );
				}
			} else {
				console.log( 'Cuenta bloqueada' );
				Flash.create( 'danger', $scope.msg.acc401, 'error'  );
			}
		}  
	}
])

.controller( 'account#edit-transfer', [
	'$cookies',
	'$scope',
	'BankAccount',
	'Flash',
	'input',
	'User',
	function ( $cookies, $scope, BankAccount, Flash, input, User ) {

		$scope.updateTransfer = function ( transferData ) {
			if ( $scope.activeAccount()) {
				if ( $scope.sufficientFunds ( transferData.amount )) {
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
							Flash.create( 'success', $scope.msg.trf200, 'success' );
						} ,function() {
							console.log('Destinatario sin cuenta bancaria');
							Flash.create( 'danger', $scope.msg.des404, 'error' );
						});								
					}, function() {
						console.log('Destinatario sin cuenta en WebForge');
						Flash.create( 'danger', $scope.msg.des404, 'error' );
					});
				} else {
					console.log ('Fondos insuficientes');
					Flash.create( 'danger', $scope.msg.fns401, 'error' );
				}
			} else {
				console.log( 'Cuenta bloqueada' );
				Flash.create( 'danger', $scope.msg.acc401, 'error'  );
			}	
		}
	}
])

.controller( 'account#edit-lock', [
	'$cookies',
	'$scope',
	'BankAccount',
	'Flash',
	function ( $cookies, $scope, BankAccount, Flash ) {

		$scope.enabled = $scope.activeAccount();

		$scope.updateLock = function() {
			var msg;
			BankAccount.get({ userId: $scope.userSession.id }).$promise
			.then( function ( account ) {
				if ($scope.enabled) {
					account.status = 'Bloqueada';
					account.operation = 'bloqueo de cuenta';
					msg = $scope.msg.lck200;
				} else { 
					account.status = 'Activa';
					account.operation = 'activación de cuenta';
					msg = $scope.msg.ulk200;
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
				Flash.create( 'danger', msg , 'success' );
				$scope.userAccount = account;
				$cookies.putObject('userAccount', $scope.userAccount );
				$scope.enabled = !$scope.enabled;
				
			}, function() {
				console.log('Operación fallida');
				Flash.create( 'danger', $scope.msg.lck400 , 'error' );
			})
		}
	}
])