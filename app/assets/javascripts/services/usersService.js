
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
			
        s.postUser = function(userName,emailUser,rutUser,passwordUser,user_typeUser,password_confirmationUser){
            return $http.post(urlBase + "/",{"user": {"name":userName,"email":emailUser,"rut":rutUser, "password": passwordUser, "user_type":user_typeUser, "password_confirmation":password_confirmationUser}});
        };    			 
            
            return s
    });
