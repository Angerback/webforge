angular.module('ngLatamInt', [])
.directive( 'ngLatamInt', [
    '$filter', 
    function( $filter ) {
    
    return {
        require: '^ngModel',
        restrict: 'A',
        link: function( scope, elem, attrs, ctrl ) {
            if ( !ctrl ) return;
           
            //Template -> Controller
            ctrl.$parsers.unshift( function ( viewValue ) {
                var plainNumber = viewValue.replace(/[^\d]/g, '');
                var dottedNumber = plainNumber + '';
                var rgx = /(\d+)(\d{3})/;
                while ( rgx.test( dottedNumber ) ) {
                    dottedNumber = dottedNumber.replace( rgx, '$1' + '.' + '$2' );
                }
                elem.val( dottedNumber );
                return plainNumber;
            });
        }
    };
}]);