angular.module('WebforgeUser', [])
	.service('WebforgeUser', function($http, $resource){
		var baseUrl = "/api/v2/users";
		this.getUsers = function(){
			return $http.get(baseUrl);
	};
});

