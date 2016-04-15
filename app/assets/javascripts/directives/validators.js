angular.module('validators', [])
.directive( 'rut', function() {    
    return {
        require: '^ngModel',
        link: function( scope, elem, attrs, ctrl ) {
            ctrl.$validators.rut = function( modelValue, viewValue) {                
                var rut        = modelValue || " " 
                 ,  rutArray   = rut.replace( /\.|-/g, "" ).split("").reverse()
                 ,  sum        = 0
                 ,  digit      = '' 
                 ,  response   = false;

                for ( i = 1; i < rutArray.length; i++ ) {
                    if ( i <= 6 ) sum += ( i + 1 ) * rutArray[i];
                    else sum += ( i - 5 ) * rutArray[i];
                };
                
                digit = 11 - ( sum % 11 );
                if (digit == 11) digit = 0;
                if (digit == 10) digit = 'k';
                if ( digit == rutArray[0].toLowerCase() ) response = true;
                
                return response;
            }
        }
    };
})

.directive( 'positive', function() {
    return {
        require: 'ngModel',
        link: function( scope, elem, attrs, ctrl ) {
            ctrl.$validators.positive = function( modelValue, viewValue ) {
                var number = modelValue
                 ,  response = false;

                if (( modelValue == undefined ) || 
                    ( modelValue == '') ||
                    ( parseInt( modelValue ) > 0 )) response = true;
                return response;
            }
        }
    }
})