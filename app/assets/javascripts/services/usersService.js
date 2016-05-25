
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

        s.editUser = function(nameUserEdit,emailUserEdit,rutUserEdit,user_typeUserEdit, suspendedUserEdit,selectedUserId){
            var obj = {"user":{"name":nameUserEdit,"email":emailUserEdit,"rut":rutUserEdit, "user_type":user_typeUserEdit, "suspended":suspendedUserEdit}};
            console.log(obj);
            return $http.put(urlBase + "/"  + selectedUserId, obj);
        };		 
            
            return s
    });
