angular.module('Session', [])

.factory("Session", ['$resource', function($resource) {
  return $resource('/api/v1/sessions/:userRut', { userRut: '@rut', format: 'json' }
  );
}]);