angular.module('Record', [])

.factory("Record", ['$resource', function($resource) {
  return $resource('/api/v1/records/:ownerId', { ownerId: '@id', format: 'json' }
  );
}]);