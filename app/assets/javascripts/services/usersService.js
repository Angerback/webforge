angular.module('webforge')
    .service('usersService', function($http){
        var urlBase = '/api/v2/users';
        this.getUsers = function(){
            return $http.get(urlBase);
        };
        this.getUser = function(userId){
            var str = urlBase + "/" + userId;
            console.log(str);
            return $http.get(urlBase + "/" + userId);
        };
    });
