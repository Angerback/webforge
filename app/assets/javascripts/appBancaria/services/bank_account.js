angular.module('BankAccount', [])

.factory("BankAccount", ['$resource', function($resource) {
  return $resource('/api/v1/bank_accounts/:userId', { userId: '@id', format: 'json' } , {
  	'update': { method: 'PUT' }
  });
}]);