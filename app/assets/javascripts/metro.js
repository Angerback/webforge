var metro = angular.module('metro',[
	'templates',
	'ui.router',
	'ngCookies',
	'ngResource',
	'ngMask',	
	'utils',
	'customCurrency',
	'flash',
	
	'ngLatamInt',
	'validators',

	'MetroAccountsController',
	'MetroApplicationController',
	'MetroLoginController',
	'MetroRecordsController',

	'BankAccount',
	'Record',
	'Session',
	'User',

]);

metro.config([ '$stateProvider', '$urlRouterProvider', 
  (function ( $stateProvider, $urlRouterProvider ) {

  	$urlRouterProvider.otherwise( '/login' );

  	$stateProvider

  	// Login
	.state('login', {
		abstract: true,
		templateUrl: 'metroTemplates/layouts/no-header.html',
		controller: 'ApplicationController'
	})
	.state('login.index', {
		url: '/login',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/login/index.html',
				controller: 'login#index'
			}
		}
	})

	// Application
	.state('app', {
		abstract: true,
		templateUrl: 'metroTemplates/layouts/application.html',
		controller: 'ApplicationController'
	})
	.state('app.accounts-show', {
		url: '/accounts/:id',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/accounts/show.html',
				controller: 'account#show'
			}
		}
	})		
	.state('app.accounts-edit-deposit', {
		url: '/accounts/:id/edit/deposit',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/accounts/edit-deposit.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-withdrawal', {
		url: '/accounts/:id/edit/withdrawal',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/accounts/edit-withdrawal.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-transfer', {
		url: '/accounts/:id/edit/transfer',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/accounts/edit-transfer.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-lock', {
		url: '/accounts/:id/edit/lock',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/accounts/edit-lock.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.records-index', {
		url: '/records',
		views: {
			'mainView': {
				templateUrl: 'metroTemplates/records/index.html',
				controller: 'record#index'
			}
		}
	})

})]);

var webforge = angular.module('webforge',[
	'templates',
	'ui.router',
	'ngCookies',
	'ngResource',
	'ngMask',	
	'utils',
	'customCurrency',
	'flash',
	
	'ngLatamInt',
	'validators',

	'WebforgeUsersController',	

	'WebforgeUser',

]);

webforge.config([ '$stateProvider', '$urlRouterProvider', 
  (function ( $stateProvider, $urlRouterProvider ) {

  	$stateProvider

  	// Login
	.state('users', {
		abstract: true,
		templateUrl: 'webforgeTemplates/layouts/no-header.html',
		controller: 'WebforgeUsersController'
	})
	.state('users.index', {
		url: '/users',
		views: {
			'mainView': {
				templateUrl: 'webforgeTemplates/users/index.html',
				controller: 'users#index'
			}
		}
	})
})]);
