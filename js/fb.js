(function() {
  angular.module('thundurus').factory('fbFactory', function($rootScope) {
    var ref;
    return ref = new Firebase('https://thundurus.firebaseio.com/');
  });

}).call(this);
