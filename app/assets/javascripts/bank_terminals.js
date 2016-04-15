var bank_terminal = angular.module('bank_terminal',[
	'templates',
	'ui.router',
	'ngCookies',
	'ngResource',
	'utils',

	'AccountsController',
	'ApplicationController',
	'LoginController',
	'RecordsController',

	'BankAccount',
	'Record',
	'Session',
	'User',

]);

bank_terminal.config([ '$stateProvider', '$urlRouterProvider', 
  (function ( $stateProvider, $urlRouterProvider ) {

  	$urlRouterProvider.otherwise( '/login' );

  	$stateProvider

  	// Login
	.state('login', {
		abstract: true,
		templateUrl: 'layouts/no-header.html',
		controller: 'ApplicationController'
	})
	.state('login.index', {
		url: '/login',
		views: {
			'mainView': {
				templateUrl: 'login/index.html',
				controller: 'login#index'
			}
		}
	})

	// Application
	.state('app', {
		abstract: true,
		templateUrl: 'layouts/application.html',
		controller: 'ApplicationController'
	})
	.state('app.accounts-show', {
		url: '/accounts/:id',
		views: {
			'mainView': {
				templateUrl: 'accounts/show.html',
				controller: 'account#show'
			}
		}
	})		
	.state('app.accounts-edit-deposit', {
		url: '/accounts/:id/edit/deposit',
		views: {
			'mainView': {
				templateUrl: 'accounts/edit-deposit.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-withdrawal', {
		url: '/accounts/:id/edit/withdrawal',
		views: {
			'mainView': {
				templateUrl: 'accounts/edit-withdrawal.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-transfer', {
		url: '/accounts/:id/edit/transfer',
		views: {
			'mainView': {
				templateUrl: 'accounts/edit-transfer.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.accounts-edit-lock', {
		url: '/accounts/:id/edit/lock',
		views: {
			'mainView': {
				templateUrl: 'accounts/edit-lock.html',
				controller: 'account#edit'
			}
		}
	})
	.state('app.records-index', {
		url: '/records',
		views: {
			'mainView': {
				templateUrl: 'records/index.html',
				controller: 'record#index'
			}
		}
	})

})]);
 