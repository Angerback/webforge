
angular.module('webforge')
    .factory('usersService', function($http){
        var urlBase = '/api/v2/users';

				var s = {}

        s.getUsers = function(){
            return $http.get(urlBase);
        };
        s.getUser = function(userId){
            var str = urlBase + "/" + userId;
            console.log(str);
            return $http.get(urlBase + "/" + userId);
        };

				return s			 
    });
