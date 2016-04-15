angular.module('User', [])

.factory("User", ['$resource', function($resource) {
  return $resource('/api/v1/users/:userRut', { userRut: '@rut', format: 'json' }
  );
}]);