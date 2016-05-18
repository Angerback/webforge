angular.module('utils', [])

.factory('input', function() {

	var input = {};
	
	// Deprecated
	input.isNumber = function ( number ) {
		var response;
		if ( typeof( number ) == "number" ) response = true;
		else response = false;
		return response; 	
	};

	// Deprecated
	input.isMail = function ( email ) {
		re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test( email );
	};

	input.urlFormat = function ( email ) {
		// Codificación UTF8
		return email.replace( /\./g, '%2E' );
	};

	input.clearForm = function () {
		for ( i = 0; i < arguments.length; i ++ ) arguments[i] = '';
	}

	input.rutValidation = function ( rut ) {
		var rutArray   = rut.replace( /\.|-/g, "" ).split("").reverse()
		 ,  sum		   = 0
		 ,  response   = false;

		if ( rutArray[0] == '0' ) rutArray[0] = '11';
		if ( rutArray[0].toLowerCase() == 'k') rutArray[0] = '10';

		for ( i = 1; i < rutArray.length; i++ ) {
			if ( i <= 6 ) sum += ( i + 1 ) * rutArray[i];
			else sum += ( i - 5 ) * rutArray[i];
		};

		if ( ( 11 - ( sum % 11 )) == rutArray[0] ) response = true;

		return response;
	}

	return input;
})