(function() {
  angular.module('thundurus').factory('fbFactory', function($rootScope, $http) {
    var getTeams, ref;
    ref = new Firebase('https://thundurus.firebaseio.com/');
    return getTeams = function() {
      return $http.get(ref + 'users/' + user.uid + '/teams/.json');
    };
  });

}).call(this);
